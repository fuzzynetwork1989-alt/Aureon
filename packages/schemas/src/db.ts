export interface UserRecord {
  id: string;
  email: string;
  name: string | null;
  avatar_url: string | null;
  created_at: string;
  updated_at: string;
}

export interface WorkspaceRecord {
  id: string;
  user_id: string;
  name: string;
  description: string | null;
  status: string;
  created_at: string;
  updated_at: string;
}

export interface MemoryRecord {
  id: string;
  user_id: string;
  workspace_id: string | null;
  type: string;
  content: Record<string, unknown>;
  tags: string[];
  importance: number;
  expires_at: string | null;
  created_at: string;
  updated_at: string;
}
