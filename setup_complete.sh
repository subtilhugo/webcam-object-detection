#!/bin/bash

echo "🚀 Installation complète de la détection d'objets par webcam"
echo "=========================================================="

# Couleurs pour les messages
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Fonction pour afficher les messages colorés
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

# Vérifier les prérequis
print_status "Vérification des prérequis..."

if ! command -v python3 &> /dev/null; then
    print_error "Python3 n'est pas installé. Veuillez l'installer d'abord."
    exit 1
fi

if ! command -v brew &> /dev/null; then
    print_warning "Homebrew n'est pas installé. Installation..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

print_success "Prérequis vérifiés"

# Installer Llama.cpp
print_status "Installation de Llama.cpp..."
if [ -d "llama.cpp" ]; then
    print_warning "Llama.cpp existe déjà, mise à jour..."
    cd llama.cpp
    git pull
    cd ..
else
    ./install_llama.sh
fi

# Vérifier si l'installation a réussi
if [ ! -f "llama.cpp/build/llama-server" ]; then
    print_error "Installation de Llama.cpp échouée. Vérifiez les erreurs ci-dessus."
    exit 1
fi

print_success "Llama.cpp installé avec succès"

# Démarrer le serveur Llama.cpp en arrière-plan
print_status "Démarrage du serveur Llama.cpp..."
cd llama.cpp/build
./llama-server -hf ggml-org/SmolVLM-500M-Instruct-GGUF -ngl 99 -p 8080 &
LLAMA_PID=$!
cd ../..

# Attendre que le serveur démarre
print_status "Attente du démarrage du serveur Llama.cpp..."
sleep 10

# Vérifier si le serveur fonctionne
if curl -s http://localhost:8080/v1/models > /dev/null; then
    print_success "Serveur Llama.cpp démarré avec succès"
else
    print_warning "Serveur Llama.cpp pourrait ne pas être prêt. Continuez quand même..."
fi

# Démarrer l'interface web
print_status "Démarrage de l'interface web..."
print_success "Interface accessible sur: http://localhost:8000"
print_success "Serveur Llama.cpp accessible sur: http://localhost:8080"
echo ""
print_status "Instructions:"
echo "1. Ouvrez http://localhost:8000 dans votre navigateur"
echo "2. Accordez les permissions de caméra"
echo "3. Cliquez sur 'Démarrer' pour commencer la détection"
echo ""
print_warning "Appuyez sur Ctrl+C pour arrêter tous les serveurs"

# Fonction de nettoyage
cleanup() {
    print_status "Arrêt des serveurs..."
    if [ ! -z "$LLAMA_PID" ]; then
        kill $LLAMA_PID 2>/dev/null
    fi
    print_success "Serveurs arrêtés"
    exit 0
}

# Capturer Ctrl+C
trap cleanup SIGINT

# Démarrer le serveur web
python3 server.py
