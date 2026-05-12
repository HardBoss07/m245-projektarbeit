use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize)]
pub struct Pagination {
    #[serde(default = "default_limit")]
    pub limit: i64,
    #[serde(default = "default_offset")]
    pub offset: i64,
}

fn default_limit() -> i64 {
    50
}

fn default_offset() -> i64 {
    0
}

impl Pagination {
    pub fn limit(&self) -> i64 {
        self.limit
    }
    pub fn offset(&self) -> i64 {
        self.offset
    }
}
