export interface AuditEntry {
  eventType: string;
  payload: Record<string, unknown>;
}

export const createAuditEntry = (eventType: string, payload: Record<string, unknown>): AuditEntry => ({
  eventType,
  payload
});
