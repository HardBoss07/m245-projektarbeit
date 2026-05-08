use serde::Deserialize;

#[derive(Debug, Deserialize, Clone, Copy)]
pub struct Pagination {
    pub limit: Option<usize>,
    pub offset: Option<usize>,
}

impl Default for Pagination {
    fn default() -> Self {
        Self {
            limit: Some(50),
            offset: Some(0),
        }
    }
}

impl Pagination {
    pub fn limit(&self) -> i64 {
        self.limit.unwrap_or(50) as i64
    }

    pub fn offset(&self) -> i64 {
        self.offset.unwrap_or(0) as i64
    }
}
