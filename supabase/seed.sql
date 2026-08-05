insert into public.preferences (user_id, tone, verbosity, default_workspace, privacy_level, autonomy_level)
values ('00000000-0000-0000-0000-000000000001', 'direct', 'concise', null, 'private', 'guided')
on conflict do nothing;
