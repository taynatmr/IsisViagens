# ISIS — Planner de Viagens (com Supabase)

Site de um arquivo só (`index.html`). Os dados ficam no navegador e, depois do login, são salvos automaticamente na sua conta do **Supabase** (acessível de qualquer aparelho).

## Parte A — Criar o projeto no Supabase

1. Acesse https://supabase.com e entre (pode ser com o GitHub).
2. Clique em **New project**. Dê um nome (ex.: `isis-planner`), crie uma senha forte para o banco (guarde-a) e escolha a região **South America (São Paulo)**. Aguarde 1 a 2 minutos.
3. No menu lateral, abra **SQL Editor → New query**, cole o conteúdo do arquivo `supabase.sql` e clique em **Run**. Isso cria a tabela `isis_viagens_data` com proteção por usuário (cada pessoa só enxerga os próprios dados).
4. Vá em **Authentication → Providers** e confirme que **Email** está ativo.
   - Para testar mais rápido, em **Authentication → Sign In / Providers → Email** você pode desligar **Confirm email**. Se deixar ligado, o primeiro cadastro exige clicar no link enviado por e-mail.
5. Vá em **Project Settings → API** e copie:
   - **Project URL** (ex.: `https://abcdefgh.supabase.co`)
   - a chave **anon** (ou **publishable**). Essa chave é pública por desenho; a segurança vem das regras do passo 3. **Nunca use a chave `service_role`.**

## Parte A2 — Fotos e PDFs (Storage)

6. No **SQL Editor → New query**, cole o conteúdo de `supabase-anexos.sql` e clique em **Run**. Isso cria a pasta privada `isis-viagens-anexos` (limite de 15 MB por arquivo) e as regras para cada usuário acessar só os próprios arquivos.
7. Pronto: ao entrar na conta, os anexos já existentes neste aparelho são enviados, e os novos vão direto para a nuvem. Fotos grandes são reduzidas (lado maior de 1800 px) antes do envio.

## Parte B — Publicar no GitHub Pages

6. Em https://github.com, crie o repositório **público** `isis-planner`.
7. Envie `index.html`, `supabase.sql` e `README.md` com **uploading an existing file** e confirme em **Commit changes**.
8. **Settings → Pages → Deploy from a branch → `main` / `(root)` → Save**.
9. Em 1 a 2 minutos o site abre em `https://SEU-USUARIO.github.io/isis-planner/`.

## Parte C — Autorizar o endereço do site

10. No Supabase, vá em **Authentication → URL Configuration**:
    - **Site URL**: `https://SEU-USUARIO.github.io/isis-planner/`
    - Em **Redirect URLs**, adicione o mesmo endereço.

## Parte D — Usar

11. Abra o site → menu **☁️ Nuvem (Supabase)**.
12. Cole a **Project URL** e a **chave anon** e clique em **Salvar**.
13. Informe e-mail e senha e clique em **Criar conta** (depois, **Entrar**).
14. Pronto: cada alteração é enviada sozinha. Em outro aparelho, repita os passos 11 a 13 e entre com a mesma conta; os dados são carregados.

## Trazer os dados que você já tem

No link do Claude: **Minhas viagens → Backup dos dados → Copiar**. No site novo, cole o texto no mesmo lugar e clique em **Importar**. Depois entre na Nuvem: os dados são enviados.

## Dica: embutir a configuração

Se não quiser colar a URL e a chave em cada aparelho, abra o `index.html` em um editor, preencha `const SB_URL='...',SB_KEY='...'` (início do bloco da nuvem) e envie de novo ao GitHub.

## Limites

- O plano gratuito do Supabase tem cerca de 1 GB de armazenamento de arquivos. Anexos que estão só em outro aparelho precisam ser enviados por ele (botão **Enviar agora**).
- Se houver dados diferentes no aparelho e na nuvem, o site não sobrescreve sozinho: use **Enviar agora** ou **Restaurar da nuvem**.
- O plano gratuito do Supabase pausa projetos sem uso por cerca de 7 dias; basta reativar no painel.
