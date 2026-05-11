use rust_decimal::Decimal;
use serde::{Deserialize, Serialize};
use uuid::Uuid;

#[derive(Debug, Serialize, Deserialize, sqlx::FromRow)]
#[serde(rename_all = "camelCase")]
pub struct GradeResponse {
    pub id: Uuid,
    pub subject: String,
    pub grade: Decimal,
    pub weight: Decimal,
    pub description: String,
}

#[derive(Debug, Deserialize)]
pub struct UpdateGradeRequest {
    pub grade: Decimal,
}
