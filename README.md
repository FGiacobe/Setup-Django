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
