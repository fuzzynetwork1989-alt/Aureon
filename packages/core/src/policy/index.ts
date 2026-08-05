export type RiskLevel = 'low' | 'medium' | 'high' | 'critical';

export const isApprovalRequired = (level: RiskLevel): boolean => level === 'high' || level === 'critical';
