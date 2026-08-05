create table if not exists public.checkpoints (
  id uuid primary key default gen_random_uuid(),
  session_id uuid not null references public.sessions(id) on delete cascade,
  thread_id uuid references public.intent_threads(id) on delete set null,
  state_snapshot jsonb not null,
  created_at timestamptz not null default now()
);

alter table public.sessions
  add constraint sessions_checkpoint_fk foreign key (checkpoint_id) references public.checkpoints(id) on delete set null;

create index if not exists idx_checkpoints_session_id on public.checkpoints(session_id);
