use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize)]
pub struct Pagination {
    pub limit: i64,
    pub offset: i64,
}

impl Pagination {
    pub fn limit(&self) -> i64 {
        self.limit
    }
    pub fn offset(&self) -> i64 {
        self.offset
    }
}
