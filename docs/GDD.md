# Game Design Document - SOULBREAK

## 1. Vue d'Ensemble

### 1.1 Élévateur
SOULBREAK est un RPG d'action où les joueurs obtiennent des pouvoirs en volant l'âme des boss qu'ils vainquent. Ces âmes peuvent évoluer selon différentes voies, créant des builds uniques et personnalisables.

### 1.2 Public Cible
- Joueurs de RPG d'action (Dark Souls, Elden Ring, Hades)
- Joueurs de collection (Monster Hunter, Genshin Impact)
- Joueurs compétitifs (Smash Bros, Tekken)
- Âge : 16-35 ans

### 1.3 Plateformes
- Roblox (PC, Mobile, Console via Roblox)
- Disponible sur tous les appareils supportés par Roblox

## 2. Gameplay

### 2.1 Système de Combat

#### Base
- **Attaques légères** : Rapides, peu de dégâts, buildup des combos
- **Attaques lourdes** : Lentes, plus de dégâts, brise la garde
- **Esquive** : i-frame, repositionnement
- **Parade** : Bloque, contre-attaque, timing précis
- **Compétences d'âme** : Compétences uniques par âme (3 par âme)

#### Combos
- Chaines d'attaques avec animations fluides
- Cancel d'animation (dash, esquive, compétence)
- Juggling et air combos
- Finishers spectaculaires

### 2.2 Système d'Âmes (Gacha/Spin)

#### Acquisition par Spin
- Spin des âmes via système de gacha
- Coût : 100 Soul Shards par spin
- Pourcentages de chance par rareté :
  - **Common (50%)** : Âmes de base
  - **Rare (35%)** : Âmes intermédiaires
  - **Epic (12%)** : Âmes puissantes
  - **Legendary (2.5%)** : Âmes très rares
  - **Mythic (0.5%)** : Âmes légendaires
- Compensation en Soul Shards si déjà possédée

#### Âmes Disponibles (10 au total)
**Common :**
- Âme de Brume (Tank/Contrôle)
- Âme de Flamme (Dégâts)

**Rare :**
- Âme de Réflexion (Agile/Dégâts)
- Âme de Foudre (Vitesse/Dégâts)

**Epic :**
- Âme Temporelle (Utilitaire/Support)
- Âme de Glace (Contrôle/Dégâts)

**Legendary :**
- Âme d'Ombre (Assassin/Stealth)
- Âme de Gravité (Cosmique)

**Mythic :**
- Âme du Roi Déchu (Équilibré)
- Âme de Nature (Support/Contrôle)

#### Spécialisation
- 3 compétences actives par âme
- Chaque compétence a une version V2 améliorée
- Synergies entre âmes (combo de compétences)

### 2.3 Système V2 (Éveils)

#### Déblocage
- Conditions : Tuer X mobs avec l'âme + Atteindre le niveau requis
- Exemple pour Common : 100 kills + niveau 50
- Exemple pour Rare : 200 kills + niveau 100
- Exemple pour Epic : 500 kills + niveau 200
- Exemple pour Legendary : 1000 kills + niveau 400
- Exemple pour Mythic : 5000 kills + niveau 1000

#### Améliorations V2
- Compétences plus puissantes (dégâts augmentés)
- Nouveaux effets (slow, stun, réflexion)
- Cooldowns réduits
- Animations améliorées

**Exemple : Âme de Brume**
- V1 : Bouclier de Brume (absorbe les dégâts)
- V2 : Bouclier Abyssal (absorbe + réflexion de dégâts)

### 2.4 Fragments de Mémoire

#### Découverte
- Débloqués en maîtrisant une âme
- Révèlent l'histoire du boss
- Ouvrent des quêtes secrètes
- Débloquent des variantes d'éveil

#### Exemple
**Défi du Roi Déchu**
- Réussir 10 parades parfaites contre le Roi Déchu
- Révélation : "Le Roi était autrefois un gardien"
- Débloque : Quête du Palais Abandonné
- Récompense : Variante "Gardien Royal" de l'âme

## 3. Monde et Progression

### 3.1 Structure du Monde (Version Lancement)

#### Île de l'Éveil
- **Zone 1 : Sanctuaire de Pierre** (Niveau 1-50)
  - Mobs : Spectre Mineur, Gardien Pierre, Brutaliste
  - XP : 10-40 par mob
  - Soul Shards : 5-20 par mob
  - Recommandé pour : Farm initial, débloquer V2 Common

- **Zone 2 : Forêt des Échos** (Niveau 50-200)
  - Mobs : Ombre Furtive, Miroir Brisé, Illusionniste
  - XP : 50-120 par mob
  - Soul Shards : 30-80 par mob
  - Recommandé pour : Débloquer V2 Rare

- **Zone 3 : Pic des Anciens** (Niveau 200-500)
  - Mobs : Tempérament, Chronophage, Ancien Gardien
  - XP : 150-300 par mob
  - Soul Shards : 100-250 par mob
  - Recommandé pour : Débloquer V2 Epic/Legendary

