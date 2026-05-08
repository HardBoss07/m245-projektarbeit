use crate::AppState;
use crate::handlers::documents::{download_document, list_documents, upload_document};
use axum::{
    Router,
    routing::{get, post},
};

pub fn router() -> Router<AppState> {
    Router::new()
        .route("/", get(list_documents))
        .route("/", post(upload_document))
        .route("/:id", get(download_document))
}
