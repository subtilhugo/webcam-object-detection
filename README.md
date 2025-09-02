# 🔍 Détection d'Objets en Temps Réel par Webcam

Une interface web moderne pour identifier des objets en temps réel en utilisant votre webcam avec l'intelligence artificielle. Supporte Llama.cpp (local, gratuit) et OpenAI (cloud, payant).

## ✨ Fonctionnalités

- 🎥 **Détection en temps réel** via webcam
- 🤖 **Support multi-modèles** : Llama.cpp et OpenAI
- 🎨 **Interface moderne** et responsive
- ⚡ **Performance optimisée** avec gestion des intervalles
- 🔧 **Configuration flexible** pour différents modèles
- 📱 **Design responsive** pour mobile et desktop

## 🚀 Installation Rapide

### Option 1 : Llama.cpp (Recommandé - Gratuit)

1. **Installer Llama.cpp** :
   ```bash
   chmod +x install_llama.sh
   ./install_llama.sh
   ```

2. **Démarrer le serveur Llama.cpp** :
   ```bash
   chmod +x start_llama_server.sh
   ./start_llama_server.sh
   ```

3. **Lancer l'interface web** :
   ```bash
   python3 server.py
   ```

### Option 2 : OpenAI (Payant)

1. **Obtenir une clé API OpenAI** :
   - Allez sur [OpenAI Platform](https://platform.openai.com/api-keys)
   - Créez une nouvelle clé API

2. **Lancer l'interface web** :
   ```bash
   python3 server.py
   ```

3. **Configurer dans l'interface** :
   - Sélectionnez "OpenAI"
   - Entrez votre clé API
   - Choisissez un modèle (GPT-4o recommandé)

## 📋 Prérequis

### Pour Llama.cpp :
- macOS (testé sur macOS 14+)
- Homebrew
- Au moins 8GB de RAM
- GPU recommandé (Metal pour macOS)

### Pour OpenAI :
- Connexion internet
- Clé API OpenAI valide
- Compte OpenAI avec crédits

## 🎯 Utilisation

1. **Ouvrez l'interface** : http://localhost:8000
2. **Choisissez votre modèle** : Llama.cpp ou OpenAI
3. **Configurez les paramètres** :
   - URL du serveur (pour Llama.cpp)
   - Clé API (pour OpenAI)
   - Instructions personnalisées
   - Intervalle de capture
4. **Cliquez sur "Démarrer"** et accordez les permissions de caméra
5. **Profitez** de la détection d'objets en temps réel !

## ⚙️ Configuration Avancée

### Llama.cpp

**Modèles disponibles** :
- `SmolVLM-500M-Instruct-GGUF` (recommandé, rapide)
- `llava-v1.5-7b` (plus précis, plus lent)
- `bakllava-1` (bon équilibre)

**Options de serveur** :
```bash
# Utiliser le GPU
./llama-server -hf ggml-org/SmolVLM-500M-Instruct-GGUF -ngl 99

# Changer le port
./llama-server -hf ggml-org/SmolVLM-500M-Instruct-GGUF -p 8080

# Plus de mémoire
./llama-server -hf ggml-org/SmolVLM-500M-Instruct-GGUF -c 4096
```

### OpenAI

**Modèles disponibles** :
- `gpt-4o` (recommandé, très précis)
- `gpt-4o-mini` (rapide, économique)
- `gpt-4-vision-preview` (spécialisé vision)

## 🔧 Dépannage

### Problèmes de caméra
- **Erreur de permissions** : Assurez-vous d'accorder l'accès à la caméra
- **Caméra non détectée** : Vérifiez que votre webcam fonctionne
- **HTTPS requis** : Utilisez localhost ou HTTPS

### Problèmes Llama.cpp
- **Serveur non accessible** : Vérifiez que llama-server est en cours d'exécution
- **Erreur de compilation** : Vérifiez les dépendances (cmake, ninja)
- **Mémoire insuffisante** : Réduisez la taille du contexte (-c 2048)

### Problèmes OpenAI
- **Clé API invalide** : Vérifiez votre clé sur OpenAI Platform
- **Quota dépassé** : Vérifiez vos crédits OpenAI
- **Erreur de réseau** : Vérifiez votre connexion internet

## 📁 Structure du Projet

```
webcam-object-detection/
├── index.html          # Interface web principale
├── server.py           # Serveur web Python
├── install_llama.sh    # Script d'installation Llama.cpp
├── start_llama_server.sh # Script de démarrage serveur
├── README.md           # Ce fichier
└── llama.cpp/          # Dossier Llama.cpp (après installation)
```

## 🤝 Contribution

Les contributions sont les bienvenues ! N'hésitez pas à :
- Signaler des bugs
- Proposer des améliorations
- Ajouter de nouveaux modèles
- Améliorer l'interface

## 📄 Licence

Ce projet est sous licence MIT. Voir le fichier LICENSE pour plus de détails.

## 🙏 Remerciements

- [llama.cpp](https://github.com/ggml-org/llama.cpp) - Pour l'infrastructure locale
- [SmolVLM](https://github.com/ggml-org/SmolVLM-500M-Instruct-GGUF) - Pour le modèle de vision
- [OpenAI](https://openai.com) - Pour les modèles cloud
- [ngxson/smolvlm-realtime-webcam](https://github.com/ngxson/smolvlm-realtime-webcam) - Pour l'inspiration initiale

---

**🎉 Amusez-vous bien avec votre détection d'objets en temps réel !**
