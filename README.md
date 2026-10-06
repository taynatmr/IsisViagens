# ISIS — Planner de Viagens

Site de um arquivo só (`index.html`), sem servidor. Os dados ficam no navegador e podem ser salvos também no **Google Drive**.

## Parte A — Publicar no GitHub Pages

1. Crie uma conta em https://github.com (se ainda não tiver).
2. Clique em **New repository**. Nome: `isis-planner`. Marque **Public** (o GitHub Pages gratuito exige repositório público). Clique em **Create repository**.
   - O repositório público mostra só o código do site. **Seus dados de viagem não ficam no GitHub**: ficam no seu navegador e no seu Drive.
3. Na página do repositório, clique em **uploading an existing file**, arraste `index.html` e `README.md` e clique em **Commit changes**.
4. Vá em **Settings → Pages**. Em **Build and deployment → Source**, escolha **Deploy from a branch**. Em **Branch**, escolha `main` e `/ (root)` e clique em **Save**.
5. Espere 1 a 2 minutos. O endereço será `https://SEU-USUARIO.github.io/isis-planner/`.

## Parte B — Ligar ao Google Drive

6. Acesse https://console.cloud.google.com e crie um projeto (ex.: `ISIS Planner`).
7. Em **APIs e serviços → Biblioteca**, procure **Google Drive API** e clique em **Ativar**.
8. Em **APIs e serviços → Tela de consentimento OAuth** (ou **Google Auth Platform**):
   - Tipo de usuário: **Externo**. Nome do app: `ISIS`. Informe seu e-mail.
   - Em **Usuários de teste**, adicione seu e-mail (e o de quem mais for usar).
9. Em **Credenciais → Criar credenciais → ID do cliente OAuth**:
   - Tipo de aplicativo: **Aplicativo da Web**.
   - Em **Origens JavaScript autorizadas**, adicione `https://SEU-USUARIO.github.io` (sem barra no final e sem `/isis-planner`).
   - Clique em **Criar** e copie o **ID do cliente** (termina com `.apps.googleusercontent.com`).
10. Abra o site → menu **☁️ Google Drive** → cole o ID do cliente → **Salvar Client ID** → **Salvar no Drive agora**.
11. Escolha sua conta e autorize. Se aparecer "app não verificado", clique em **Avançado → Acessar ISIS**.
12. Pronto: o arquivo `isis-planner-backup.json` aparece no seu **Meu Drive**. Depois de conectado, cada alteração é enviada sozinha.

## Trazer os dados que você já tem

No link do Claude: **Minhas viagens → Backup dos dados → Copiar**. No site do GitHub: **Minhas viagens → Backup dos dados**, cole o texto e clique em **Importar**. Depois use **Salvar no Drive agora**.

## Usar em outro aparelho

Abra o site → **☁️ Google Drive** → cole o ID do cliente → **Restaurar do Drive**.

## Atualizar o site

No repositório, **Add file → Upload files** e envie o novo `index.html` com o mesmo nome.

## Limites

- A conexão com o Drive dura cerca de 1 hora; para reconectar, clique em **Salvar no Drive agora**.
- Fotos e PDFs anexados ficam só no navegador e não vão para o Drive.
- Sem o Drive configurado, use **Minhas viagens → Backup dos dados** para copiar o texto e guardá-lo (por exemplo, num documento do Drive).
