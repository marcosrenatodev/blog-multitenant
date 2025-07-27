[![CI](https://github.com/marcosrenatodev/blog-multitenant/actions/workflows/ci.yml/badge.svg)](https://github.com/marcosrenatodev/blog-multitenant/actions/workflows/ci.yml)
## Setup rápido

```bash
git clone git@github.com:seu-org/blog-multitenant.git
cd blog-multitenant
cp .env.example .env
docker compose up -d
open http://localhost
```
## 🛠️ Configuração Local

### Pipeline de CI Local

```bash
chmod +x bin/ci-local
./bin/ci-local  # Executa testes completos (Docker + ACT se instalado)
```
### Hook Pré-Commit
Instale as dependências de desenvolvimento primeiro:

```bash
bundle install --with development
yarn install
```
Configure o hook:

```bash
cp bin/pre-commit .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
```
Dica: Para pular verificações (emergências):

```bash
git commit --no-verify -m "mensagem"
```

---

### ambiente testes

roda o serviço de testes \(ele vai usar o override do test\)

```bash
docker-compose -f docker-compose.yml -f docker-compose.test.yml run --rm test
```
Depending on your application's configuration some manual setup may be required:

  1. Ensure you have defined default url options in your environments files. Here
     is an example of default_url_options appropriate for a development environment
     in config/environments/development.rb:

       config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

     In production, :host should be set to the actual host of your application.

     * Required for all applications. *

  2. Ensure you have defined root_url to *something* in your config/routes.rb.
     For example:

       root to: "home#index"
     
     * Not required for API-only Applications *

  3. Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>

     * Not required for API-only Applications *

  4. You can copy Devise views (for customization) to your app by running:

       rails g devise:views
       
     * Not required *   