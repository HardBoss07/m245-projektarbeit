import { User, Document } from '../models';

export interface UserResponse {
  user: User;
}

export interface DocumentListResponse {
  documents: Document[];
  total: number;
}
