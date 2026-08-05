export type PlatformName = 'web' | 'desktop' | 'mobile' | 'api';

export type UUID = string;

export interface BaseEntity {
  id: UUID;
  createdAt: string;
  updatedAt?: string;
}
