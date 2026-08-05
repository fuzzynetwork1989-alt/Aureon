export type RiskLevel = 'low' | 'medium' | 'high' | 'critical';

export const classifyRisk = (actionType: string): RiskLevel => {
  const dangerous = ['delete', 'send', 'deploy', 'publish', 'purchase'];
  return dangerous.some((keyword) => actionType.includes(keyword)) ? 'high' : 'low';
};
