## Configurações do Repositório

Configurando o shell para não solicitar a senha SSH para os commits.

```bash
exec ssh-agent zsh && ssh-add ~/.ssh/id_ed25519
```

Configurar credenciais no `git config`

```bash
git config --global user.email "email@email.com"
git config --global user.name "name"
git config --global core.editor "code --wait"
```

Configurando o repositório remoto com SSH

```bash
git remote add origin git@github.com:username/project.git
```

### 🔐 Gerando uma `SECRET_KEY` para o Django:

Método oficial com o Django já instalado:
```bash
python -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"
```

Método com python puro usando a lib `secrets`:
```bash
python -c "import secrets; print(secrets.token_urlsafe(50))"
```

#### 🛠 Gerar um token aleatório com hash SHA-256 com WSL/Linux:

```bash
head -c 32 /dev/urandom | sha256sum | cut -d' ' -f1
```
Esse comando:
- Usa 32 bytes aleatórios de /dev/urandom.
- Gera o hash SHA-256 com sha256sum.
- Usa cut para extrair só o valor do hash (sem o hífen final).
  O resultado é um token como:
  `a3f5c8e2d9f4b1c7e6a0d3f2b7c1a9e8f6d4c3b2a1e0f9d8c7b6a5e4d3c2b1a0`

### 💡 Alternativas

Se quiser um token mais curto e em base64:

```bash
openssl rand -base64 37
```

Resultado:
`iSl5AkHzVD3UH/LScEDRK+VYdXNHNMdgjc2yiuN61FCLkxeW7g==`
