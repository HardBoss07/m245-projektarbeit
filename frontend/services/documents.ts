import { fetchClient } from '@/lib/fetchClient';
import { Document } from '@/types/api';

export const documentService = {
  async getDocuments(): Promise<Document[]> {
    return fetchClient<Document[]>('/documents');
  },

  async uploadDocument(formData: FormData): Promise<void> {
    return fetchClient<void>('/documents', {
      method: 'POST',
      body: formData, // fetchClient handles removing Content-Type for FormData
    });
  },

  getDocumentUrl(id: string): string {
    return `/api/v1/documents/${id}`;
  },
};
