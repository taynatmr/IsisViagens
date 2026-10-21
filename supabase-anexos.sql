-- ISIS Planner de Viagens: pasta privada para fotos e PDFs
insert into storage.buckets (id, name, public, file_size_limit)
values ('isis-viagens-anexos', 'isis-viagens-anexos', false, 15728640)
on conflict (id) do nothing;

create policy "viagens_anexos_le" on storage.objects
  for select to authenticated
  using (bucket_id = 'isis-viagens-anexos' and (storage.foldername(name))[1] = auth.uid()::text);

create policy "viagens_anexos_cria" on storage.objects
  for insert to authenticated
  with check (bucket_id = 'isis-viagens-anexos' and (storage.foldername(name))[1] = auth.uid()::text);

create policy "viagens_anexos_atualiza" on storage.objects
  for update to authenticated
  using (bucket_id = 'isis-viagens-anexos' and (storage.foldername(name))[1] = auth.uid()::text)
  with check (bucket_id = 'isis-viagens-anexos' and (storage.foldername(name))[1] = auth.uid()::text);

create policy "viagens_anexos_apaga" on storage.objects
  for delete to authenticated
  using (bucket_id = 'isis-viagens-anexos' and (storage.foldername(name))[1] = auth.uid()::text);
