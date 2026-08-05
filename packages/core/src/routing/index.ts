export type RoutingTarget = 'local' | 'hosted' | 'hybrid';

export const pickRoutingTarget = (mode: RoutingTarget): RoutingTarget => mode;
