#!/bin/bash

echo "🚀 Cursor Ultimate - GitHub Auto Deploy"
echo "========================================"
echo ""

# Cores
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# Verifica se está no diretório correto
if [ ! -f "index.html" ]; then
    echo -e "${RED}❌ Erro: Execute este script dentro do diretório cursor-ultimate-deploy${NC}"
    exit 1
fi

# Informações do usuário
echo -e "${BLUE}📝 Configuração do GitHub${NC}"
echo ""
read -p "Nome do repositório (ex: cursor-ultimate): " repo_name
read -p "Seu username do GitHub (ex: seu-usuario): " github_user
read -p "Seu email do GitHub (ex: email@example.com): " github_email

echo ""
echo -e "${YELLOW}⚠️  IMPORTANTE: Você precisa de um Personal Access Token${NC}"
echo -e "${BLUE}📌 Como criar:${NC}"
echo "1. Acesse: https://github.com/settings/tokens"
echo "2. Generate new token (classic)"
echo "3. Selecione: repo (full control)"
echo "4. Generate token e copie"
echo ""
read -p "Cole seu GitHub Personal Access Token: " github_token

if [ -z "$repo_name" ] || [ -z "$github_user" ] || [ -z "$github_token" ]; then
    echo -e "${RED}❌ Todos os campos são obrigatórios!${NC}"
    exit 1
fi

# Configurar git local
echo ""
echo -e "${BLUE}⚙️  Configurando Git...${NC}"
git config --global user.name "$github_user"
git config --global user.email "$github_email"

# Inicializar repositório
echo -e "${BLUE}📦 Inicializando repositório...${NC}"
git init

# Criar .gitignore se não existir
if [ ! -f ".gitignore" ]; then
    echo -e "${BLUE}📝 Criando .gitignore...${NC}"
    cat > .gitignore << 'EOF'
.DS_Store
*.log
node_modules/
.env
.env.local
EOF
fi

# Adicionar arquivos
echo -e "${BLUE}📤 Adicionando arquivos...${NC}"
git add .

# Commit
echo -e "${BLUE}💾 Criando commit...${NC}"
git commit -m "🚀 Initial commit - Cursor Ultimate Editor

✨ Features:
- Editor de código completo com múltiplas abas
- Explorador de arquivos hierárquico  
- Claude AI integrado
- Preview HTML em tempo real
- Painel Admin (API Keys + SSH)
- Docker + Nginx otimizado
- Pronto para Easypanel

Criado com React + Claude AI"

# Criar branch main
echo -e "${BLUE}🌿 Criando branch main...${NC}"
git branch -M main

# Tentar criar repositório via API do GitHub
echo ""
echo -e "${BLUE}🔨 Criando repositório no GitHub...${NC}"
response=$(curl -s -X POST \
    -H "Authorization: token $github_token" \
    -H "Accept: application/vnd.github.v3+json" \
    https://api.github.com/user/repos \
    -d "{\"name\":\"$repo_name\",\"description\":\"Editor de código completo com Claude AI, explorador de arquivos e painel administrativo. Pronto para deploy no Easypanel.\",\"private\":false}")

# Verificar se o repositório foi criado
if echo "$response" | grep -q "\"id\""; then
    echo -e "${GREEN}✅ Repositório criado com sucesso!${NC}"
elif echo "$response" | grep -q "already exists"; then
    echo -e "${YELLOW}⚠️  Repositório já existe. Vamos usar o existente.${NC}"
else
    echo -e "${RED}❌ Erro ao criar repositório:${NC}"
    echo "$response" | grep "message"
    echo ""
    echo -e "${YELLOW}💡 Você pode criar manualmente em: https://github.com/new${NC}"
    echo -e "${YELLOW}   E depois executar:${NC}"
    echo -e "${BLUE}   git remote add origin https://github.com/$github_user/$repo_name.git${NC}"
    echo -e "${BLUE}   git push -u origin main${NC}"
    exit 1
fi

# Adicionar remote
echo -e "${BLUE}🔗 Conectando ao repositório...${NC}"
git remote add origin https://$github_token@github.com/$github_user/$repo_name.git

# Push
echo -e "${BLUE}🚀 Enviando código para o GitHub...${NC}"
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo -e "${GREEN}════════════════════════════════════${NC}"
    echo -e "${GREEN}✅ SUCESSO! Código enviado para GitHub${NC}"
    echo -e "${GREEN}════════════════════════════════════${NC}"
    echo ""
    echo -e "${BLUE}🌐 Repositório:${NC} https://github.com/$github_user/$repo_name"
    echo ""
    echo -e "${YELLOW}📌 PRÓXIMOS PASSOS:${NC}"
    echo ""
    echo -e "${BLUE}1️⃣  Deploy no Easypanel:${NC}"
    echo "   - Acesse seu Easypanel"
    echo "   - New Service → App"
    echo "   - Connect GitHub"
    echo "   - Selecione: $repo_name"
    echo "   - Deploy!"
    echo ""
    echo -e "${BLUE}2️⃣  Configure a API Key:${NC}"
    echo "   - Acesse a aplicação"
    echo "   - Clique em 'Admin'"
    echo "   - Cole sua Claude API Key"
    echo "   - Salvar!"
    echo ""
    echo -e "${GREEN}🎉 Pronto! Seu editor está no ar!${NC}"
else
    echo -e "${RED}❌ Erro ao enviar código${NC}"
    echo ""
    echo -e "${YELLOW}💡 Tente manualmente:${NC}"
    echo -e "${BLUE}git push -u origin main${NC}"
    exit 1
fi
