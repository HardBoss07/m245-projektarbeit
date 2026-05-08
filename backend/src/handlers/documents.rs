use crate::AppState;
use crate::errors::AppError;
use crate::middleware::auth::check_role;
use crate::models::pagination::Pagination;
use crate::models::{Document, DocumentType};
use crate::services::auth::Claims;
use axum::body::Body;
use axum::{
    Json,
    extract::{Path, Query, State},
    response::IntoResponse,
};
use axum_extra::extract::Multipart;
use serde::Serialize;
use tokio::fs::File;
use tokio_util::io::ReaderStream;
use uuid::Uuid;

#[derive(Debug, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct DocumentResponse {
    pub id: Uuid,
    pub designation: String,
    pub document_type: DocumentType,
    pub modified_at: Option<chrono::DateTime<chrono::Utc>>,
}

impl From<Document> for DocumentResponse {
    fn from(doc: Document) -> Self {
        Self {
            id: doc.id,
            designation: doc.designation,
            document_type: doc.document_type,
            modified_at: doc.modified_at,
        }
    }
}

/// GET /api/v1/documents
/// Lists documents accessible to the current user.
pub async fn list_documents(
    State(state): State<AppState>,
    claims: Claims,
    Query(pagination): Query<Pagination>,
) -> Result<Json<Vec<DocumentResponse>>, AppError> {
    let docs: Vec<Document> = sqlx::query_as!(
        Document,
        r#"
        SELECT 
            id, 
            designation, 
            file_path, 
            document_type as "document_type: DocumentType", 
            target_user_id, 
            modified_by, 
            modified_at
        FROM documents
        WHERE document_type = 'GENERAL' OR target_user_id = $1
        ORDER BY modified_at DESC
        LIMIT $2 OFFSET $3
        "#,
        claims.sub,
        pagination.limit(),
        pagination.offset()
    )
    .fetch_all(&state.db)
    .await?;

    let response = docs.into_iter().map(Into::into).collect();
    Ok(Json(response))
}

/// POST /api/v1/documents
/// Uploads a new document. Only accessible by teachers (Dozenten).
pub async fn upload_document(
    State(state): State<AppState>,
    claims: Claims,
    mut multipart: Multipart,
) -> Result<impl IntoResponse, AppError> {
    check_role(&claims, "Dozent")?;

    let mut designation = None;
    let mut target_user_id = None;
    let mut doc_type = DocumentType::General;
    let mut file_path = None;

    while let Some(field) = multipart
        .next_field()
        .await
        .map_err(|e| AppError::BadRequest(e.to_string()))?
    {
        let name = field.name().unwrap_or_default().to_string();
        match name.as_str() {
            "designation" => {
                designation = Some(
                    field
                        .text()
                        .await
                        .map_err(|e| AppError::BadRequest(e.to_string()))?,
                )
            }
            "targetUserId" => {
                let text = field
                    .text()
                    .await
                    .map_err(|e| AppError::BadRequest(e.to_string()))?;
                target_user_id = Uuid::parse_str(&text).ok();
            }
            "documentType" => {
                let t = field
                    .text()
                    .await
                    .map_err(|e| AppError::BadRequest(e.to_string()))?;
                doc_type = if t == "PERSONAL" {
                    DocumentType::Personal
                } else {
                    DocumentType::General
                };
            }
            "file" => {
                let filename = field.file_name().unwrap_or("unnamed").to_string();
                let doc_id = Uuid::new_v4();
                let path = format!("uploads/{}_{}", doc_id, filename);

                // Ensure directory exists
                tokio::fs::create_dir_all("uploads")
                    .await
                    .map_err(|e| AppError::Internal(anyhow::anyhow!(e)))?;

                let data = field
                    .bytes()
                    .await
                    .map_err(|e| AppError::BadRequest(e.to_string()))?;
                tokio::fs::write(&path, data)
                    .await
                    .map_err(|e| AppError::Internal(anyhow::anyhow!(e)))?;

                file_path = Some(path);
            }
            _ => {}
        }
    }

    let designation =
        designation.ok_or_else(|| AppError::BadRequest("Missing designation".to_string()))?;
    let file_path = file_path.ok_or_else(|| AppError::BadRequest("Missing file".to_string()))?;

    sqlx::query!(
        r#"
        INSERT INTO documents (designation, file_path, document_type, target_user_id, modified_by)
        VALUES ($1, $2, $3, $4, $5)
        "#,
        designation,
        file_path,
        doc_type as DocumentType,
        target_user_id,
        claims.sub
    )
    .execute(&state.db)
    .await?;

    Ok(axum::http::StatusCode::CREATED)
}

/// GET /api/v1/documents/:id
/// Streams the document file if the user has permission.
pub async fn download_document(
    State(state): State<AppState>,
    claims: Claims,
    Path(id): Path<Uuid>,
) -> Result<impl IntoResponse, AppError> {
    let doc_opt: Option<Document> = sqlx::query_as!(
        Document,
        r#"
        SELECT 
            id, 
            designation, 
            file_path, 
            document_type as "document_type: DocumentType", 
            target_user_id, 
            modified_by, 
            modified_at
        FROM documents 
        WHERE id = $1
        "#,
        id
    )
    .fetch_optional(&state.db)
    .await?;

    let doc = doc_opt.ok_or_else(|| AppError::NotFound("Document not found".to_string()))?;

    // Permission check
    if doc.document_type == DocumentType::Personal
        && doc.target_user_id != Some(claims.sub)
        && doc.modified_by != Some(claims.sub)
    {
        if claims.role != "Admin" {
            return Err(AppError::Forbidden);
        }
    }

    let file: File = File::open(&doc.file_path)
        .await
        .map_err(|_| AppError::NotFound("File not found on disk".to_string()))?;
    let stream = ReaderStream::new(file);
    let body = Body::from_stream(stream);

    Ok(body)
}
