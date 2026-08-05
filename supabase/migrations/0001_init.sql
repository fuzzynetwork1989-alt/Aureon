create extension if not exists "pgcrypto";
create extension if not exists vector;

create table if not exists public.users (
  id uuid primary key default gen_random_uuid(),
  email text unique not null,
  name text,
  avatar_url text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.devices (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.users(id) on delete cascade,
  platform text not null,
  name text not null,
  trusted boolean not null default false,
  last_seen_at timestamptz,
  created_at timestamptz not null default now()
);

create table if not exists public.sessions (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.users(id) on delete cascade,
  device_id uuid references public.devices(id) on delete set null,
  status text not null default 'active',
  started_at timestamptz not null default now(),
  ended_at timestamptz,
  checkpoint_id uuid
);

create table if not exists public.workspaces (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.users(id) on delete cascade,
  name text not null,
  description text,
  status text not null default 'active',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.preferences (
  user_id uuid primary key references public.users(id) on delete cascade,
  tone text not null default 'direct',
  verbosity text not null default 'balanced',
  default_workspace uuid references public.workspaces(id) on delete set null,
  privacy_level text not null default 'private',
  autonomy_level text not null default 'guided',
  updated_at timestamptz not null default now()
);

create index if not exists idx_devices_user_id on public.devices(user_id);
create index if not exists idx_sessions_user_id on public.sessions(user_id);
create index if not exists idx_workspaces_user_id on public.workspaces(user_id);
