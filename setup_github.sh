#!/bin/bash

echo "🚀 Setup GitHub Repository for Webcam Object Detection"
echo "======================================================"

# Couleurs pour les messages
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Demander le nom d'utilisateur GitHub
echo ""
print_status "Configuration du repository GitHub"
echo ""

read -p "Entrez votre nom d'utilisateur GitHub: " GITHUB_USERNAME
read -p "Entrez le nom du repository (défaut: webcam-object-detection): " REPO_NAME
REPO_NAME=${REPO_NAME:-webcam-object-detection}

print_status "Configuration:"
echo "  Username: $GITHUB_USERNAME"
echo "  Repository: $REPO_NAME"
echo ""

# Mettre à jour les fichiers avec le bon nom d'utilisateur
print_status "Mise à jour des fichiers..."

# Mettre à jour le README GitHub
sed -i.bak "s/yourusername/$GITHUB_USERNAME/g" README_GITHUB.md
sed -i.bak "s/webcam-object-detection/$REPO_NAME/g" README_GITHUB.md

# Mettre à jour le workflow GitHub Actions
sed -i.bak "s/yourusername/$GITHUB_USERNAME/g" .github/workflows/deploy.yml
sed -i.bak "s/webcam-object-detection/$REPO_NAME/g" .github/workflows/deploy.yml

# Supprimer les fichiers de backup
rm -f README_GITHUB.md.bak .github/workflows/deploy.yml.bak

print_success "Fichiers mis à jour"

# Initialiser Git
print_status "Initialisation du repository Git..."

if [ -d ".git" ]; then
    print_warning "Repository Git déjà initialisé"
else
    git init
    print_success "Repository Git initialisé"
fi

# Ajouter les fichiers
git add .

# Premier commit
git commit -m "Initial commit: Real-time webcam object detection interface

- Modern web interface for object detection
- Support for OpenAI and Llama.cpp models
- Responsive design with language selection
- Automated deployment setup"

print_success "Premier commit créé"

# Créer le repository sur GitHub
print_status "Création du repository sur GitHub..."
print_warning "Assurez-vous d'avoir configuré GitHub CLI (gh) ou créez le repository manuellement"

if command -v gh &> /dev/null; then
    gh repo create $REPO_NAME --public --description "Real-time webcam object detection with AI" --source=. --remote=origin --push
    print_success "Repository GitHub créé et poussé"
else
    print_warning "GitHub CLI non trouvé. Créez le repository manuellement:"
    echo "1. Allez sur https://github.com/new"
    echo "2. Nom du repository: $REPO_NAME"
    echo "3. Description: Real-time webcam object detection with AI"
    echo "4. Public"
    echo "5. Ne pas initialiser avec README"
    echo ""
    echo "Puis exécutez:"
    echo "git remote add origin https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
    echo "git branch -M main"
    echo "git push -u origin main"
fi

print_success "Setup terminé!"
echo ""
print_status "Prochaines étapes:"
echo "1. Activez GitHub Pages dans les paramètres du repository"
echo "2. Sélectionnez la branche 'gh-pages' comme source"
echo "3. Votre interface sera accessible sur: https://$GITHUB_USERNAME.github.io/$REPO_NAME/"
echo ""
print_status "Pour tester localement:"
echo "./quick_start.sh"
