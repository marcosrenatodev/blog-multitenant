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
