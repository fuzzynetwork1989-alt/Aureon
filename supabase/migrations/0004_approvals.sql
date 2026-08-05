create table if not exists public.approvals (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.users(id) on delete cascade,
  action_type text not null,
  target text not null,
  risk_level text not null,
  status text not null default 'pending',
  approved_at timestamptz,
  declined_at timestamptz,
  created_at timestamptz not null default now()
);

create index if not exists idx_approvals_user_id on public.approvals(user_id);
create index if not exists idx_approvals_status on public.approvals(status);
