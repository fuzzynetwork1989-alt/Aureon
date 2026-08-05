export interface RecoveryCheckpoint {
  id: string;
  createdAt: string;
}

export const resumeFromCheckpoint = (checkpoint: RecoveryCheckpoint) => checkpoint;
