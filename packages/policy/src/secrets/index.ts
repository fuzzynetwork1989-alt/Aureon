export const isSecretKey = (key: string): boolean => /key|token|secret|password/i.test(key);
