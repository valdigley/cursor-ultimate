#!/bin/bash

echo "🚀 Cursor Ultimate - Deploy Script"
echo "=================================="
echo ""

# Cores
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Função de deploy local
deploy_local() {
    echo -e "${BLUE}📦 Building Docker image...${NC}"
    docker build -t cursor-ultimate:latest .
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ Build successful!${NC}"
        echo ""
        echo -e "${BLUE}🚀 Starting container...${NC}"
        docker-compose down 2>/dev/null
        docker-compose up -d
        
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✅ Container started!${NC}"
            echo ""
            echo -e "${GREEN}🌐 Application running at: http://localhost${NC}"
            echo -e "${BLUE}📊 View logs: docker-compose logs -f${NC}"
            echo -e "${BLUE}🛑 Stop: docker-compose down${NC}"
        else
            echo -e "${RED}❌ Failed to start container${NC}"
            exit 1
        fi
    else
        echo -e "${RED}❌ Build failed${NC}"
        exit 1
    fi
}

# Função de push para registry
deploy_registry() {
    read -p "Enter your Docker Hub username: " username
    read -p "Enter image tag (default: latest): " tag
    tag=${tag:-latest}
    
    echo -e "${BLUE}📦 Building and pushing to registry...${NC}"
    docker build -t $username/cursor-ultimate:$tag .
    docker push $username/cursor-ultimate:$tag
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ Image pushed successfully!${NC}"
        echo ""
        echo -e "${GREEN}Use this image in Easypanel:${NC}"
        echo -e "${BLUE}$username/cursor-ultimate:$tag${NC}"
    else
        echo -e "${RED}❌ Failed to push image${NC}"
        exit 1
    fi
}

# Menu
echo "Select deployment option:"
echo "1) Deploy locally (Docker Compose)"
echo "2) Build and push to Docker Hub"
echo "3) Exit"
echo ""
read -p "Choose option [1-3]: " option

case $option in
    1)
        deploy_local
        ;;
    2)
        deploy_registry
        ;;
    3)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo -e "${RED}Invalid option${NC}"
        exit 1
        ;;
esac
