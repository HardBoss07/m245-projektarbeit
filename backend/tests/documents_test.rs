use axum::{
    body::Body,
    http::{Request, StatusCode},
};
use http_body_util::BodyExt;
use moka::future::Cache;
use serde_json::Value;
use tower::ServiceExt;
use uuid::Uuid;
use wiss_estudio_backend::services::auth::create_token;
use wiss_estudio_backend::{AppState, create_app};

#[tokio::test]
async fn test_document_scoping_and_permissions() {
    dotenvy::dotenv().ok();
    let database_url = std::env::var("DATABASE_URL").expect("DATABASE_URL must be set");
    let pool = sqlx::PgPool::connect(&database_url).await.unwrap();
    let jwt_secret = "test-secret";

    let student1_id = Uuid::new_v4();
    let student2_id = Uuid::new_v4();
    let teacher_id = Uuid::new_v4();

    // Setup: Create users
    sqlx::query!(
        "INSERT INTO users (id, email, first_name, last_name) VALUES ($1, $2, $3, $4)",
        student1_id,
        format!("s1-{}@test.com", student1_id),
        "Student",
        "One"
    )
    .execute(&pool)
    .await
    .unwrap();
    sqlx::query!(
        "INSERT INTO users (id, email, first_name, last_name) VALUES ($1, $2, $3, $4)",
        student2_id,
        format!("s2-{}@test.com", student2_id),
        "Student",
        "Two"
    )
    .execute(&pool)
    .await
    .unwrap();
    sqlx::query!(
        "INSERT INTO users (id, email, first_name, last_name) VALUES ($1, $2, $3, $4)",
        teacher_id,
        format!("t-{}@test.com", teacher_id),
        "Teacher",
        "One"
    )
    .execute(&pool)
    .await
    .unwrap();

    // Setup: Create documents
    let doc_gen_id = Uuid::new_v4();
    let doc_pers_id = Uuid::new_v4();

    sqlx::query!(
        "INSERT INTO documents (id, designation, file_path, document_type) VALUES ($1, $2, $3, 'GENERAL')",
        doc_gen_id, "General Rules", "uploads/rules.pdf"
    ).execute(&pool).await.unwrap();

    sqlx::query!(
        "INSERT INTO documents (id, designation, file_path, document_type, target_user_id) VALUES ($1, $2, $3, 'PERSONAL', $4)",
        doc_pers_id, "S1 Private", "uploads/s1.pdf", student1_id
    ).execute(&pool).await.unwrap();

    let cache = Cache::builder().build();
    let state = AppState {
        db: pool,
        jwt_secret: jwt_secret.to_string(),
        cache,
    };
    let app = create_app(state).await;

    // Scenario 1: Student 1 lists documents. Should see both (General + their Personal).
    let token1 = create_token(student1_id, "Lernende", jwt_secret).unwrap();
    let resp = app
        .clone()
        .oneshot(
            Request::builder()
                .uri("/api/v1/documents?limit=10&offset=0")
                .header("Authorization", format!("Bearer {}", token1))
                .body(Body::empty())
                .unwrap(),
        )
        .await
        .unwrap();
    assert_eq!(resp.status(), StatusCode::OK);
    let body = resp.into_body().collect().await.unwrap().to_bytes();
    let docs: Value = serde_json::from_slice(&body).unwrap();
    assert_eq!(docs.as_array().unwrap().len(), 2);

    // Scenario 2: Student 2 lists documents. Should ONLY see the General one.
    let token2 = create_token(student2_id, "Lernende", jwt_secret).unwrap();
    let resp = app
        .clone()
        .oneshot(
            Request::builder()
                .uri("/api/v1/documents?limit=10&offset=0")
                .header("Authorization", format!("Bearer {}", token2))
                .body(Body::empty())
                .unwrap(),
        )
        .await
        .unwrap();
    assert_eq!(resp.status(), StatusCode::OK);
    let body = resp.into_body().collect().await.unwrap().to_bytes();
    let docs: Value = serde_json::from_slice(&body).unwrap();
    assert_eq!(docs.as_array().unwrap().len(), 1);
    assert_eq!(docs[0]["designation"], "General Rules");

    // Scenario 3: Student 2 tries to download Student 1's personal doc. Should be Forbidden.
    let resp = app
        .clone()
        .oneshot(
            Request::builder()
                .uri(format!("/api/v1/documents/{}", doc_pers_id))
                .header("Authorization", format!("Bearer {}", token2))
                .body(Body::empty())
                .unwrap(),
        )
        .await
        .unwrap();
    assert_eq!(resp.status(), StatusCode::FORBIDDEN);
}

#[tokio::test]
async fn test_multipart_upload_rbac() {
    dotenvy::dotenv().ok();
    let database_url = std::env::var("DATABASE_URL").expect("DATABASE_URL must be set");
    let pool = sqlx::PgPool::connect(&database_url).await.unwrap();
    let jwt_secret = "test-secret";

    let student_id = Uuid::new_v4();
    let _teacher_id = Uuid::new_v4();

    let cache = Cache::builder().build();
    let state = AppState {
        db: pool,
        jwt_secret: jwt_secret.to_string(),
        cache,
    };
    let app = create_app(state).await;

    // Scenario 1: Student tries to upload a document. Should be Forbidden (assuming only staff can upload).
    let student_token = create_token(student_id, "Lernende", jwt_secret).unwrap();

    // We'll skip the actual multipart body construction for now as it's complex in tests,
    // but the RBAC should trigger first anyway.
    let resp = app
        .clone()
        .oneshot(
            Request::builder()
                .method("POST")
                .uri("/api/v1/documents")
                .header("Authorization", format!("Bearer {}", student_token))
                .header(
                    "Content-Type",
                    "multipart/form-data; boundary=X-INSOMNIA-BOUNDARY",
                )
                .body(Body::empty())
                .unwrap(),
        )
        .await
        .unwrap();

    // Even with empty body, the RequireRole or handler check should catch it.
    assert_eq!(resp.status(), StatusCode::FORBIDDEN);
}
