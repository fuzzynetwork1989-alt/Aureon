export type MemoryType = 'preference' | 'episodic' | 'semantic' | 'procedural' | 'workspace' | 'ephemeral';

export interface MemoryInput {
  type: MemoryType;
  content: Record<string, unknown>;
  tags?: string[];
  importance?: number;
  expiresAt?: string | null;
}
