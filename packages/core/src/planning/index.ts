export interface PlanStep {
  id: string;
  title: string;
  status: 'todo' | 'doing' | 'done';
}

export interface Plan {
  title: string;
  steps: PlanStep[];
}

export const createPlan = (title: string, steps: string[]): Plan => ({
  title,
  steps: steps.map((step, index) => ({ id: `${index + 1}`, title: step, status: 'todo' }))
});
