export interface MemoryCreatedEvent {
  memoryId: string;
  userId: string;
  workspaceId: string | null;
}

export interface TaskCreatedEvent {
  taskId: string;
  threadId: string;
}
