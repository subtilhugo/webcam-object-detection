#!/bin/bash

echo "🚀 Démarrage rapide de la détection d'objets par webcam"
echo "======================================================"

# Vérifier si Python est installé
if ! command -v python3 &> /dev/null; then
    echo "❌ Python3 n'est pas installé. Veuillez l'installer d'abord."
    exit 1
fi

# Vérifier si les fichiers nécessaires existent
if [ ! -f "index.html" ] || [ ! -f "server.py" ]; then
    echo "❌ Fichiers manquants. Vérifiez que vous êtes dans le bon répertoire."
    exit 1
fi

echo "✅ Fichiers trouvés, démarrage du serveur web..."
echo ""
echo "🌐 L'interface sera accessible sur: http://localhost:8000"
echo "📹 Accordez les permissions de caméra quand demandé"
echo ""
echo "💡 Options disponibles:"
echo "   1. Utiliser OpenAI (payant):"
echo "      - Obtenez une clé API sur https://platform.openai.com/api-keys"
echo "      - Entrez-la dans l'interface"
echo ""
echo "   2. Utiliser Llama.cpp (gratuit):"
echo "      - Exécutez: ./install_llama.sh"
echo "      - Puis: ./start_llama_server.sh"
echo ""
echo "⏹️  Appuyez sur Ctrl+C pour arrêter le serveur"
echo ""

# Démarrer le serveur web
python3 server.py
