export interface MemoryScore {
  id: string;
  score: number;
}

export const rankMemories = (items: MemoryScore[]) => [...items].sort((a, b) => b.score - a.score);
