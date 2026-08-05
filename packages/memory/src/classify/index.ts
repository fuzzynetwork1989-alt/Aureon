export const classifyMemory = (content: Record<string, unknown>): string =>
  'workspace' in content ? 'workspace' : 'semantic';
