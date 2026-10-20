# SOULBREAK

Un RPG d'action sur Roblox où tu obtiens des pouvoirs en spinant des âmes et en les faisant évoluer en V2.

## Concept

Dans SOULBREAK, tu obtiens tes pouvoirs en spinant des âmes avec un système de gacha (style Blox Fruits). Chaque âme a une rareté différente (Common, Rare, Epic, Legendary, Mythic) et peut être améliorée en V2 en farmant des mobs.

**Twist unique :** Les âmes V2 sont beaucoup plus puissantes avec des compétences améliorées et de nouveaux effets. Le farm se fait sur des mobs comme dans Blox Fruits, pas seulement sur des boss.

## Mécaniques Principales

### 1. Système de Spin (Gacha)
- Spin des âmes avec pourcentages de chance
- **Common (50%)** : Âmes de base (Brume, Flamme)
- **Rare (35%)** : Âmes intermédiaires (Réflexion, Foudre)
- **Epic (12%)** : Âmes puissantes (Temporelle, Glace)
- **Legendary (2.5%)** : Âmes très rares (Ombre, Gravité)
- **Mythic (0.5%)** : Âmes légendaires (Roi Déchu, Nature)
- Coût : 100 Soul Shards par spin
- Compensation si déjà possédée

### 2. Système V2 (Éveils)
- Chaque âme peut être améliorée en V2
- Conditions de débloquage : Farm X mobs + Niveau requis
- Les compétences V2 sont plus puissantes
- Exemple : Bouclier de Brume → Bouclier Abyssal (réflexion de dégâts)

### 3. Farm avec Mobs
- 3 zones avec des mobs de différents niveaux
- Les mobs donnent XP et Soul Shards
- Les kills avec une âme active comptent pour le V2
- Respawn automatique des mobs

### 4. Boucle de Progression
1. Spin des Âmes → Obtenir des pouvoirs
2. Farm des Mobs → Gagner XP et Soul Shards
3. Débloquer V2 → Améliorer l'âme (X kills + niveau)
4. Équiper et Combat → Utiliser les compétences
5. Collection → Toutes les âmes et leurs V2

## Version de Lancement (MVP)

### Contenu
- **Monde** : 1 île avec 3 zones
- **Âmes** : 4 pouvoirs distincts
- **Éveils** : 2 voies par âme
- **Boss** : 3 boss avec mécaniques différentes

### Fonctionnalités
- Système de combat avec esquives, parades, combos
- Collection d'âmes et éveils
- Coopération multijoueur
- Arène PvP
- Événements mondiaux
- Sauvegarde et progression

## Structure du Projet Roblox

```
SoulBreak/
├── docs/                    # Documentation
├── design/                  # Game Design
│   ├── characters/        # Personnages et boss
│   ├── mechanics/         # Mécaniques de jeu
│   ├── levels/            # Level design
│   └── ui/                # Design d'interface
├── src/                     # Code source Luau (synchronisé avec Rojo)
│   ├── server/            # Scripts serveur (ServerScriptService)
│   │   ├── core/          # Systèmes serveur
│   │   ├── systems/       # Gameplay serveur
│   │   └── bosses/        # Boss AI
│   ├── client/            # Scripts client (StarterPlayerScripts)
│   │   ├── core/          # Systèmes client
│   │   ├── systems/       # Gameplay client
│   │   └── ui/            # Interface
│   └── shared/            # Code partagé (ReplicatedStorage)
│       ├── config/        # Configuration
│       ├── data/          # Données de jeu
│       └── types/         # Types partagés
├── assets/                  # Assets (3D, audio, etc.)
├── scripts/                 # Scripts d'automatisation
└── tests/                   # Tests unitaires
```

## Planning

### Semaines 1–2 : Prototype
- Prototype du combat
- Déplacements et esquives
- Compétences de base
- Première âme

### Semaines 3–4 : Systèmes
- Système d'âmes
- Maîtrise et éveils
- Sauvegarde

### Semaines 5–6 : Contenu
- Boss
- Zones
- Progression
- Récompenses

### Semaines 7–8 : Multijoueur
- Coopération
- PvP
- Optimisation mobile
- Tests

### Post-Lancement
- Événement mondial
- Contenu supplémentaire
- Lancement progressif

## Direction Choisie

**Direction B (Chasse aux Âmes) avec Combats Qualité A**
- Collection et découvertes pour objectifs à long terme
- Qualité des combats pour l'identité du jeu
- Boss secrets et mutations cachées
- Événements coopératifs

## Technologies

**Moteur de Jeu :** Roblox Studio (Luau)

**Outils :**
- Roblox Studio (IDE principal)
- Blender (3D models, animations)
- Git (version control)
- Trello/Jira (gestion de projet)
- Discord (communication équipe)
- Rojo ( synchronisation Git <-> Roblox)
- Wally/Foreman (gestion de packages Luau)

## Pour Commencer

1. Lire le Game Design Document (`docs/GDD.md`)
2. Consulter la roadmap dans `docs/ROADMAP.md`
3. Vérifier les tâches en cours dans `docs/TASKS.md`
4. **IMPORTANT** : Lire le guide de collaboration DÉTAILLÉ dans `docs/GUIDE_COLLABORATION.md`
5. **IMPORTANT** : Lire le guide d'équipe dans `docs/GUIDE_EQUIPE.md`
6. **IMPORTANT** : Lire les tâches détaillées par rôle dans `docs/TACHES_DETAILLEES.md`

**Repository GitHub :** https://github.com/mtxuhq666/SoulBreak
