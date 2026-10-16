create table if not exists public.tasks (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  title text not null check (char_length(title) between 1 and 90),
  description text not null default '' check (char_length(description) <= 280),
  category text not null default 'verde' check (category in ('verde', 'azul', 'terracota', 'amarelo', 'rosa')),
  status text not null default 'todo' check (status in ('todo', 'doing', 'done')),
  date_label text not null default '',
  created_at timestamptz not null default now()
);

alter table public.tasks enable row level security;

grant usage on schema public to authenticated;
grant select, insert, update, delete on table public.tasks to authenticated;

drop policy if exists "Users can read their own tasks" on public.tasks;
drop policy if exists "Users can create their own tasks" on public.tasks;
drop policy if exists "Users can update their own tasks" on public.tasks;
drop policy if exists "Users can delete their own tasks" on public.tasks;

create policy "Users can read their own tasks"
on public.tasks for select to authenticated
using ((select auth.uid()) = user_id);

create policy "Users can create their own tasks"
on public.tasks for insert to authenticated
with check ((select auth.uid()) = user_id);

create policy "Users can update their own tasks"
on public.tasks for update to authenticated
using ((select auth.uid()) = user_id)
with check ((select auth.uid()) = user_id);

create policy "Users can delete their own tasks"
on public.tasks for delete to authenticated
using ((select auth.uid()) = user_id);
