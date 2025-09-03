# 🚀 Guide de Démarrage Rapide

## 🎯 Objectif
Créer une interface de détection d'objets en temps réel via webcam avec l'IA.

## ⚡ Démarrage Ultra-Rapide

### Option 1 : Installation Complète (Recommandée)
```bash
./setup_complete.sh
```
**Ce script va :**
- Installer Llama.cpp automatiquement
- Démarrer le serveur Llama.cpp
- Lancer l'interface web
- Ouvrir votre navigateur

### Option 2 : Interface Web Seule
```bash
./quick_start.sh
```
**Pour utiliser avec OpenAI :**
1. Obtenez une clé API sur [OpenAI Platform](https://platform.openai.com/api-keys)
2. Entrez-la dans l'interface web

## 🌐 Accès
- **Interface web :** http://localhost:8000
- **Serveur Llama.cpp :** http://localhost:8080

## 📱 Utilisation
1. Ouvrez http://localhost:8000
2. Accordez les permissions de caméra
3. Choisissez votre modèle (Llama.cpp ou OpenAI)
4. Cliquez sur "Démarrer"
5. Profitez de la détection d'objets !

## 🔧 Scripts Disponibles

| Script | Description |
|--------|-------------|
| `setup_complete.sh` | Installation complète + démarrage automatique |
| `quick_start.sh` | Démarrage rapide de l'interface web |
| `install_llama.sh` | Installation de Llama.cpp uniquement |
| `start_llama_server.sh` | Démarrage du serveur Llama.cpp |

## 🆘 Dépannage

### Problème de caméra
- Vérifiez les permissions du navigateur
- Utilisez HTTPS ou localhost

### Serveur Llama.cpp non accessible
- Vérifiez que le serveur est démarré
- Attendez quelques secondes après le démarrage

### Erreur OpenAI
- Vérifiez votre clé API
- Vérifiez vos crédits OpenAI

## 📞 Support
Consultez le fichier `README.md` pour plus de détails et d'options avancées.

---

**🎉 Prêt à détecter des objets en temps réel !**
