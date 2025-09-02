#!/bin/bash

echo "🚀 Script d'Automatisation pour Demain"
echo "====================================="

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

# Vérifier si nous sommes dans le bon répertoire
if [ ! -f "index.html" ]; then
    print_error "Vous devez être dans le répertoire webcam-object-detection"
    exit 1
fi

print_status "Préparation pour l'activité de demain..."

# Créer des branches pour les nouvelles fonctionnalités
print_status "Création des branches pour les nouvelles fonctionnalités..."

branches=(
    "feature/dark-mode"
    "feature/new-instructions"
    "feature/progress-bar"
    "feature/history"
    "feature/screenshot-mode"
)

for branch in "${branches[@]}"; do
    if git show-ref --verify --quiet refs/heads/$branch; then
        print_warning "Branche $branch existe déjà"
    else
        git checkout -b $branch
        print_success "Branche $branch créée"
    fi
done

# Revenir sur main
git checkout main

print_success "Branches créées avec succès"

# Créer un fichier de checklist pour demain
cat > TOMORROW_CHECKLIST.md << 'EOF'
# ✅ Checklist pour Demain

## 🎯 Objectifs
- [ ] Créer 5 issues sur GitHub
- [ ] Implémenter le mode sombre
- [ ] Ajouter de nouvelles instructions
- [ ] Ajouter une barre de progression
- [ ] Créer un historique des détections
- [ ] Faire 5+ commits

## 📋 Tâches par Ordre

### 1. Préparation (30 min)
- [ ] Créer les issues sur GitHub
- [ ] Préparer les assets (icônes)
- [ ] Tester l'interface actuelle

### 2. Mode Sombre (1h)
- [ ] Ajouter les variables CSS
- [ ] Créer le bouton toggle
- [ ] Implémenter la logique JavaScript
- [ ] Tester les transitions

### 3. Nouvelles Instructions (45 min)
- [ ] Ajouter les nouvelles instructions
- [ ] Améliorer le layout
- [ ] Ajouter des icônes
- [ ] Tester les nouvelles fonctions

### 4. Barre de Progression (30 min)
- [ ] Créer le composant progress bar
- [ ] Intégrer avec les API calls
- [ ] Ajouter les animations
- [ ] Tester les timeouts

### 5. Historique (45 min)
- [ ] Créer la classe DetectionHistory
- [ ] Ajouter l'interface utilisateur
- [ ] Implémenter localStorage
- [ ] Ajouter l'export

### 6. Tests et Documentation (30 min)
- [ ] Tester toutes les fonctionnalités
- [ ] Mettre à jour la documentation
- [ ] Créer des captures d'écran
- [ ] Préparer le partage

## 🚀 Commands à Exécuter

```bash
# Commencer par le mode sombre
git checkout feature/dark-mode
# ... travailler sur le mode sombre ...
git add .
git commit -m "feat: add dark mode toggle with smooth transitions"
git push origin feature/dark-mode

# Continuer avec les autres fonctionnalités...
```

## 📊 Métriques à Suivre
- [ ] 5+ commits réalisés
- [ ] 200+ lignes ajoutées
- [ ] 3-5 fichiers modifiés
- [ ] Issues créées et assignées
- [ ] Tests passés

## 🎉 Résultat Attendu
- Interface améliorée et moderne
- Activité GitHub significative
- Portfolio technique enrichi
- Compétences démontrées
EOF

print_success "Checklist créée : TOMORROW_CHECKLIST.md"

# Créer un script de commit rapide
cat > quick_commit.sh << 'EOF'
#!/bin/bash

# Script pour faire des commits rapides
echo "🚀 Quick Commit Script"

if [ -z "$1" ]; then
    echo "Usage: ./quick_commit.sh \"message du commit\""
    exit 1
fi

git add .
git commit -m "$1"
git push origin $(git branch --show-current)

echo "✅ Commit effectué avec succès"
EOF

chmod +x quick_commit.sh

print_success "Script de commit rapide créé : quick_commit.sh"

# Créer un fichier de métriques
cat > metrics_tracker.md << 'EOF'
# 📊 Tracker de Métriques

## GitHub Analytics
- **Commits aujourd'hui** : 0
- **Lignes ajoutées** : 0
- **Fichiers modifiés** : 0
- **Issues créées** : 0
- **Stars reçues** : 0

## Objectifs pour Demain
- **Commits** : 5+
- **Lignes ajoutées** : 200+
- **Fichiers modifiés** : 3-5
- **Issues créées** : 5
- **Stars reçues** : 10+

## Notes
- Commencer tôt pour maximiser l'impact
- Faire des commits fréquents
- Tester chaque fonctionnalité
- Documenter les changements
EOF

print_success "Tracker de métriques créé : metrics_tracker.md"

print_success "Préparation terminée !"
echo ""
print_status "Pour demain :"
echo "1. Ouvrez TOMORROW_CHECKLIST.md"
echo "2. Suivez les étapes une par une"
echo "3. Utilisez quick_commit.sh pour les commits"
echo "4. Mettez à jour metrics_tracker.md"
echo ""
print_warning "N'oubliez pas de créer les issues sur GitHub !"
