# Database Schema Documentation

## Tables

| Table            | Column(s)                        | Type                          | Rationale                                              |
| :--------------- | :------------------------------- | :---------------------------- | :----------------------------------------------------- |
| `users`          | `id`, `email`, `role`            | `UUID`, `String`, `Enum`      | Core identity storage with RBAC support.               |
| `exam_results`   | `id`, `grade`, `student_id`      | `UUID`, `Decimal`, `UUID`     | Stores normalized grade entries linked to users.       |
| `refresh_tokens` | `id`, `token_hash`, `expires_at` | `UUID`, `String`, `Timestamp` | Secure session management for the dual-token strategy. |

## Design Rationale

- **Normalization**: Tables are structured in 3NF to ensure data consistency and minimize redundancy.
- **Foreign Keys**: Enforced at the database level using `UUID` types to maintain relational integrity between users, exams, and subjects.
- **Indexes**: Strategic indexing on foreign keys (e.g., `student_id`) optimizes high-frequency queries like grade retrieval.
