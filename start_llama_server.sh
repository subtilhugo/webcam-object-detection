#!/bin/bash

echo "🚀 Démarrage du serveur Llama.cpp pour la détection d'objets"
echo "============================================================"

# Vérifier si llama.cpp est installé
if [ ! -d "llama.cpp" ]; then
    echo "❌ llama.cpp non trouvé. Exécutez d'abord: ./install_llama.sh"
    exit 1
fi

# Aller dans le répertoire build
cd llama.cpp/build

# Vérifier si le serveur existe
if [ ! -f "llama-server" ]; then
    echo "❌ Serveur llama-server non trouvé. Vérifiez l'installation."
    exit 1
fi

echo "✅ Serveur trouvé, démarrage..."
echo "🌐 Le serveur sera accessible sur: http://localhost:8080"
echo "📹 L'interface web sera accessible sur: http://localhost:8000"
echo ""
echo "⏹️  Appuyez sur Ctrl+C pour arrêter le serveur"
echo ""

# Démarrer le serveur avec SmolVLM
./llama-server -hf ggml-org/SmolVLM-500M-Instruct-GGUF -ngl 99 -p 8080