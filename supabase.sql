-- ISIS Planner de Viagens: tabela de dados por usuário
create table if not exists public.planner_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.planner_data enable row level security;

create policy "le_proprios_dados" on public.planner_data
  for select to authenticated using (auth.uid() = user_id);

create policy "cria_proprios_dados" on public.planner_data
  for insert to authenticated with check (auth.uid() = user_id);

create policy "atualiza_proprios_dados" on public.planner_data
  for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "apaga_proprios_dados" on public.planner_data
  for delete to authenticated using (auth.uid() = user_id);
