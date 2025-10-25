# 🚀 ENVIAR PARA O GITHUB - SUPER SIMPLES

## ⚡ Método Automático (1 comando!)

### 1️⃣ Extraia o pacote
```bash
tar -xzf cursor-ultimate-deploy.tar.gz
cd cursor-ultimate-deploy
```

### 2️⃣ Execute o script mágico
```bash
./push-to-github.sh
```

**Pronto!** O script vai:
- ✅ Configurar Git
- ✅ Criar o repositório no GitHub
- ✅ Fazer commit
- ✅ Enviar tudo automaticamente

### 3️⃣ Você só precisa fornecer:
- Nome do repositório (ex: `cursor-ultimate`)
- Seu username do GitHub (ex: `seu-usuario`)
- Seu email do GitHub
- **Personal Access Token** (veja abaixo como criar)

---

## 🔑 Como Criar um Personal Access Token

1. Acesse: https://github.com/settings/tokens
2. Clique em **"Generate new token (classic)"**
3. Dê um nome (ex: "Cursor Ultimate Deploy")
4. Marque: **`repo`** (full control of private repositories)
5. Clique em **"Generate token"**
6. **COPIE O TOKEN** (você só verá uma vez!)
7. Cole quando o script pedir

---

## 🔧 Método Manual (se preferir)

### Passo 1: Crie o repositório no GitHub
1. Acesse: https://github.com/new
2. Nome: `cursor-ultimate`
3. Descrição: "Editor completo com Claude AI"
4. Clique em "Create repository"

### Passo 2: Execute os comandos
```bash
cd cursor-ultimate-deploy

# Configurar git
git config --global user.name "SEU_USUARIO"
git config --global user.email "seu@email.com"

# Inicializar
git init
git add .
git commit -m "Initial commit - Cursor Ultimate"
git branch -M main

# Conectar e enviar
git remote add origin https://github.com/SEU_USUARIO/cursor-ultimate.git
git push -u origin main
```

---

## 🚀 Deploy no Easypanel (após enviar ao GitHub)

### Via Easypanel UI:
1. Acesse seu Easypanel
2. **New Service** → **App**
3. **Connect GitHub**
4. Selecione: `cursor-ultimate`
5. Easypanel detecta o Dockerfile automaticamente
6. **Deploy!** 🎉

### Configurações:
- **Port**: 80
- **Domain**: Configure um domínio custom
- **Resources**: 0.5 CPU, 512MB RAM

---

## ⚙️ Configuração Final

1. Acesse sua aplicação no domínio do Easypanel
2. Clique em **"Admin"**
3. Cole sua **Claude API Key** (https://console.anthropic.com)
4. Clique em **"Salvar Tudo"**
5. **Pronto!** Comece a usar! 🎉

---

## 💡 Dicas

### Token não funciona?
- Certifique-se que marcou a permissão `repo`
- Copie o token corretamente (sem espaços)
- Token expira? Gere um novo

### Erro "repository already exists"?
```bash
# Use o repositório existente
git remote add origin https://github.com/SEU_USUARIO/NOME_REPO.git
git push -u origin main
```

### Quer repositório privado?
No GitHub, vá em Settings → Change visibility → Private

---

## 📞 Suporte

- Script não funciona? Execute os comandos manualmente
- Problemas com token? Gere um novo
- Easypanel não conecta? Verifique permissões do GitHub

**Boa sorte! 🚀**
