export interface ApiResponse<T> {
  data: T;
  error: null | string;
}

export interface PaginatedResponse<T> {
  data: T[];
  nextCursor: string | null;
}