### 3.2 Progression

#### Farm de Mobs
- Les mobs respawn automatiquement
- Les kills avec une âme active comptent pour le V2
- Les mobs donnent XP et Soul Shards
- Plusieurs mobs par zone pour éviter le camp

#### Système de Niveaux
- XP requis : niveau × 100
- Level up augmente la santé maximale
- Niveau requis pour débloquer V2

#### Monnaie
- **Soul Shards** : Monnaie principale (farm mobs, spin)
- **Fragments** : Monnaie premium (events, cosmétiques)
- **Shards** : Monnaie PvP (arène, saisons)

#### Collection
- Âmes collectionnées (spin)
- V2 débloquées (farm)
- Toutes les raretés à collecter

## 4. Multijoueur

### 4.1 Coopération
- Parties jusqu'à 4 joueurs
- Matchmaking rapide
- Raids (futur)
- Trading d'objets (futur)

### 4.2 Arène PvP
- 1v1 et 2v2
- Rangs et classements
- Saisons et tournois
- Récompenses exclusives

### 4.3 Événements Mondiaux

#### Mutation Mondiale
- Boss temporaire unique
- Évolution dynamique selon la communauté
- Récompenses exclusives
- Durée : 3-7 jours

#### Exemple
**ANOMALIE DÉTECTÉE — Le Dragon Zéro s'est réveillé**
- Phase 1 : Attaques de feu classiques
- Phase 2 : Apparition d'ailes (communauté à 50%)
- Phase 3 : Métamorphose (communauté à 90%)
- Récompense : Âme du Dragon Zéro

## 5. Boss (Version Lancement)

### 5.1 Gardien des Brumes
- **Style** : Tank lent avec frappes puissantes
- **Âme** : Âme de Brume
- **Mécaniques** :
  - Cache de fumme (invisibilité)
  - Coup de masse (AOE)
  - Éruption (burst damage)

### 5.2 Bête des Miroirs
- **Style** : Agil, illusions
- **Âme** : Âme de Réflexion
- **Mécaniques** :
  - Clones (le boss se duplique)
  - Inversion des contrôles
  - Réflexion de projectiles

### 5.3 Ancien de la Tempête
- **Style** : Temporel, manipulable
- **Âme** : Âme Temporelle
- **Mécaniques** :
  - Ralentissement du temps
  - Téléportation
  - Replay d'actions

## 6. Âmes (Version Lancement)

### 6.1 Âme de Brume
**Style : Tank/Contrôle**
- Compétences : Bouclier de fumme, Explosion, Attraction
- Éveils :
  - Gardien (Défense, taunt)
  - Tempête (AOE, contrôle)
- Variantes : Gardien Royal, Spectre de Brume

### 6.2 Âme de Réflexion
**Style : Agil/Dégâts**
- Compétences : Dash, Clone, Ricochet
- Éveils :
  - Assassin (Crit, esquive)
  - Miroir (Reflection, illusion)
- Variantes : Prisme Arc-en-ciel, Double Face

### 6.3 Âme Temporelle
**Style : Utilitaire/Support**
- Compétences : Ralentissement, Accélération, Retour
- Éveils :
  - Chronomancien (Buffs, debuffs)
  - Paradoxe (Inversion, disruption)
- Variantes : Gardien du Temps, Voyageur

### 6.4 Âme du Roi Déchu (Bonus)
**Style : Équilibré/Versatile**
- Compétences : Lame spectrale, Onde royale, Contre-attaque
- Éveils :
  - Roi du Chaos (Combos, dégâts)
  - Roi Céleste (Mobilité, parades)
- Variantes : Gardien Royal, Spectre Royal

## 7. Économie et Progression

### 7.1 Monnaie
- **Ordes de l'Âme** : Monnaie principale
- **Fragments** : Monnaie premium (events, cosmétiques)
- **Éclats** : Monnaie PvP (arène, saisons)

### 7.2 Progression
- Pas de pay-to-win
- Tout débloquable en jouant
- Temps estimé pour 100% : ~200 heures
- Speedruns et achievements

## 8. Différenciation

### 8.1 Points Forts
- Système d'âmes unique
- Boss qui évoluent et apprennent
- Fragments de mémoire intégrés à l'histoire
- Événements communautaires dynamiques

### 8.2 Identité Visuelle
- Transformations spectaculaires
- Animations fluides et réactives
- Effets visuels uniques par âme
- Boss caractéristiques et mémorables

## 9. Roadmap Post-Lancement

### Phase 1 (Mois 1-3)
- Nouvelle île (2 zones, 2 boss)
- 2 nouvelles âmes
- Système de raids (8 joueurs)
- Système de guildes

### Phase 2 (Mois 4-6)
- Système de crafting
- Amélioration d'équipement
- Nouveau mode (Horde/Endless)
- Système de météo dynamique

### Phase 3 (Mois 7+)
- Nouveau continent
- Système de housing
- PvP large scale
- Système de commerce
