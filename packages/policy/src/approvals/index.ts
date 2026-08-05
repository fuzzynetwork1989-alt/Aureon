export interface ApprovalDecision {
  approved: boolean;
  reason?: string;
}

export const requireApproval = (approved: boolean, reason?: string): ApprovalDecision => ({ approved, reason });
