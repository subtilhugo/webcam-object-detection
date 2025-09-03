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
