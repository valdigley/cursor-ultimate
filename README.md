# 🚀 Cursor Ultimate - Deploy para Easypanel

Editor de código completo com Claude AI, explorador de arquivos e painel administrativo.

## 📦 O que está incluído

- ✅ Editor de código com múltiplas abas
- ✅ Explorador de arquivos hierárquico
- ✅ Claude AI integrado
- ✅ Preview HTML em tempo real
- ✅ Painel de administração (API Keys e SSH)
- ✅ Interface dark theme profissional

## 🎯 Deploy no Easypanel

### Opção 1: Deploy via Git (Recomendado)

1. **Suba este código para um repositório Git**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin SEU_REPOSITORIO_GIT
   git push -u origin main
   ```

2. **No Easypanel:**
   - Clique em "Create Service"
   - Selecione "App"
   - Escolha "GitHub" ou "GitLab"
   - Conecte seu repositório
   - Easypanel detectará automaticamente o Dockerfile
   - Clique em "Deploy"

3. **Configurações:**
   - Porta: `80`
   - Domain: Configure um domínio ou use o subdomínio do Easypanel
   - Restart Policy: `unless-stopped`

### Opção 2: Deploy via Docker Compose

1. **No Easypanel:**
   - Clique em "Create Service"
   - Selecione "Docker Compose"
   - Cole o conteúdo do `docker-compose.yml`
   - Clique em "Deploy"

### Opção 3: Deploy Manual (Docker Registry)

1. **Build e push para um registry:**
   ```bash
   docker build -t seu-usuario/cursor-ultimate:latest .
   docker push seu-usuario/cursor-ultimate:latest
   ```

2. **No Easypanel:**
   - Crie um novo App
   - Use a imagem: `seu-usuario/cursor-ultimate:latest`
   - Porta: `80`
   - Deploy!

## 🔧 Configuração Pós-Deploy

1. **Acesse a aplicação** no domínio configurado
2. **Vá para aba "Admin"**
3. **Configure sua Claude API Key:**
   - Acesse: https://console.anthropic.com
   - Crie uma API Key
   - Cole no campo "Claude API Key"
   - Clique em "Salvar Tudo"
4. **Pronto!** Volte para "Editor" e comece a usar

## 🧪 Testar Localmente

```bash
# Com Docker Compose
docker-compose up -d

# Ou com Docker direto
docker build -t cursor-ultimate .
docker run -d -p 80:80 cursor-ultimate

# Acesse: http://localhost
```

## 📁 Estrutura do Projeto

```
cursor-ultimate-deploy/
├── index.html          # Aplicação principal (React SPA)
├── Dockerfile          # Configuração do container
├── docker-compose.yml  # Orquestração Docker
├── nginx.conf          # Configuração do servidor web
├── .dockerignore       # Arquivos ignorados no build
└── README.md           # Este arquivo
```

## ⚙️ Variáveis de Ambiente (Opcional)

Se quiser adicionar variáveis de ambiente no Easypanel:

```
TZ=America/Sao_Paulo
```

## 🔒 Segurança

- ✅ Headers de segurança configurados no nginx
- ✅ Gzip compression habilitado
- ✅ Cache otimizado
- ⚠️ API Keys são armazenadas localmente no navegador (localStorage)
- ⚠️ Recomendamos usar HTTPS em produção

## 📊 Recursos do Container

- **Base Image:** nginx:alpine (~10MB)
- **CPU:** Mínimo 0.5 vCPU
- **RAM:** Mínimo 256MB
- **Storage:** ~50MB

## 🐛 Troubleshooting

### Container não inicia
```bash
# Verifique os logs no Easypanel
# Ou localmente:
docker logs cursor-ultimate
```

### Porta 80 já em uso
```bash
# Altere no docker-compose.yml:
ports:
  - "8080:80"  # Use porta 8080 no host
```

### Claude AI não responde
- Verifique se a API Key está configurada corretamente
- Acesse a aba "Admin" e salve novamente
- Verifique os logs do navegador (F12 > Console)

## 🎨 Customização

### Alterar porta
No `Dockerfile` e `nginx.conf`, altere a porta 80 para sua preferência.

### Adicionar mais features
Edite o `index.html` - toda a aplicação está em um único arquivo SPA.

## 📞 Suporte

- 🐛 Issues: Abra uma issue no repositório
- 📧 Email: seu-email@exemplo.com
- 💬 Discord: seu-discord

## 📄 Licença

MIT License - Use como quiser!

---

**Desenvolvido com ❤️ usando React + Claude AI**

🚀 **Deploy agora e comece a codar!**
