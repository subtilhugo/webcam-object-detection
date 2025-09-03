#!/bin/bash

echo "🚀 Installation de Llama.cpp pour la détection d'objets par webcam"
echo "================================================================"

# Vérifier si Homebrew est installé (macOS)
if command -v brew &> /dev/null; then
    echo "✅ Homebrew détecté"
else
    echo "❌ Homebrew non trouvé. Installation..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Installer les dépendances
echo "📦 Installation des dépendances..."
brew install cmake ninja

# Cloner llama.cpp
echo "📥 Clonage de llama.cpp..."
if [ -d "llama.cpp" ]; then
    echo "⚠️  Répertoire llama.cpp existe déjà, mise à jour..."
    cd llama.cpp
    git pull
else
    git clone https://github.com/ggml-org/llama.cpp.git
    cd llama.cpp
fi

# Compiler llama.cpp
echo "🔨 Compilation de llama.cpp..."
mkdir -p build
cd build
cmake .. -DLLAMA_METAL=ON -DLLAMA_AVX=ON -DLLAMA_AVX2=ON
make -j$(nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 4)

echo "✅ Installation terminée !"
echo ""
echo "📋 Pour démarrer le serveur Llama.cpp:"
echo "1. Allez dans le répertoire: cd llama.cpp/build"
echo "2. Lancez le serveur: ./llama-server -hf ggml-org/SmolVLM-500M-Instruct-GGUF -ngl 99"
echo "3. Ouvrez l'interface web: http://localhost:8000"
echo ""
echo "💡 Options supplémentaires:"
echo "   - Pour utiliser le GPU: ajoutez -ngl 99"
echo "   - Pour changer le port: ajoutez -p 8080"
echo "   - Pour plus de mémoire: ajoutez -c 4096"
