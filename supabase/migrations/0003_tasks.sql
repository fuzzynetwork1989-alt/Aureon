create table if not exists public.intent_threads (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.users(id) on delete cascade,
  title text not null,
  summary text,
  status text not null default 'active',
  priority integer not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.cognition_cells (
  id uuid primary key default gen_random_uuid(),
  thread_id uuid not null references public.intent_threads(id) on delete cascade,
  parent_cell_id uuid references public.cognition_cells(id) on delete set null,
  intent text not null,
  context jsonb not null default '{}'::jsonb,
  reasoning_state jsonb not null default '{}'::jsonb,
  action_state jsonb not null default '{}'::jsonb,
  verification_state jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create table if not exists public.tasks (
  id uuid primary key default gen_random_uuid(),
  thread_id uuid not null references public.intent_threads(id) on delete cascade,
  title text not null,
  description text,
  status text not null default 'todo',
  assignee_type text not null default 'system',
  priority integer not null default 0,
  due_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.task_events (
  id uuid primary key default gen_random_uuid(),
  task_id uuid not null references public.tasks(id) on delete cascade,
  event_type text not null,
  payload jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);

create index if not exists idx_threads_user_id on public.intent_threads(user_id);
create index if not exists idx_cells_thread_id on public.cognition_cells(thread_id);
create index if not exists idx_tasks_thread_id on public.tasks(thread_id);
