# Tâches Détaillées par Rôle - SOULBREAK

Ce document contient TOUTES les tâches détaillées pour chaque membre de l'équipe.

---

## 👨‍💻 Programmeur (Lead Dev)

### Tâches Immédiates (Semaine 1)

#### TÂCHE 1 : Tester le système de spin (gacha)

**Objectif :** Vérifier que le système de spin fonctionne correctement

**Étapes :**
1. Ouvrir Roblox Studio et synchroniser avec Rojo
2. Appuyer sur Play (F5)
3. Vérifier que l'UI de Spin apparaît
4. Cliquer sur le bouton "SPIN"
5. Observer l'animation
6. Vérifier le résultat (nom de l'âme, rareté, statut)
7. Vérifier que les Soul Shards sont déduits
8. Faire 10 spins pour tester les différentes raretés
9. Vérifier la compensation quand on obtient un duplicate

**Fichiers à vérifier :**
- `src/server/systems/SoulSpinSystem.lua`
- `src/client/ui/SpinUI.lua`

**Tests à effectuer :**
- [ ] Le bouton SPIN fonctionne
- [ ] L'animation dure 2 secondes
- [ ] Le résultat s'affiche correctement
- [ ] Les couleurs de rareté sont correctes
- [ ] Les Soul Shards sont déduits
- [ ] La compensation fonctionne
- [ ] Les pourcentages de chance semblent corrects

**Problèmes potentiels :**
- Le bouton ne fonctionne pas → Vérifier l'event listener
- L'animation ne s'affiche pas → Vérifier TweenService
- Les Soul Shards ne sont pas déduits → Vérifier PlayerDataManager
- La compensation ne fonctionne pas → Vérifier la logique de duplicate

---

#### TÂCHE 2 : Tester le système de mobs

**Objectif :** Vérifier que les mobs spawnent et fonctionnent correctement

**Étapes :**
1. Créer les zones dans Roblox Studio (voir GUIDE_EQUIPE.md)
2. Ajouter les SpawnPoints dans chaque zone
3. Décommenter le code d'initialisation dans `src/server/Main.lua`
4. Appuyer sur Play (F5)
5. Vérifier que les mobs apparaissent sur les SpawnPoints
6. Vérifier que les mobs se déplacent vers le joueur
7. Tuer un mob (réduire ses PV à 0)
8. Vérifier que le mob respawn après le délai
9. Vérifier que XP et Soul Shards sont donnés
10. Vérifier que les kills comptent pour le V2

**Fichiers à vérifier :**
- `src/server/systems/MobSystem.lua`
- `src/server/systems/CombatSystem.lua`
- `src/server/core/PlayerDataManager.lua`

**Tests à effectuer :**
- [ ] Les mobs spawnent sur les SpawnPoints
- [ ] Les mobs ont les bons PV et dégâts
- [ ] Les mobs se déplacent vers le joueur
- [ ] Les mobs attaquent quand ils sont proches
- [ ] Les mobs respawn après leur mort
- [ ] L'XP est donnée quand on tue un mob
- [ ] Les Soul Shards sont donnés quand on tue un mob
- [ ] Les kills comptent pour le V2

**Problèmes potentiels :**
- Les mobs ne spawnent pas → Vérifier les SpawnPoints
- Les mobs ne bougent pas → Vérifier l'IA
- Les mobs n'attaquent pas → Vérifier la distance d'attaque
- Le respawn ne fonctionne pas → Vérifier le task.delay
- L'XP n'est pas donnée → Vérifier onMobDeath

---

#### TÂCHE 3 : Implémenter le système de sauvegarde (DataStore)

**Objectif :** Sauvegarder les données du joueur dans Roblox DataStore

**Étapes :**
1. Ouvrir `src/server/core/PlayerDataManager.lua`
2. Décommenter le code de DataStore (lignes commentées)
3. Créer un DataStore dans Roblox (Game → Game Settings → Security → Enable Studio Access to API Services)
4. Tester la sauvegarde :
   - Spin une âme
   - Quitter le jeu (Stop)
   - Relancer le jeu (Play)
   - Vérifier que l'âme est toujours là
5. Tester le chargement :
   - Modifier manuellement les données dans le code
   - Relancer le jeu
   - Vérifier que les données sont chargées

**Fichiers à modifier :**
- `src/server/core/PlayerDataManager.lua`

**Code à décommenter :**
```lua
-- Dans initPlayer()
local success, data = pcall(function()
    return DataStore:GetAsync("Player_" .. player.UserId)
end)

if success and data then
    playerDataMap[player] = data
end

-- Dans updatePlayerData()
pcall(function()
    DataStore:SetAsync("Player_" .. player.UserId, newData)
end)
```

**Tests à effectuer :**
- [ ] Les données sont sauvegardées quand on quitte
- [ ] Les données sont chargées quand on rejoint
- [ ] Les Âmes sont sauvegardées
- [ ] Les Soul Shards sont sauvegardés
- [ ] Le niveau est sauvegardé
- [ ] Les kills pour V2 sont sauvegardés

**Problèmes potentiels :**
- DataStore ne fonctionne pas → Activer API Services dans les paramètres
- Les données ne sont pas sauvegardées → Vérifier le pcall
- Les données ne sont pas chargées → Vérifier le GetAsync

---

#### TÂCHE 4 : Implémenter les compétences actives des âmes

**Objectif :** Permettre au joueur d'utiliser les compétences des âmes

**Étapes :**
1. Ouvrir `src/client/systems/CombatClient.lua`
2. Ajouter des touches pour les compétences (Q, E, R par exemple)
3. Pour chaque compétence :
   - Créer une fonction qui utilise la compétence
   - Vérifier le cooldown
   - Vérifier que le joueur a assez de stamina
   - Appliquer les effets de la compétence
   - Jouer l'animation de la compétence
4. Tester chaque compétence de chaque âme

**Fichiers à modifier :**
- `src/client/systems/CombatClient.lua`
- `src/shared/data/SoulData.lua`

**Tests à effectuer :**
- [ ] Les touches Q, E, R fonctionnent
- [ ] Les compétences ont un cooldown
- [ ] Les compétences consomment de la stamina
- [ ] Les compétences infligent des dégâts
- [ ] Les compétences ont les bons effets
- [ ] Les compétences V2 sont plus puissantes

**Problèmes potentiels :**
- Les touches ne fonctionnent pas → Vérifier InputManager
- Les compétences ne s'activent pas → Vérifier la logique
- Les cooldowns ne fonctionnent pas → Vérifier le système de temps
- Les effets ne s'appliquent pas → Vérifier le code d'effet

---

#### TÂCHE 5 : Ajouter les effets visuels des compétences

**Objectif :** Ajouter des effets visuels (particules, sons) aux compétences

**Étapes :**
1. Pour chaque compétence, créer :
   - Un effet de particule (Part + ParticleEmitter)
   - Un son (Sound)
2. Dans le code de la compétence :
   - Créer l'effet visuel au bon moment
   - Jouer le son au bon moment
   - Détruire l'effet après la compétence
3. Tester chaque effet visuel

**Fichiers à modifier :**
- `src/client/systems/CombatClient.lua`
- Assets dans Roblox Studio (Particules, Sons)

**Tests à effectuer :**
- [ ] Les particules apparaissent
- [ ] Les sons jouent
- [ ] Les effets sont synchronisés avec la compétence
- [ ] Les effets sont détruits après la compétence

**Problèmes potentiels :**
- Les particules n'apparaissent pas → Vérifier le Parent
- Les sons ne jouent pas → Vérifier le SoundId
- Les effets ne sont pas détruits → Vérifier le Destroy

---

### Tâches Futures (Semaines 2-4)

#### TÂCHE 6 : Créer l'UI d'équipement des âmes

**Objectif :** Permettre au joueur d'équiper différentes âmes

**Étapes :**
1. Créer un UI qui liste toutes les âmes possédées
2. Ajouter un bouton pour équiper chaque âme
3. Quand on clique sur "Équiper" :
   - Appeler le serveur pour équiper l'âme
   - Mettre à jour l'UI
   - Mettre à jour les compétences disponibles
4. Tester l'équipement

**Fichiers à créer :**
- `src/client/ui/SoulInventoryUI.lua`

**Tests à effectuer :**
- [ ] L'UI liste toutes les âmes possédées
- [ ] Le bouton "Équiper" fonctionne
- [ ] L'âme équipée est indiquée
- [ ] Les compétences changent quand on change d'âme

---

#### TÂCHE 7 : Créer l'UI de débloquage V2

**Objectif :** Permettre au joueur de voir ses progrès vers V2

**Étapes :**
1. Créer un UI qui montre :
   - L'âme active
   - Le nombre de kills avec cette âme
   - Le niveau requis
   - La progression (barre de progression)
2. Quand les conditions sont remplies :
   - Afficher un bouton "Débloquer V2"
   - Quand on clique, appeler le serveur
   - Mettre à jour l'UI
3. Tester le débloquage

**Fichiers à créer :**
- `src/client/ui/V2UnlockUI.lua`

**Tests à effectuer :**
- [ ] L'UI montre les kills correctement
- [ ] L'UI montre le niveau requis
- [ ] La barre de progression fonctionne
- [ ] Le bouton "Débloquer V2" apparaît quand les conditions sont remplies
- [ ] Le débloquage fonctionne

---

#### TÂCHE 8 : Optimiser les performances

**Objectif :** Optimiser le jeu pour qu'il tourne à 60 FPS

**Étapes :**
1. Utiliser le Profiler de Roblox Studio
2. Identifier les goulots d'étranglement
3. Optimiser le code :
   - Réduire les boucles
   - Utiliser des pools d'objets
   - Optimiser les effets visuels
4. Tester les performances

**Fichiers à optimiser :**
- Tous les scripts serveur et client

**Tests à effectuer :**
- [ ] Le jeu tourne à 60 FPS avec 10 mobs
- [ ] Le jeu tourne à 60 FPS avec 50 mobs
- [ ] Le jeu tourne à 60 FPS avec 4 joueurs
- [ ] La mémoire n'augmente pas indéfiniment

---

## 🎨 3D Artist (Modeler)

### Tâches Immédiates (Semaine 1)

#### TÂCHE 1 : Créer le modèle du joueur (Rig)

**Objectif :** Créer un modèle de joueur simple pour le jeu

**Spécifications :**
- Style : Anime/manga simplifié
- Taille : 1.8m de hauteur (environ 5 studs de hauteur)
- Polycount : ~500-1000 triangles (optimisé pour Roblox)
- Texture : Une texture simple par partie du corps

**Étapes dans Blender :**
1. Créer un nouveau projet
2. Créer un maillage humain basique :
   - Tête (cube subdivisé)
   - Torse (cube extrudé)
   - Bras (cylindres)
   - Jambes (cylindres)
   - Mains et pieds (formes simples)
3. Ajouter les articulations :
   - Épaules
   - Coudes
   - Hanches
   - Genoux
4. Appliquer un modificateur "Mirror" pour la symétrie
5. UV unwrap le modèle
6. Créer une texture simple
7. Exporter en .fbx

**Étapes dans Roblox Studio :**
1. Importer le .fbx
2. Ajuster l'échelle si nécessaire
3. Ajouter un Humanoid
4. Tester que le modèle fonctionne comme personnage

**Fichiers à créer :**
- `assets/models/PlayerRig.fbx`
- `assets/textures/PlayerTexture.png`

**Livréables :**
- [ ] Modèle 3D du joueur (.fbx)
- [ ] Texture du joueur (.png)
- [ ] Modèle importé dans Roblox Studio

**Problèmes potentiels :**
- Le modèle ne s'anime pas → Vérifier les bones
- Le modèle est trop lourd → Réduire le polycount
- La texture ne s'affiche pas → Vérifier l'UV mapping

---

#### TÂCHE 2 : Créer les modèles des mobs (9 mobs)

**Objectif :** Créer 3 mobs pour chaque zone (9 au total)

**Spécifications par zone :**

**Zone 1 : Sanctuaire de Pierre (Niveau 1-50)**

1. **Spectre Mineur**
   - Style : Fantôme/Esprit
   - Taille : 1.5m
   - Couleur : Gris/Blanc translucide
   - Polycount : ~300 triangles

2. **Gardien Pierre**
   - Style : Golem de pierre
   - Taille : 2m
   - Couleur : Gris foncé
   - Polycount : ~500 triangles

3. **Brutaliste**
   - Style : Guerrier lourd
   - Taille : 2.2m
   - Couleur : Marron
   - Polycount : ~600 triangles

**Zone 2 : Forêt des Échos (Niveau 50-200)**

4. **Ombre Furtive**
   - Style : Assassin sombre
   - Taille : 1.6m
   - Couleur : Noir
   - Polycount : ~400 triangles

5. **Miroir Brisé**
   - Style : Créature de cristal
   - Taille : 1.8m
   - Couleur : Bleu/argent
   - Polycount : ~500 triangles

6. **Illusionniste**
   - Style : Mage mystérieux
   - Taille : 1.7m
   - Couleur : Violet
   - Polycount : ~600 triangles

**Zone 3 : Pic des Anciens (Niveau 200-500)**

7. **Tempérament**
   - Style : Élémental de feu
   - Taille : 2.5m
   - Couleur : Rouge/orange
   - Polycount : ~800 triangles

8. **Chronophage**
   - Style : Créature temporelle
   - Taille : 3m
   - Couleur : Bleu cyan
   - Polycount : ~1000 triangles

9. **Ancien Gardien**
   - Style : Boss de zone
   - Taille : 4m
   - Couleur : Or/blanc
   - Polycount : ~1500 triangles

**Étapes :**
1. Pour chaque mob :
   - Créer le modèle dans Blender
   - Appliquer les matériaux
   - Exporter en .fbx
   - Importer dans Roblox Studio
   - Ajouter un Humanoid
   - Ajuster les stats (PV, dégâts)

**Fichiers à créer :**
- `assets/models/mobs/SpectreMineur.fbx`
- `assets/models/mobs/GardienPierre.fbx`
- `assets/models/mobs/Brutaliste.fbx`
- `assets/models/mobs/OmbreFurtive.fbx`
- `assets/models/mobs/MiroirBrisé.fbx`
- `assets/models/mobs/Illusionniste.fbx`
- `assets/models/mobs/Temperament.fbx`
- `assets/models/mobs/Chronophage.fbx`
- `assets/models/mobs/AncienGardien.fbx`

**Livréables :**
- [ ] 9 modèles de mobs (.fbx)
- [ ] 9 textures de mobs (.png)
- [ ] 9 modèles importés dans Roblox Studio

**Problèmes potentiels :**
- Les mobs sont trop complexes → Simplifier les modèles
- Les mobs n'ont pas d'animations → Demander à l'animator
- Les mobs ne s'animent pas correctement → Vérifier les bones

---

#### TÂCHE 3 : Créer l'environnement des 3 zones

**Objectif :** Créer les environnements des 3 zones

**Spécifications par zone :**

**Zone 1 : Sanctuaire de Pierre**
- Style : Ruines anciennes
- Taille : 100x100 studs
- Éléments :
  - Sol en pierre (texture de pierre)
  - Murs en ruine (partiellement détruits)
  - Autel central (structure sacrée)
  - Brouillard léger (particules)
  - Petites colonnes

**Zone 2 : Forêt des Échos**
- Style : Forêt mystérieuse
- Taille : 100x100 studs
- Éléments :
  - Sol en herbe (texture d'herbe)
  - Arbres (modèles simples)
  - Pierreux
  - Fleuves (eau)
  - Feuilles (particules)

**Zone 3 : Pic des Anciens**
- Style : Montagne enneigée
- Taille : 100x100 studs
- Éléments :
  - Sol en roche (texture de roche)
  - Pics montagneux
  - Neige (texture blanche)
  - Glace (particules)
  - Structures anciennes

**Étapes :**
1. Pour chaque zone :
   - Créer le sol dans Roblox Studio (Part)
   - Ajouter les éléments (Parts ou modèles importés)
   - Placer les SpawnPoints pour les mobs
   - Ajouter des particules pour l'ambiance
   - Ajouter de l'éclairage

**Fichiers à créer :**
- Dossiers dans workspace : `Zones/SanctuaireDePierre`, `Zones/ForetDesEchos`, `Zones/PicDesAnciens`
- Modèles d'arbres, rochers, etc. (optionnel)

**Livréables :**
- [ ] Zone 1 créée avec tous les éléments
- [ ] Zone 2 créée avec tous les éléments
- [ ] Zone 3 créée avec tous les éléments
- [ ] SpawnPoints placés dans chaque zone
- [ ] Ambiance (particules, éclairage)

**Problèmes potentiels :**
- Les zones sont trop grandes → Réduire la taille
- Les zones sont trop vides → Ajouter plus d'éléments
- Les zones causent des lag → Optimiser les éléments

---

### Tâches Futures (Semaines 2-4)

#### TÂCHE 4 : Créer les armes pour chaque âme

**Objectif :** Créer des armes visuelles pour chaque âme

**Armes à créer (10 âmes = 10 armes) :**

1. **Âme de Brume** : Bouclier massif + épée spectrale
2. **Âme de Flamme** : Épée enflammée
3. **Âme de Réflexion** : Dagues jumelles
4. **Âme de Foudre** : Bâton électrique
5. **Âme Temporelle** : Sablier géant
6. **Âme de Glace** : Épée de glace
7. **Âme d'Ombre** : Dagues d'ombre
8. **Âme de Gravité** : Orbe cosmique
9. **Âme du Roi Déchu** : Épée royale
10. **Âme de Nature** : Bâton de bois

**Étapes :**
1. Pour chaque arme :
   - Créer le modèle dans Blender
   - Exporter en .fbx
   - Importer dans Roblox Studio
   - Attacher au modèle du joueur

**Livréables :**
- [ ] 10 modèles d'armes (.fbx)
- [ ] 10 textures d'armes (.png)
- [ ] 10 armes importées dans Roblox Studio

---

#### TÂCHE 5 : Créer les effets visuels (VFX)

**Objectif :** Créer des effets visuels pour les compétences

**Effets à créer :**
- Particules de brume (Âme de Brume)
- Flammes (Âme de Flamme)
- Éclairs (Âme de Foudre)
- Glace (Âme de Glace)
- Ombre (Âme d'Ombre)
- Gravité (Âme de Gravité)
- Nature (Âme de Nature)

**Étapes :**
1. Créer des particules dans Roblox Studio (ParticleEmitter)
2. Configurer les propriétés (couleur, taille, durée)
3. Tester les effets

**Livréables :**
- [ ] Effets visuels pour chaque compétence

---

## 🎬 Animator

### Tâches Immédiates (Semaine 1)

#### TÂCHE 1 : Créer les animations de base du joueur

**Objectif :** Créer les animations fondamentales du joueur

**Animations à créer :**

1. **Idle**
   - Durée : 1-2 secondes (loop)
   - Description : Le joueur respire légèrement
   - Poses : Debout, bras le long du corps, respiration légère

2. **Walk**
   - Durée : 1 seconde (loop)
   - Description : Le joueur marche normalement
   - Poses : Jambe gauche avant, jambe droite avant, alternance

3. **Run**
   - Durée : 0.8 secondes (loop)
   - Description : Le joueur court
   - Poses : Mouvement de course rapide

**Étapes dans Roblox Studio :**
1. Sélectionner le Rig du joueur
2. Ouvrir l'Animation Editor (Plugins → Animation Editor)
3. Créer une nouvelle animation
4. Pour chaque frame (0, 0.1, 0.2, etc.) :
   - Déplacer les bones
   - Créer une pose
5. Sauvegarder l'animation
6. Exporter en .anim

**Fichiers à créer :**
- `ReplicatedStorage/SoulBreak/Animations/Idle.anim`
- `ReplicatedStorage/SoulBreak/Animations/Walk.anim`
- `ReplicatedStorage/SoulBreak/Animations/Run.anim`

**Livréables :**
- [ ] Animation Idle
- [ ] Animation Walk
- [ ] Animation Run

**Problèmes potentiels :**
- L'animation ne bouge pas → Vérifier les keyframes
- L'animation est trop rapide → Ajuster la durée
- L'animation glitch → Vérifier les transitions

---

#### TÂCHE 2 : Créer les animations de combat du joueur

**Objectif :** Créer les animations d'attaque et d'esquive

**Animations à créer :**

1. **AttackLight1**
   - Durée : 0.3 secondes
   - Description : Coup rapide avec le bras droit
   - Poses : Bras reculé → coup avant → retour

2. **AttackLight2**
   - Durée : 0.3 secondes
   - Description : Coup rapide avec le bras gauche
   - Poses : Bras reculé → coup avant → retour

3. **AttackLight3**
   - Durée : 0.3 secondes
   - Description : Coup rapide en diagonale
   - Poses : Bras reculé → coup diagonal → retour

4. **AttackHeavy**
   - Durée : 0.6 secondes
   - Description : Coup lent et puissant
   - Poses : Preparation → coup puissant → retour

5. **Dodge**
   - Durée : 0.3 secondes
   - Description : Roll latéral
   - Poses : Accroupi → roll → relevé

6. **Block**
   - Durée : Loop
   - Description : Posture défensive
   - Poses : Bras devant le corps, genoux légèrement fléchis

**Étapes :**
1. Pour chaque animation :
   - Créer une nouvelle animation
   - Créer les keyframes
   - Ajuster les poses
   - Sauvegarder

**Fichiers à créer :**
- `ReplicatedStorage/SoulBreak/Animations/AttackLight1.anim`
- `ReplicatedStorage/SoulBreak/Animations/AttackLight2.anim`
- `ReplicatedStorage/SoulBreak/Animations/AttackLight3.anim`
- `ReplicatedStorage/SoulBreak/Animations/AttackHeavy.anim`
- `ReplicatedStorage/SoulBreak/Animations/Dodge.anim`
- `ReplicatedStorage/SoulBreak/Animations/Block.anim`

**Livréables :**
- [ ] 3 animations d'attaque légère
- [ ] 1 animation d'attaque lourde
- [ ] 1 animation d'esquive
- [ ] 1 animation de blocage

**Problèmes potentiels :**
- Les attaques ne semblent puissantes → Ajouter plus de mouvement
- L'esquive ne semble fluide → Ajuster les keyframes
- Le blocage ne semble défensif → Ajuster la pose

---

#### TÂCHE 3 : Créer les animations des mobs

**Objectif :** Créer les animations de mouvement et d'attaque des mobs

**Animations à créer (pour chaque mob) :**

1. **MobIdle**
   - Durée : 1-2 secondes (loop)
   - Description : Le mob attend

2. **MobWalk**
   - Durée : 1 seconde (loop)
   - Description : Le mob se déplace

3. **MobAttack**
   - Durée : 0.5 secondes
   - Description : Le mob attaque

4. **MobDeath**
   - Durée : 1 seconde
   - Description : Le mob meurt

**Étapes :**
1. Pour chaque mob (9 mobs) :
   - Sélectionner le Rig du mob
   - Créer les 4 animations
   - Sauvegarder

**Fichiers à créer :**
- 36 animations au total (9 mobs × 4 animations)

**Livréables :**
- [ ] Animations pour Spectre Mineur
- [ ] Animations pour Gardien Pierre
- [ ] Animations pour Brutaliste
- [ ] Animations pour Ombre Furtive
- [ ] Animations pour Miroir Brisé
- [ ] Animations pour Illusionniste
- [ ] Animations pour Tempérament
- [ ] Animations pour Chronophage
- [ ] Animations pour Ancien Gardien

**Problèmes potentiels :**
- Trop d'animations → Prioriser les mobs importants
- Les animations ne sont pas uniques → Créer des variations
- Les animations ne s'appliquent pas → Vérifier le code

---

### Tâches Futures (Semaines 2-4)

#### TÂCHE 4 : Créer les animations des compétences d'âme

**Objectif :** Créer les animations pour chaque compétence de chaque âme

**Compétences à animer (10 âmes × 3 compétences = 30 animations)**

**Exemples :**
- Bouclier de Brume : Lever les bras, bouclier apparaît
- Explosion de Brume : Écarte les bras, explosion
- Boule de Feu : Lance un projectile
- Dash : Téléportation rapide
- etc.

**Étapes :**
1. Pour chaque compétence :
   - Créer une animation spécifique
   - Synchroniser avec l'effet visuel
   - Tester

**Livréables :**
- [ ] 30 animations de compétences

---

#### TÂCHE 5 : Créer les animations V2

**Objectif :** Créer des animations améliorées pour les compétences V2

**Animations à créer :**
- Même liste que les compétences normales
- Mais plus spectaculaires
- Plus de mouvement
- Plus d'impact

**Livréables :**
- [ ] 30 animations V2

---

## 🔊 Sound Designer

### Tâches Immédiates (Semaine 1)

#### TÂCHE 1 : Créer les sons de combat

**Objectif :** Créer les sons pour le combat de base

**Sons à créer :**

1. **AttackLight**
   - Durée : 0.2 secondes
   - Description : Son de coup léger (swish)
   - Format : .mp3 ou .ogg

2. **AttackHeavy**
   - Durée : 0.4 secondes
   - Description : Son de coup lourd (impact)
   - Format : .mp3 ou .ogg

3. **Dodge**
   - Durée : 0.3 secondes
   - Description : Son d'esquive (whoosh)
   - Format : .mp3 ou .ogg

4. **Block**
   - Durée : 0.2 secondes
   - Description : Son de blocage (clank)
   - Format : .mp3 ou .ogg

5. **Hit**
   - Durée : 0.1 secondes
   - Description : Son d'impact sur l'ennemi
   - Format : .mp3 ou .ogg

**Étapes dans Audacity :**
1. Créer ou télécharger des sons
2. Éditer si nécessaire
3. Exporter en .mp3 ou .ogg
4. Importer dans Roblox Studio

**Fichiers à créer :**
- `assets/sounds/combat/AttackLight.mp3`
- `assets/sounds/combat/AttackHeavy.mp3`
- `assets/sounds/combat/Dodge.mp3`
- `assets/sounds/combat/Block.mp3`
- `assets/sounds/combat/Hit.mp3`

**Livréables :**
- [ ] 5 sons de combat

**Problèmes potentiels :**
- Les sons sont trop longs → Couper dans Audacity
- Les sons sont trop forts → Ajuster le volume
- Les sons ne sont pas adaptés → Changer de son

---

#### TÂCHE 2 : Créer les sons des compétences

**Objectif :** Créer les sons pour chaque compétence de chaque âme

**Sons à créer (10 âmes × 3 compétences = 30 sons)**

**Exemples :**
- Bouclier de Brume : Son de bouclier apparaissant
- Explosion de Brume : Son d'explosion
- Boule de Feu : Son de feu
- Dash : Son de téléportation
- etc.

**Étapes :**
1. Pour chaque compétence :
   - Créer ou télécharger un son
   - Éditer si nécessaire
   - Exporter
   - Importer dans Roblox Studio

**Fichiers à créer :**
- `assets/sounds/skills/[NomCompetence].mp3`

**Livréables :**
- [ ] 30 sons de compétences

---

#### TÂCHE 3 : Créer la musique d'ambiance

**Objectif :** Créer 3 musiques d'ambiance (une par zone)

**Musiques à créer :**

1. **Zone 1 : Sanctuaire de Pierre**
   - Style : Mystérieux, calme
   - Durée : 2-3 minutes (loop)
   - Instruments : Cordes, piano léger

2. **Zone 2 : Forêt des Échos**
   - Style : Nature, mystérieux
   - Durée : 2-3 minutes (loop)
   - Instruments : Flûte, cordes, sons de nature

3. **Zone 3 : Pic des Anciens**
   - Style : Épique, intense
   - Durée : 2-3 minutes (loop)
   - Instruments : Orchestre, percussions

**Étapes dans LMMS :**
1. Créer un nouveau projet
2. Ajouter les instruments
3. Composer la mélodie
4. Ajouter les couches
5. Exporter en .mp3

**Fichiers à créer :**
- `assets/music/Zone1.mp3`
- `assets/music/Zone2.mp3`
- `assets/music/Zone3.mp3`

**Livréables :**
- [ ] 3 musiques d'ambiance

**Problèmes potentiels :**
- La musique est trop courte → Ajouter plus de sections
- La musique est ennuyeuse → Ajouter plus de variation
- La musique ne loop pas bien → Ajuster la fin

---

### Tâches Futures (Semaines 2-4)

#### TÂCHE 4 : Créer les sons UI

**Objectif :** Créer les sons pour l'interface utilisateur

**Sons à créer :**
- Clic sur bouton
- Spin animation
- Nouvelle âme obtenue
- Level up
- V2 débloqué

**Livréables :**
- [ ] 5 sons UI

---

#### TÂCHE 5 : Créer les sons des mobs

**Objectif :** Créer les sons pour les mobs

**Sons à créer :**
- Mob attack
- Mob death
- Mob idle (grunts)

**Livréables :**
- [ ] Sons pour les 9 mobs

---

## 🎮 Game Designer

### Tâches Immédiates (Semaine 1)

#### TÂCHE 1 : Tester et ajuster les valeurs de balance

**Objectif :** Équilibrer le jeu pour qu'il soit amusant et équitable

**Valeurs à tester :**

1. **Dégâts du joueur**
   - Attaque légère : 10
   - Attaque lourde : 20
   - Compétences : 30-100

2. **PV des mobs**
   - Zone 1 : 50-200
   - Zone 2 : 300-800
   - Zone 3 : 1000-2500

3. **Dégâts des mobs**
   - Zone 1 : 5-15
   - Zone 2 : 20-40
   - Zone 3 : 50-100

4. **Cooldowns des compétences**
   - Compétences légères : 3-8 secondes
   - Compétences lourdes : 10-20 secondes
   - Ultime : 25-30 secondes

**Étapes :**
1. Jouer au jeu
2. Noter ce qui est trop fort/faible
3. Ajuster les valeurs dans `src/shared/config/GameConfig.lua`
4. Retester
5. Répéter jusqu'à ce que le jeu soit équilibré

**Fichiers à modifier :**
- `src/shared/config/GameConfig.lua`
- `src/shared/data/SoulData.lua`

**Tests à effectuer :**
- [ ] Le joueur peut tuer les mobs de Zone 1 en 2-3 coups
- [ ] Le joueur peut survivre aux mobs de Zone 1
- [ ] Les compétences ne sont pas trop spammable
- [ ] Les compétences ne sont pas inutiles
- [ ] Le jeu n'est ni trop facile ni trop difficile

**Problèmes potentiels :**
- Le jeu est trop facile → Augmenter les dégâts des mobs
- Le jeu est trop difficile → Diminuer les dégâts des mobs
- Les compétences sont trop fortes → Augmenter les cooldowns
- Les compétences sont trop faibles → Diminuer les cooldowns

---

#### TÂCHE 2 : Concevoir la Zone 1 (Sanctuaire de Pierre)

**Objectif :** Créer le level design de la Zone 1

**Éléments à concevoir :**
- Placement des mobs
- Placement des SpawnPoints
- Chemins pour le joueur
- Points d'intérêt
- Checkpoints

**Étapes :**
1. Dessiner une carte de la zone (sur papier ou numérique)
2. Définir les zones de spawn des mobs
3. Définir les chemins du joueur
4. Placer les éléments dans Roblox Studio
5. Tester la disposition

**Livréables :**
- [ ] Carte de la Zone 1
- [ ] Zone 1 créée dans Roblox Studio
- [ ] Placement des mobs testé

---

#### TÂCHE 3 : Écrire les dialogues du Gardien des Brumes

**Objectif :** Écrire les dialogues pour le boss (si gardé)

**Dialogues à écrire :**
- Introduction du boss
- Phrases pendant le combat
- Mort du boss
- Dialogue après la victoire

**Étapes :**
1. Définir la personnalité du boss
2. Écrire les dialogues
3. Intégrer dans le jeu (quand le système de dialogue est prêt)

**Livréables :**
- [ ] Script de dialogues

---

### Tâches Futures (Semaines 2-4)

#### TÂCHE 4 : Concevoir la Zone 2 (Forêt des Échos)

**Objectif :** Créer le level design de la Zone 2

**Étapes :**
- Même processus que Zone 1
- Ajouter des éléments spécifiques (arbres, eau, etc.)

**Livréables :**
- [ ] Carte de la Zone 2
- [ ] Zone 2 créée dans Roblox Studio

---

#### TÂCHE 5 : Concevoir la Zone 3 (Pic des Anciens)

**Objectif :** Créer le level design de la Zone 3

**Étapes :**
- Même processus que Zone 1 et 2
- Ajouter des éléments spécifiques (montagne, neige, etc.)

**Livréables :**
- [ ] Carte de la Zone 3
- [ ] Zone 3 créée dans Roblox Studio

---

#### TÂCHE 6 : Créer des quêtes

**Objectif :** Créer des quêtes pour guider le joueur

**Quêtes à créer :**
- Quête tutoriale : Spin votre première âme
- Quête de farm : Tuez 10 mobs
- Quête de V2 : Débloquez votre première V2
- Quêtes quotidiennes : Farm X mobs, gagner Y Soul Shards

**Étapes :**
1. Définir les objectifs de chaque quête
2. Définir les récompenses
3. Implémenter dans le code (quand le système de quêtes est prêt)

**Livréables :**
- [ ] 5-10 quêtes

---

## 📅 Planning Général

### Semaine 1
- Programmeur : Tester spin, tester mobs, DataStore
- 3D Artist : Modèle joueur, 3 mobs, Zone 1
- Animator : Animations de base, animations mobs
- Sound Designer : Sons combat, sons compétences
- Game Designer : Balance, Zone 1, dialogues

### Semaine 2
- Programmeur : Compétences actives, effets visuels
- 3D Artist : 6 mobs restants, Zones 2 et 3
- Animator : Animations compétences
- Sound Designer : Musiques, sons UI
- Game Designer : Zones 2 et 3, quêtes

### Semaine 3
- Programmeur : UI équipement, UI V2
- 3D Artist : Armes, effets visuels
- Animator : Animations V2
- Sound Designer : Sons mobs
- Game Designer : Quêtes, événements

### Semaine 4
- Programmeur : Optimisation, bug fixing
- 3D Artist : Améliorations visuelles
- Animator : Améliorations animations
- Sound Designer : Mixage final
- Game Designer : Balancing final, playtesting

---

## ✅ Checklist Finale

### Pour le lancement du prototype

**Programmeur :**
- [ ] Système de spin fonctionne
- [ ] Système de mobs fonctionne
- [ ] Sauvegarde DataStore fonctionne
- [ ] Compétences actives implémentées
- [ ] Effets visuels implémentés
- [ ] UI équipement implémentée
- [ ] UI V2 implémentée
- [ ] Optimisation effectuée

**3D Artist :**
- [ ] Modèle joueur créé
- [ ] 9 mobs créés
- [ ] 3 zones créées
- [ ] 10 armes créées
- [ ] Effets visuels créés

**Animator :**
- [ ] Animations de base créées
- [ ] Animations combat créées
- [ ] Animations mobs créées
- [ ] Animations compétences créées
- [ ] Animations V2 créées

**Sound Designer :**
- [ ] Sons combat créés
- [ ] Sons compétences créés
- [ ] Musiques créées
- [ ] Sons UI créés
- [ ] Sons mobs créés

**Game Designer :**
- [ ] Balance effectuée
- [ ] 3 zones conçues
- [ ] Dialogues écrits
- [ ] Quêtes créées
- [ ] Playtesting effectué

---

**Bonne chance à toute l'équipe ! 🚀**
