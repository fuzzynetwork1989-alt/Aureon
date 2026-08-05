export type AureonEventType =
  | 'session.started'
  | 'session.ended'
  | 'memory.created'
  | 'task.created'
  | 'task.updated'
  | 'approval.requested'
  | 'approval.granted'
  | 'approval.denied'
  | 'checkpoint.created'
  | 'workflow.recovered';

export interface AureonEvent<TPayload = Record<string, unknown>> {
  id: string;
  type: AureonEventType;
  payload: TPayload;
  createdAt: string;
}
