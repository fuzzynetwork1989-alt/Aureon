export interface MemoryRankResult {
  id: string;
  score: number;
}

export const rankMemory = (scores: MemoryRankResult[]) =>
  [...scores].sort((a, b) => b.score - a.score);
