export interface CapturedMemory {
  type: string;
  content: Record<string, unknown>;
  importance: number;
}

export const captureMemory = (content: Record<string, unknown>): CapturedMemory => ({
  type: 'episodic',
  content,
  importance: 0.5
});
