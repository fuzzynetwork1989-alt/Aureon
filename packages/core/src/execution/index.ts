export interface ExecutionResult {
  ok: boolean;
  message: string;
}

export const executeStep = async (title: string): Promise<ExecutionResult> => ({
  ok: true,
  message: `Executed: ${title}`
});
