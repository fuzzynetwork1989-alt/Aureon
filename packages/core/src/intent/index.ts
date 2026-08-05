export interface ParsedIntent {
  threadTitle: string;
  summary: string;
  priority: number;
  tags: string[];
}

export const parseIntent = (input: string): ParsedIntent => ({
  threadTitle: input.slice(0, 60),
  summary: input,
  priority: 1,
  tags: []
});
