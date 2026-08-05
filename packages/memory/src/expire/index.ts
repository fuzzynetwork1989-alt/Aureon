export const isExpired = (expiresAt: string | null): boolean =>
  !!expiresAt && new Date(expiresAt).getTime() < Date.now();
