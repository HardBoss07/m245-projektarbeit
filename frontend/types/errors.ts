export namespace AppError {
  export type ErrorCode =
    | 'DATABASE_ERROR'
    | 'UNAUTHORIZED'
    | 'FORBIDDEN'
    | 'NOT_FOUND'
    | 'CONFLICT'
    | 'INTERNAL'
    | 'BAD_REQUEST'
    | 'VALIDATION_ERROR';

  export interface ErrorResponse {
    error: string;
    code: ErrorCode;
  }
}
