create table if not exists public.memories (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.users(id) on delete cascade,
  workspace_id uuid references public.workspaces(id) on delete set null,
  type text not null,
  content jsonb not null,
  tags text[] not null default '{}',
  importance numeric(5,2) not null default 0,
  expires_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.memory_embeddings (
  id uuid primary key default gen_random_uuid(),
  memory_id uuid not null references public.memories(id) on delete cascade,
  embedding vector(1536) not null,
  model text not null,
  created_at timestamptz not null default now()
);

create index if not exists idx_memories_user_id on public.memories(user_id);
create index if not exists idx_memories_workspace_id on public.memories(workspace_id);
create index if not exists idx_memory_embeddings_memory_id on public.memory_embeddings(memory_id);
