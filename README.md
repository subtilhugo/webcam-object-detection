<<<<<<< HEAD
# Demo SmolVLM en temps réel avec votre webcam

Cette application web vous permet d'interroger un modèle **SmolVLM** via un serveur
`llama.cpp` pour identifier des objets dans le flux de votre webcam. Toutes les
inférences se font localement : aucune image n'est envoyée vers un service
externe. Vous devez disposer d'un ordinateur compatible avec le modèle
multimodal et d'une connexion internet uniquement pour télécharger les
fichiers nécessaires.

## Pré‑requis

1. **Installer `llama.cpp`** :
   ```bash
   # Cloner le dépôt officiel
   git clone https://github.com/ggml-org/llama.cpp
   cd llama.cpp
   # Compiler les binaires
   make -j$(nproc)
   make server
   ```

2. **Démarrer le serveur multimodal** :
   L'outil `llama-server` peut télécharger automatiquement le modèle depuis
   Hugging Face. Exécutez cette commande dans le dossier `llama.cpp` :
   ```bash
   ./server/llama-server -hf ggml-org/SmolVLM-500M-Instruct-GGUF
   ```
   - Par défaut le serveur écoute sur `http://localhost:8080`. 
   - Si vous disposez d'un GPU compatible, ajoutez l'option `-ngl 99` pour
     activer l'accélération (par exemple : `./server/llama-server -hf … -ngl 99`).

3. **Héberger l'interface web** :
   Dans le dossier contenant ce fichier (`smolvlm_realtime_webcam`), lancez
   un petit serveur HTTP local :
   ```bash
   cd smolvlm_realtime_webcam
   python3 -m http.server 5500
   ```
   Cela démarre un serveur sur `http://localhost:5500` qui sert la page
   `index.html`. L'utilisation d'un serveur local est nécessaire pour que le
   navigateur accepte l'accès à la webcam.

4. **Ouvrir l'interface** :
   Dans votre navigateur (Chrome ou Edge de préférence), allez sur
   `http://localhost:5500/index.html`.
   - Lorsque la page charge, le navigateur vous demandera l'autorisation
     d'accéder à la caméra. Acceptez cette demande.
   - Le champ « Base API » doit rester `http://localhost:8080` si vous
     utilisez le serveur `llama.cpp` local.
   - Le champ « Instruction » contient par défaut la question *« What do you
     see? »*. Vous pouvez la modifier, par exemple : « Quels sont les objets
     dans cette scène ? » ou demander une réponse JSON.
   - Cliquez sur **Start** pour démarrer l'envoi d'images au serveur. Le
     modèle répondra dans le champ « Response ».

## Remarques

- L'application envoie une image de la caméra et l'instruction au serveur à
  intervalles réguliers (par défaut toutes les 500 ms). Ajustez ce délai à
  l'aide du menu déroulant « Interval » pour trouver le bon compromis entre
  réactivité et consommation de ressources.
- Le modèle **SmolVLM 500M** est relativement léger (~437 Mo en quantification
  8 bits) mais nécessite tout de même quelques gigaoctets de RAM pour
  l'inférence. Assurez‑vous que votre machine dispose de suffisamment de
  mémoire.
- Pour des réponses structurées (par exemple en JSON), modifiez
  l'instruction en conséquence, par exemple : « Décris les objets présents et
  renvoie uniquement une liste JSON contenant leurs noms. »

En suivant ces étapes, vous obtiendrez une interface web locale qui utilise
votre webcam et `llama.cpp` pour identifier les objets en temps réel.
=======
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
>>>>>>> b5bd18581e4a6b1f7a3909eec8f011c4fcfd2cb7
