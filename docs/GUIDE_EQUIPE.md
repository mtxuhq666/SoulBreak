# Guide pour l'Équipe - SOULBREAK

Ce guide explique comment utiliser le code existant et ce que chaque membre de l'équipe doit faire.

**IMPORTANT :** Le jeu fonctionne maintenant comme Blox Fruits avec :
- Système de Spin/Gacha pour obtenir des âmes
- Farm avec des mobs (pas seulement des boss)
- Système V2 pour améliorer les âmes
- 5 raretés : Common, Rare, Epic, Legendary, Mythic

## 📋 Sommaire

1. [Configuration Initiale](#configuration-initiale)
2. [Utilisation de Roblox Studio](#utilisation-de-roblox-studio)
3. [Synchronisation avec Rojo](#synchronisation-avec-rojo)
4. [Rôles de l'Équipe](#rôles-de-léquipe)
5. [Assets à Créer](#assets-à-créer)
6. [Animations à Créer](#animations-à-créer)
7. [Développement Future](#développement-future)

---

## 🔧 Configuration Initiale

### Pour TOUS les membres de l'équipe :

---

#### ÉTAPE 1 : Installer Roblox Studio

**Instructions détaillées :**

1. **Aller sur le site officiel**
   - Ouvrir votre navigateur web
   - Aller sur : https://create.roblox.com/
   - Cliquer sur "Start Creating" ou "Télécharger"

2. **Télécharger Roblox Studio**
   - Cliquer sur le bouton "Download Studio"
   - Choisir votre système d'exploitation (Windows pour la plupart)
   - Attendre le téléchargement (~500 MB)
   - Ouvrir le fichier téléchargé (RobloxStudioLauncher.exe)

3. **Créer un compte Roblox (si nécessaire)**
   - Cliquer sur "Sign Up"
   - Entrer :
     - Date de naissance (doit avoir 13+ ans)
     - Nom d'utilisateur (ex: VotreNom_SB)
     - Mot de passe (minimum 8 caractères)
   - Vérifier votre email avec le code reçu
   - Se connecter avec vos identifiants

4. **Ouvrir Roblox Studio**
   - Double-cliquer sur l'icône Roblox Studio sur votre bureau
   - Attendre le chargement (peut prendre 1-2 minutes au premier lancement)
   - Vous verrez l'écran d'accueil avec des templates

5. **Vérifier que tout fonctionne**
   - Choisir "Baseplate" dans les templates
   - Cliquer sur "Edit"
   - Roblox Studio s'ouvre avec une scène vide
   - Appuyer sur **Play** (F5) pour tester
   - Vous devriez voir un personnage apparaître
   - Appuyer sur **Stop** (Shift+F5) pour arrêter

**Si ça ne marche pas :**
- Vérifier que vous avez une connexion internet
- Désinstaller et réinstaller Roblox Studio
- Vérifier que votre antivirus ne bloque pas l'installation

---

#### ÉTAPE 2 : Installer Git

**Instructions détaillées :**

1. **Télécharger Git**
   - Aller sur : https://git-scm.com/
   - Cliquer sur "Download for Windows"
   - Choisir la version "Standalone" (recommandée)
   - Attendre le téléchargement (~50 MB)

2. **Installer Git**
   - Ouvrir le fichier téléchargé (Git-2.x.x-64-bit.exe)
   - Cliquer sur "Next" à chaque étape avec les options par défaut :
     - **Editor** : Choisir "Vim" (déjà sélectionné) ou "VS Code" si installé
     - **PATH adjustment** : Choisir "Git from the command line" (RECOMMANDÉ)
     - **HTTPS transport backend** : Choisir "OpenSSL library"
     - **Line ending conversions** : Choisir "Checkout Windows-style"
     - **Terminal emulator** : Choisir "MinTTY"
   - Cliquer sur "Install"
   - Attendre l'installation (~1 minute)
   - Cliquer sur "Finish"

3. **Vérifier l'installation**
   - Ouvrir l'invite de commande (CMD) ou PowerShell
   - Taper : `git --version`
   - Vous devriez voir : `git version 2.x.x.windows.x`
   - Si vous voyez cette ligne, Git est installé correctement

4. **Configurer Git (IMPORTANT)**
   - Ouvrir CMD ou PowerShell
   - Taper :
     ```bash
     git config --global user.name "Votre Nom"
     git config --global user.email "votre.email@example.com"
     ```
   - Remplacer "Votre Nom" par votre vrai nom ou pseudo
   - Remplacer "votre.email@example.com" par votre vrai email

**Si ça ne marche pas :**
- Vérifier que vous avez les droits administrateur
- Redémarrer votre ordinateur après l'installation
- Réinstaller avec les options par défaut

---

#### ÉTAPE 3 : Cloner le projet SoulBreak

**Instructions détaillées :**

1. **Obtenir l'URL du repository**
   - Si le repo est sur GitHub :
     - Aller sur la page du repository
     - Cliquer sur le bouton vert "Code"
     - Copier l'URL HTTPS (ex: https://github.com/votre-nom/SoulBreak.git)
   - Si le repo est sur GitLab :
     - Aller sur la page du repository
     - Cliquer sur le bouton bleu "Clone"
     - Copier l'URL HTTPS

2. **Cloner le repository**
   - Ouvrir CMD ou PowerShell
   - Naviguer vers votre dossier utilisateur :
     ```bash
     cd C:\Users\hardo
     ```
   - Cloner le projet :
     ```bash
     git clone <l-URL-copiée>
     ```
   - Exemple :
     ```bash
     git clone https://github.com/votre-nom/SoulBreak.git
     ```
   - Attendre le téléchargement (~2-3 secondes)

3. **Vérifier que le projet est cloné**
   - Naviguer dans le dossier :
     ```bash
     cd SoulBreak
     ```
   - Lister les fichiers :
     ```bash
     dir
     ```
   - Vous devriez voir :
     - src/
     - docs/
     - design/
     - assets/
     - README.md
     - default.project.json
     - wally.toml
     - .gitignore

4. **Structure du dossier SoulBreak**
   ```
   SoulBreak/
   ├── src/                    ← Code source (IMPORTANT)
   │   ├── server/           ← Scripts serveur
   │   │   ├── core/         ← Systèmes serveur de base
   │   │   ├── systems/      ← Systèmes de jeu
   │   │   └── bosses/       ← IA des boss
   │   ├── client/           ← Scripts client
   │   │   ├── core/         ← Systèmes client de base
   │   │   ├── systems/      ← Systèmes de jeu client
   │   │   └── ui/           ← Interface utilisateur
   │   └── shared/           ← Code partagé
   │       ├── config/       ← Configuration
   │       ├── data/         ← Données de jeu
   │       └── types/        ← Types de données
   ├── docs/                  ← Documentation
   │   ├── GDD.md           ← Game Design Document
   │   ├── ROADMAP.md       ← Planning
   │   ├── TASKS.md         ← Tâches
   │   └── GUIDE_EQUIPE.md  ← Ce guide
   ├── design/                ← Game Design
   │   ├── characters/      ← Designs de personnages
   │   ├── mechanics/       ← Mécaniques
   │   ├── levels/          ← Level design
   │   └── ui/              ← Design d'interface
   ├── assets/                ← Assets 3D, sons, etc.
   ├── scripts/               ← Scripts d'automatisation
   ├── tests/                 ← Tests unitaires
   ├── README.md              ← Documentation principale
   ├── default.project.json   ← Configuration Rojo
   ├── wally.toml             ← Configuration Wally
   └── .gitignore            ← Fichiers ignorés par Git
   ```

---

#### ÉTAPE 4 : Installer Rojo

**Instructions détaillées :**

1. **Télécharger Rojo**
   - Aller sur : https://github.com/rojo-rbx/rojo/releases
   - Chercher la dernière version (ex: v7.4.0)
   - Télécharger le fichier : `rojo-7.4.0-windows-x86_64.zip`
   - Attendre le téléchargement (~10 MB)

2. **Extraire Rojo**
   - Ouvrir le fichier ZIP téléchargé
   - Extraire tout dans un dossier accessible
   - **RECOMMANDÉ** : Créer un dossier `C:\Rojo`
   - Extraire les fichiers dans `C:\Rojo`
   - Vous devriez voir :
     - `rojo.exe`
     - `sourcemap-generator.exe`
     - Et d'autres fichiers

3. **Ajouter Rojo au PATH Windows**
   - Ouvrir "Paramètres Windows" (Windows + I)
   - Aller dans "Système" → "À propos" → "Paramètres système avancés"
   - Cliquer sur "Variables d'environnement"
   - Dans "Variables système", chercher "Path"
   - Sélectionner "Path" et cliquer sur "Modifier"
   - Cliquer sur "Nouveau"
   - Ajouter : `C:\Rojo`
   - Cliquer sur "OK" pour fermer toutes les fenêtres
   - **IMPORTANT** : Redémarrer votre ordinateur pour que les changements prennent effet

4. **Vérifier l'installation**
   - Ouvrir un NOUVEAU terminal (CMD ou PowerShell)
   - Taper : `rojo --version`
   - Vous devriez voir : `rojo 7.4.0` (ou la version que vous avez téléchargée)
   - Si vous voyez cette ligne, Rojo est installé correctement

**Alternative si le PATH ne marche pas :**
- Utiliser le chemin complet :
  ```bash
  C:\Rojo\rojo.exe --version
  ```
- Créer un raccourci sur le bureau vers `C:\Rojo\rojo.exe`

---

#### ÉTAPE 5 : Installer un éditeur de code (OPTIONNEL mais RECOMMANDÉ)

**Visual Studio Code (RECOMMANDÉ)**

1. **Télécharger VS Code**
   - Aller sur : https://code.visualstudio.com/
   - Cliquer sur "Download for Windows"
   - Ouvrir le fichier téléchargé

2. **Installer VS Code**
   - Cocher les options :
     - [x] "Add 'Open with Code' to context menu"
     - [x] "Register Code as supported file type"
   - Cliquer sur "Install"
   - Attendre l'installation

3. **Installer l'extension Luau (pour Roblox)**
   - Ouvrir VS Code
   - Cliquer sur l'icône "Extensions" (carré avec 4 petits carrés, dans la barre gauche)
   - Chercher : "Luau"
   - Installer l'extension "Luau Language Server" par JohnnyMorganz
   - Cela vous donnera la coloration syntaxique et l'autocomplétion pour Luau

4. **Ouvrir le projet SoulBreak dans VS Code**
   - Ouvrir VS Code
   - Cliquer sur "File" → "Open Folder"
   - Naviguer vers `C:\Users\hardo\SoulBreak`
   - Cliquer sur "Select Folder"
   - Vous verrez tous les fichiers du projet dans la barre gauche

**Alternatives :**
- Notepad++ (plus simple)
- Sublime Text
- Atom

---

#### ÉTAPE 6 : Configurer le repository Git

**Instructions détaillées :**

1. **Créer le repository sur GitHub/GitLab (si pas déjà fait)**
   - Aller sur GitHub.com ou GitLab.com
   - Se connecter
   - Cliquer sur "New repository"
   - Nommer le repository : "SoulBreak"
   - Cocher "Public" ou "Private" selon vos préférences
   - NE PAS cocher "Initialize with README" (car le projet existe déjà)
   - Cliquer sur "Create repository"
   - Copier l'URL du repository

2. **Connecter le dossier local au repository distant**
   - Ouvrir CMD ou PowerShell
   - Naviguer vers le dossier SoulBreak :
     ```bash
     cd C:\Users\hardo\SoulBreak
     ```
   - Ajouter le repository distant :
     ```bash
     git remote add origin <l-URL-du-repository>
     ```
   - Exemple :
     ```bash
     git remote add origin https://github.com/votre-nom/SoulBreak.git
     ```

3. **Faire le premier push**
   ```bash
   git add .
   git commit -m "Initial commit - SoulBreak project"
   git branch -M main
   git push -u origin main
   ```
   - Entrer vos identifiants GitHub/GitLab si demandé
   - Attendre le push (~10 secondes)

4. **Vérifier sur GitHub/GitLab**
   - Aller sur la page du repository
   - Vous devriez voir tous les fichiers
   - Le repository est maintenant synchronisé

---

#### ÉTAPE 7 : Vérifier que tout fonctionne

**Checklist finale :**

- [ ] Roblox Studio est installé et s'ouvre
- [ ] Git est installé (`git --version` fonctionne)
- [ ] Le projet SoulBreak est cloné dans `C:\Users\hardo\SoulBreak`
- [ ] Rojo est installé (`rojo --version` fonctionne)
- [ ] VS Code est installé (optionnel)
- [ ] Le repository Git est connecté et synchronisé

**Si tout est coché, vous êtes prêt à commencer !** 🎉

---

## 🎮 Utilisation de Roblox Studio

### Créer le projet Roblox

**Instructions détaillées :**

1. **Ouvrir Roblox Studio**
   - Double-cliquer sur l'icône Roblox Studio
   - Attendre le chargement complet
   - Vous verrez l'écran d'accueil avec des templates

2. **Choisir un template**
   - RECOMMANDÉ : Choisir "Baseplate" (scène vide avec un sol)
   - ALTERNATIVE : Choisir "Empty Map" (scène complètement vide)
   - Cliquer sur "Edit" pour ouvrir le template

3. **Explorer l'interface de Roblox Studio**
   - **Barre du haut** : Menu (File, Edit, View, Test, Plugins, etc.)
   - **Barre d'outils** : Outils (Select, Move, Scale, Rotate, etc.)
   - **Explorer** (barre gauche) : Arborescence de tous les objets du jeu
   - **Properties** (barre droite) : Propriétés de l'objet sélectionné
   - **Viewport** (centre) : Vue 3D de votre scène
   - **Output** (barre du bas) : Console pour les messages d'erreur

4. **Sauvegarder le projet**
   - Cliquer sur "File" → "Save As"
   - Naviguer vers `C:\Users\hardo\SoulBreak`
   - Nommer le fichier : `SoulBreak.rbxl`
   - Cliquer sur "Save"
   - Le fichier `.rbxl` est votre fichier de projet Roblox

5. **Vérifier la sauvegarde**
   - Le fichier `SoulBreak.rbxl` devrait être dans `C:\Users\hardo\SoulBreak`
   - Taille approximative : ~1-2 MB
   - Ce fichier contient tout votre projet Roblox (scène, scripts, etc.)

---

### Synchroniser le code avec Rojo

**Instructions détaillées :**

#### PARTIE 1 : Démarrer le serveur Rojo

1. **Ouvrir un terminal**
   - Ouvrir CMD ou PowerShell
   - Naviguer vers le dossier SoulBreak :
     ```bash
     cd C:\Users\hardo\SoulBreak
     ```

2. **Démarrer le serveur Rojo**
   ```bash
   rojo serve
   ```

3. **Ce que vous devriez voir**
   ```
   Rojo 7.4.0
   Serving SoulBreak at http://localhost:34872
   ```
   - Le serveur est maintenant actif
   - L'URL est : `http://localhost:34872`
   - NE FERMEZ PAS ce terminal (le serveur doit rester ouvert)

4. **Vérifier que le serveur fonctionne**
   - Ouvrir votre navigateur web
   - Aller sur : http://localhost:34872
   - Vous devriez voir une page web avec l'arborescence du projet
   - Si vous voyez cette page, le serveur fonctionne

5. **Arrêter le serveur (quand nécessaire)**
   - Dans le terminal, appuyer sur `Ctrl + C`
   - Le serveur s'arrête
   - Pour redémarrer, retaper `rojo serve`

#### PARTIE 2 : Installer le plugin Rojo dans Roblox Studio

1. **Ouvrir le Toolbox**
   - Dans Roblox Studio, cliquer sur l'icône "Toolbox" (mallette en haut à droite)
   - Le Toolbox s'ouvre sur le côté droit

2. **Chercher le plugin Rojo**
   - Dans la barre de recherche du Toolbox, taper : "rojo"
   - Vous devriez voir "Rojo" par rojo-rbx
   - Cliquer sur le plugin pour le voir

3. **Installer le plugin**
   - Cliquer sur le bouton "Install" ou "Add"
   - Le plugin est maintenant installé
   - Vous pouvez fermer le Toolbox

4. **Trouver le plugin Rojo**
   - Le plugin Rojo apparaît dans la barre du haut
   - C'est un icône "Rojo" (généralement en haut à droite)
   - Si vous ne le voyez pas, cliquer sur "Plugins" dans le menu et chercher "Rojo"

#### PARTIE 3 : Connecter Roblox Studio au serveur Rojo

1. **Cliquer sur le plugin Rojo**
   - Cliquer sur l'icône Rojo dans la barre du haut
   - Une fenêtre s'ouvre avec les options

2. **Connecter au serveur**
   - Dans la fenêtre Rojo, cliquer sur "Connect"
   - L'URL par défaut devrait être : `http://localhost:34872`
   - Si ce n'est pas le cas, entrer cette URL
   - Cliquer sur "Connect"

3. **Ce qui se passe**
   - Roblox Studio télécharge le code depuis le serveur Rojo
   - La synchronisation dure ~2-3 secondes
   - Un message de succès apparaît : "Sync complete"

4. **Vérifier la synchronisation**
   - Ouvrir l'Explorer (barre gauche)
   - Vous devriez voir :
     - `ReplicatedStorage`
       - `SoulBreak`
         - `Shared`
           - `Config`
           - `Data`
           - `Types`
     - `ServerScriptService`
       - `SoulBreak`
         - `Server`
           - `Core`
           - `Systems`
           - `Bosses`
     - `StarterPlayer`
       - `StarterPlayerScripts`
         - `SoulBreak`
           - `Client`
             - `Core`
             - `Systems`
             - `UI`

5. **Sync en temps réel**
   - Chaque fois que vous modifiez un fichier dans `src/`
   - Le serveur Rojo détecte automatiquement le changement
   - Roblox Studio se synchronise automatiquement
   - Vous n'avez pas besoin de cliquer sur "Sync" à chaque fois

#### PARTIE 4 : Workflow de développement

**Comment modifier le code :**

1. **Modifier un fichier dans VS Code**
   - Ouvrir le fichier dans VS Code
   - Faire vos modifications
   - Sauvegarder le fichier (Ctrl + S)

2. **Voir les changements dans Roblox Studio**
   - La synchronisation est automatique
   - Vous pouvez voir les changements dans l'Explorer
   - Si vous modifiez un script, le script se met à jour automatiquement

3. **Tester les changements**
   - Appuyer sur **Play** (F5) dans Roblox Studio
   - Le jeu démarre avec vos modifications
   - Tester le jeu
   - Appuyer sur **Stop** (Shift + F5) pour arrêter

4. **Sauvegarder le projet Roblox**
   - Après avoir testé, cliquer sur "File" → "Save"
   - Cela sauvegarde le fichier `.rbxl`
   - NE PAS oublier de sauvegarder !

**Problèmes courants :**

- **"Connection failed"** : Vérifiez que le serveur Rojo tourne
- **"Sync error"** : Vérifiez que le fichier `default.project.json` existe
- **Les scripts ne s'exécutent pas** : Vérifiez qu'ils sont dans les bons dossiers
- **Les changements ne s'appliquent pas** : Sauvegardez le fichier dans VS Code

---

### Tester le jeu

**Instructions détaillées :**

1. **Démarrer le jeu**
   - Dans Roblox Studio, appuyer sur **Play** (F5)
   - OU cliquer sur le bouton "Play" (triangle vert) dans la barre du haut
   - Le jeu démarre dans la fenêtre Viewport

2. **Ce que vous devriez voir**
   - Un personnage apparaît (votre avatar Roblox)
   - Le personnage est sur le Baseplate (sol gris)
   - L'UI de Spin apparaît en haut de l'écran
   - Le HUD apparaît (barre de vie, stamina, etc.)

3. **Contrôles du joueur**
   - **W** : Avancer
   - **S** : Reculer
   - **A** : Aller à gauche
   - **D** : Aller à droite
   - **Espace** : Sauter (désactivé pour l'instant)
   - **Shift** : Esquive (dash avec i-frame)
   - **Clic gauche** : Attaque légère
   - **F** : Blocage (réduit les dégâts)

4. **Tester le mouvement**
   - Appuyer sur W pour avancer
   - Appuyer sur A/D pour aller sur les côtés
   - Appuyer sur Shift pour esquiver
   - Vous devriez voir le personnage se déplacer

5. **Tester le combat**
   - Cliquer avec le bouton gauche de la souris
   - Le personnage fait une attaque
   - L'attaque a un cooldown (ne peut pas spammer)
   - Les combos s'enchaînent si vous attaquez rapidement

6. **Tester l'UI de Spin**
   - Cliquer sur le bouton "SPIN" dans l'UI
   - L'animation de spin commence
   - Après 2 secondes, une âme apparaît
   - La rareté est affichée avec une couleur
   - Vous avez maintenant cette âme dans votre collection

7. **Tester les mobs**
   - Les mobs spawnent automatiquement dans les zones
   - Pour l'instant, les zones ne sont pas encore créées
   - Vous devez créer les zones dans Roblox Studio (voir section suivante)

8. **Arrêter le jeu**
   - Appuyer sur **Stop** (Shift + F5)
   - OU cliquer sur le bouton "Stop" (carré rouge)
   - Le jeu s'arrête et vous revenez en mode édition

---

### Système de Spin (Gacha)

**Explication détaillée :**

#### Pourcentages de chance

Le système de spin utilise des pourcentages de chance basés sur Blox Fruits :

| Rareté | Chance | Âmes |
|--------|--------|------|
| **Common** | 50% | Brume, Flamme |
| **Rare** | 35% | Réflexion, Foudre |
| **Epic** | 12% | Temporelle, Glace |
| **Legendary** | 2.5% | Ombre, Gravité |
| **Mythic** | 0.5% | Roi Déchu, Nature |

**Comment ça marche :**
- À chaque spin, le système génère un nombre aléatoire entre 0 et 100
- Si le nombre est < 0.5 → Mythic
- Si le nombre est < 3 → Legendary
- Si le nombre est < 15 → Epic
- Si le nombre est < 50 → Rare
- Sinon → Common

#### Coût du spin

- **Coût** : 100 Soul Shards par spin
- **Soul Shards au départ** : 500 (pour tester)
- **Comment obtenir des Soul Shards** :
  - Tuer des mobs (5-250 Soul Shards par mob selon le niveau)
  - Plus tard : quêtes, événements, etc.

#### Compensation si déjà possédée

Si vous spin une âme que vous avez déjà :

| Rareté | Compensation |
|--------|-------------|
| Common | 50 Soul Shards |
| Rare | 100 Soul Shards |
| Epic | 250 Soul Shards |
| Legendary | 500 Soul Shards |
| Mythic | 1000 Soul Shards |

**Exemple :**
- Vous avez déjà l'Âme de Brume (Common)
- Vous spin et obtenez encore l'Âme de Brume
- Vous recevez 50 Soul Shards de compensation
- Vous ne perdez pas votre spin !

#### Comment tester le système de Spin

1. **Vérifier vos Soul Shards**
   - L'UI affiche "Soul Shards: 500" au départ
   - Après chaque spin, le nombre diminue de 100
   - Si vous recevez une compensation, le nombre augmente

2. **Faire un spin**
   - Cliquer sur le bouton "SPIN"
   - Le bouton affiche "SPINNING..."
   - L'animation de spin commence (2 secondes)
   - Le texte change de couleur aléatoirement

3. **Voir le résultat**
   - Le nom de l'âme apparaît
   - La rareté apparaît avec une couleur :
     - Common : Gris
     - Rare : Bleu
     - Epic : Violet
     - Legendary : Or
     - Mythic : Rouge
   - Le statut apparaît :
     - "NOUVELLE ÂME !" (si c'est une nouvelle âme)
     - "DUPLICATE (Compensation)" (si déjà possédée)

4. **Équiper l'âme**
   - (Pour l'instant, l'UI d'équipement n'est pas encore implémentée)
   - Dans le futur, vous pourrez cliquer sur une âme pour l'équiper
   - L'âme équipée détermine vos compétences

---

### Système de Mobs

**Instructions détaillées :**

#### 3 zones avec des mobs différents

**Zone 1 : Sanctuaire de Pierre (Niveau 1-50)**

| Mob | PV | Dégâts | XP | Soul Shards | Respawn |
|-----|----|--------|----|-------------|---------|
| Spectre Mineur | 50 | 5 | 10 | 5 | 10s |
| Gardien Pierre | 100 | 10 | 20 | 10 | 15s |
| Brutaliste | 200 | 15 | 40 | 20 | 20s |

**Zone 2 : Forêt des Échos (Niveau 50-200)**

| Mob | PV | Dégâts | XP | Soul Shards | Respawn |
|-----|----|--------|----|-------------|---------|
| Ombre Furtive | 300 | 20 | 50 | 30 | 15s |
| Miroir Brisé | 500 | 30 | 80 | 50 | 20s |
| Illusionniste | 800 | 40 | 120 | 80 | 25s |

**Zone 3 : Pic des Anciens (Niveau 200-500)**

| Mob | PV | Dégâts | XP | Soul Shards | Respawn |
|-----|----|--------|----|-------------|---------|
| Tempérament | 1000 | 50 | 150 | 100 | 20s |
| Chronophage | 1500 | 70 | 200 | 150 | 25s |
| Ancien Gardien | 2500 | 100 | 300 | 250 | 30s |

#### Comment créer les zones dans Roblox Studio

**ÉTAPE 1 : Créer le dossier Zones**

1. Dans Roblox Studio, ouvrir l'Explorer
2. Cliquer sur "Workspace"
3. Clic droit → "Insert Object" → "Folder"
4. Nommer le dossier : "Zones"

**ÉTAPE 2 : Créer les 3 sous-dossiers**

1. Cliquer sur "Zones"
2. Clic droit → "Insert Object" → "Folder"
3. Nommer : "SanctuaireDePierre"
4. Répéter pour :
   - "ForetDesEchos"
   - "PicDesAnciens"

**ÉTAPE 3 : Créer l'environnement de chaque zone**

**Zone 1 : Sanctuaire de Pierre**

1. Sélectionner "SanctuaireDePierre"
2. Clic droit → "Insert Object" → "Part"
3. Nommer : "Sol"
4. Taille : Size = (100, 1, 100)
5. Position : Position = (0, 0, 0)
6. Material : "Slate" (pierre grise)
7. Color : Gris foncé

**Zone 2 : Forêt des Échos**

1. Sélectionner "ForetDesEchos"
2. Clic droit → "Insert Object" → "Part"
3. Nommer : "Sol"
4. Taille : Size = (100, 1, 100)
5. Position : Position = (150, 0, 0)
6. Material : "Grass"
7. Color : Vert

**Zone 3 : Pic des Anciens**

1. Sélectionner "PicDesAnciens"
2. Clic droit → "Insert Object" → "Part"
3. Nommer : "Sol"
4. Taille : Size = (100, 1, 100)
5. Position : Position = (300, 50, 0)
6. Material : "Rock"
7. Color : Gris clair

**ÉTAPE 4 : Placer les SpawnPoints pour les mobs**

**Pour Zone 1 (Sanctuaire de Pierre) :**

1. Sélectionner "SanctuaireDePierre"
2. Clic droit → "Insert Object" → "Part"
3. Nommer : "SpawnPoint1"
4. Taille : Size = (1, 1, 1)
5. Position : Position = (10, 5, 10)
6. Anchored : true
7. CanCollide : false
8. Transparancy : 1 (invisible)

Répéter pour créer 5 SpawnPoints dans la zone :
- SpawnPoint2 : (20, 5, -10)
- SpawnPoint3 : (-10, 5, 20)
- SpawnPoint4 : (-20, 5, -20)
- SpawnPoint5 : (0, 5, 0)

**Faire la même chose pour Zone 2 et Zone 3**

**ÉTAPE 5 : Initialiser les mobs (code)**

Le système `MobSystem.lua` va automatiquement :
- Spawner les mobs sur les SpawnPoints
- Respawn les mobs après leur mort
- Gérer l'IA des mobs
- Donner XP et Soul Shards quand tués

**Pour l'instant, vous devez ajouter ce code dans le serveur :**

1. Ouvrir `src/server/Main.lua`
2. Ajouter ces lignes après avoir initialisé les systèmes :
   ```lua
   -- Initialiser les zones (à faire quand les zones sont créées)
   -- local zonesFolder = workspace:WaitForChild("Zones")
   -- MobSystem.initZone("SanctuaireDePierre", zonesFolder:WaitForChild("SanctuaireDePierre"))
   -- MobSystem.initZone("ForetDesEchos", zonesFolder:WaitForChild("ForetDesEchos"))
   -- MobSystem.initZone("PicDesAnciens", zonesFolder:WaitForChild("PicDesAnciens"))
   ```

3. Décommenter ces lignes quand les zones sont créées

**ÉTAPE 6 : Tester les mobs**

1. Sauvegarder le projet
2. Appuyer sur Play (F5)
3. Les mobs devraient apparaître sur les SpawnPoints
4. Les mobs devraient se déplacer vers le joueur
5. Tuer un mob pour vérifier :
   - XP gagné
   - Soul Shards gagnés
   - Respawn automatique

### Tester le jeu

1. Dans Roblox Studio, appuyer sur **Play** (F5)
2. Le joueur apparaît avec les systèmes de mouvement et de combat
3. Les commandes sont :
   - **WASD** : Se déplacer
   - **Shift** : Esquive (dash)
   - **Clic gauche** : Attaque
   - **F** : Blocage
4. L'UI de Spin apparaît - vous pouvez spin des âmes (coût : 100 Soul Shards)
5. Les mobs spawnent dans les zones - vous pouvez les farmer pour XP et Soul Shards

### Système de Spin (Gacha)

**Pourcentages de chance :**
- Common (50%) : Âmes de base
- Rare (35%) : Âmes intermédiaires
- Epic (12%) : Âmes puissantes
- Legendary (2.5%) : Âmes très rares
- Mythic (0.5%) : Âmes légendaires

**Comment tester :**
1. Le joueur commence avec 500 Soul Shards
2. Cliquer sur le bouton "SPIN" dans l'UI
3. Attendre l'animation
4. Recevoir une âme (nouvelle ou duplicate avec compensation)

### Système de Mobs

**3 zones avec des mobs différents :**
- Zone 1 (Sanctuaire de Pierre) : Niveau 1-50
- Zone 2 (Forêt des Échos) : Niveau 50-200
- Zone 3 (Pic des Anciens) : Niveau 200-500

**Comment placer les mobs dans Roblox Studio :**
1. Créer un dossier "Zones" dans workspace
2. Créer 3 sous-dossiers : SanctuaireDePierre, ForetDesEchos, PicDesAnciens
3. Placer des SpawnPoints (Part) dans chaque zone
4. Le système MobSystem va automatiquement spawn les mobs

---

## 👥 Rôles de l'Équipe

**IMPORTANT :** Pour les tâches DÉTAILLÉES de chaque rôle, voir le fichier `TACHES_DETAILLEES.md`

Ce fichier contient :
- Toutes les tâches pour chaque rôle
- Étapes détaillées pour chaque tâche
- Fichiers à modifier
- Tests à effectuer
- Problèmes potentiels et solutions

---

### Résumé rapide des rôles

### 1. Programmeur (Lead Dev)
**Responsabilités :**
- Maintenir et améliorer le code existant
- Implémenter de nouvelles fonctionnalités
- Corriger les bugs
- Gérer la synchronisation Rojo

**Tâches immédiates :**
- [ ] Tester le système de spin (gacha)
- [ ] Tester le système de mobs
- [ ] Implémenter le système de sauvegarde (DataStore)
- [ ] Implémenter les compétences actives des âmes
- [ ] Ajouter les effets visuels des compétences

**Fichiers à modifier :**
- `src/server/systems/SoulSpinSystem.lua`
- `src/server/systems/MobSystem.lua`
- `src/server/core/PlayerDataManager.lua`
- `src/client/ui/SpinUI.lua`

---

### 2. 3D Artist (Modeler)
**Responsabilités :**
- Créer les modèles 3D des personnages
- Créer les modèles des mobs (10 types différents)
- Créer les modèles des boss (optionnel)
- Créer les environnements (zones)
- Créer les assets du jeu (armes, effets)

**Assets à créer (voir section détaillée ci-dessous) :**
- Modèle du joueur (Rig)
- Modèles des mobs (3 par zone = 9 mobs)
- Environnement des 3 zones
- Armes pour chaque âme (10 âmes)

**Outils recommandés :**
- Blender (gratuit) : https://www.blender.org/
- Roblox Studio (éditeur intégré)

**Comment importer dans Roblox :**
1. Créer le modèle dans Blender
2. Exporter en .fbx
3. Dans Roblox Studio, faire clic droit → Importer
4. Placer dans `workspace` ou `ReplicatedStorage`

---

### 3. Animator
**Responsabilités :**
- Créer les animations du joueur
- Créer les animations des boss
- Créer les animations des compétences
- Créer les animations de transformation (éveils)

**Animations à créer (voir section détaillée ci-dessous) :**
- Idle, Walk, Run
- Attack Light, Attack Heavy
- Dodge, Block
- Compétences de chaque âme
- Animations des boss

**Outils :**
- Roblox Studio Animation Editor
- Blender (pour des animations avancées)

**Comment créer des animations dans Roblox Studio :**
1. Sélectionner le Rig du personnage
2. Cliquer sur l'onglet "Plugins"
3. Ouvrir "Animation Editor"
4. Enregistrer les poses frame par frame
5. Sauvegarder dans `ReplicatedStorage/SoulBreak/Animations`

---

### 4. Sound Designer
**Responsabilités :**
- Créer les sons de combat
- Créer les sons des compétences
- Créer la musique du jeu
- Créer les voix des boss

**Sons à créer :**
- Sons d'attaque (coup léger, coup lourd)
- Sons d'esquive et blocage
- Sons de chaque compétence
- Musique d'ambiance par zone
- Voix du Gardien des Brumes

**Outils :**
- Audacity (gratuit) : https://www.audacityteam.org/
- LMMS (musique) : https://lmms.io/

**Comment importer dans Roblox :**
1. Créer/éditer le son
2. Exporter en .mp3 ou .ogg
3. Dans Roblox Studio, faire clic droit → Importer
4. Placer dans `ReplicatedStorage/SoulBreak/Sounds`

---

### 5. Game Designer
**Responsabilités :**
- Équilibrer le jeu (balancing)
- Créer les niveaux
- Concevoir les nouvelles âmes et boss
- Écrire l'histoire et les dialogues

**Tâches immédiates :**
- [ ] Tester et ajuster les dégâts
- [ ] Tester et ajuster les cooldowns
- [ ] Concevoir la Zone 1 (Sanctuaire de Pierre)
- [ ] Écrire les dialogues du Gardien des Brumes

**Fichiers à modifier :**
- `src/shared/config/GameConfig.lua` (ajuster les valeurs)
- `docs/GDD.md` (ajouter du contenu)
- `docs/ROADMAP.md` (mettre à jour le planning)

---

## 🎨 Assets à Créer

### Priorité HAUTE (pour le prototype)

#### 1. Modèle du Joueur
- **Type** : Rig humanoïde standard (R15)
- **Style** : Simple, genre anime
- **Taille** : 1.8m de hauteur
- **Emplacement** : `ReplicatedStorage/SoulBreak/Assets/PlayerRig`
- **Notes** : Utiliser le Rig R15 de Roblox comme base

#### 2. Modèle du Gardien des Brumes
- **Type** : Grand humanoïde armuré
- **Style** : Mystérieux, brumeux
- **Taille** : 3m de hauteur
- **Détails** :
  - Armure sombre avec des effets de brume
  - Grande masse ou épée
  - Yeux lumineux
- **Emplacement** : `workspace/Bosses/GardienDesBrumes`
- **Notes** : Doit avoir un Humanoid avec 500 HP

#### 3. Environnement - Sanctuaire de Pierre
- **Type** : Zone de tutoriel
- **Style** : Ruines anciennes, pierres grises
- **Éléments** :
  - Sol en pierre
  - Murs en ruine
  - Autel central
  - Brouillard léger
- **Taille** : ~100x100 studs
- **Emplacement** : `workspace/Zones/SanctuaireDePierre`

### Priorité MOYENNE (après le prototype)

#### 4. Armes par Âme
- **Âme de Brume** : Bouclier massif, épée spectrale
- **Âme de Réflexion** : Dagues, lanceur de projectiles
- **Âme Temporelle** : Bâton, sablier
- **Âme du Roi Déchu** : Épée royale

#### 5. Effets Visuels
- Particules de brume
- Effets d'esquive (trail)
- Effets de blocage (bouclier)
- Effets de compétences (explosions, ondes)

---

## 🎬 Animations à Créer

### Animations du Joueur

#### 1. Animations de base
- **Idle** : Debout, respiration légère
- **Walk** : Marche normale
- **Run** : Course

#### 2. Animations de combat
- **AttackLight1** : Coup rapide (0.3s)
- **AttackLight2** : Deuxième coup rapide (0.3s)
- **AttackLight3** : Troisième coup rapide (0.3s)
- **AttackHeavy** : Coup lent et puissant (0.6s)
- **Dodge** : Roll ou dash latéral (0.3s)
- **Block** : Posture défensive

#### 3. Animations par Âme
- **Brume_Shield** : Lever un bouclier de brume
- **Brume_Explosion** : Explosion des bras
- **Brume_Attract** : Mouvement d'attraction
- **Reflexion_Dash** : Téléportation rapide
- **Reflexion_Clone** : Apparition d'un clone
- **Reflexion_Ricochet** : Lancer de projectile

### Animations du Boss

#### Gardien des Brumes
- **Idle** : Menaçant, prêt à attaquer
- **Walk** : Marche lourde
- **AttackMelee** : Coup de masse
- **AttackAOE** : Coup au sol (explosion)
- **SmokeScreen** : Disparition dans la brume
- **PhaseTransition** : Transformation visuelle
- **Death** : Effondrement

---

## 🚀 Développement Future

### Étapes suivantes (après le prototype)

#### 1. Compléter le système de combat
- [ ] Implémenter les compétences actives
- [ ] Ajouter les effets visuels des compétences
- [ ] Créer le système de cooldown UI
- [ ] Ajouter les sons de combat

#### 2. Système d'âmes complet
- [ ] UI de sélection d'âme
- [ ] Système de maîtrise (XP par âme)
- [ ] UI d'éveil
- [ ] Transformation visuelle lors de l'éveil

#### 3. Système de boss avancé
- [ ] IA plus sophistiquée
- [ ] Mécaniques spécifiques par boss
- [ ] Système de phases visuelles
- [ ] Cutscenes d'introduction

#### 4. Multijoueur
- [ ] Système de matchmaking
- [ ] Synchronisation du combat
- [ ] UI de party
- [ ] Chat vocal

#### 5. Contenu
- [ ] Créer la Zone 2 (Forêt des Échos)
- [ ] Créer la Bête des Miroirs
- [ ] Créer la Zone 3 (Pic des Anciens)
- [ ] Créer l'Ancien de la Tempête

---

## 📝 Workflow de Développement

### Pour les programmeurs :

1. **Travailler dans le dossier `src/`**
   - Le code est synchronisé automatiquement avec Rojo
   - Utiliser un éditeur de code (VS Code recommandé)

2. **Tester dans Roblox Studio**
   - Lancer `rojo serve` dans un terminal
   - Connecter Roblox Studio
   - Appuyer sur Play pour tester

3. **Commit les changements**
   ```bash
   git add .
   git commit -m "Description du changement"
   git push
   ```

### Pour les artistes :

1. **Créer les assets dans Blender/Roblox Studio**
2. **Importer dans Roblox Studio**
3. **Sauvegarder dans le projet .rbxl**
4. **Pour partager avec l'équipe :**
   - Option A : Exporter l'asset et commit dans `assets/`
   - Option B : Utiliser un plugin de synchronisation

---

## ⚠️ Problèmes Courants

### Rojo ne se connecte pas
- Vérifier que `rojo serve` tourne
- Vérifier que le plugin Rojo est installé
- Essayer de redémarrer Roblox Studio

### Les scripts ne s'exécutent pas
- Vérifier que les scripts sont dans les bons dossiers
- Vérifier qu'il n'y a pas d'erreurs dans la console (View → Output)
- Vérifier que les modules sont correctement require()

### Le joueur ne bouge pas
- Vérifier que MovementSystem est initialisé
- Vérifier que InputManager fonctionne
- Vérifier qu'il n'y a pas de conflit avec les contrôles par défaut

---

## 📚 Ressources Utiles

### Documentation Roblox
- Roblox Developer Hub : https://create.roblox.com/docs
- API Reference : https://create.roblox.com/docs/reference

### Luau (le langage de script)
- Luau Documentation : https://luau-lang.org/

### Rojo
- Rojo GitHub : https://github.com/rojo-rbx/rojo
- Rojo Documentation : https://rojo.space/docs/

### Communautés
- Roblox DevForum : https://devforum.roblox.com/
- Discord Roblox Dev : https://discord.gg/robloxdev

---

## 🎯 Objectifs à Court Terme

### Cette semaine :
- [ ] Chaque membre installe les outils nécessaires
- [ ] Le 3D Artist crée le modèle du joueur
- [ ] Le 3D Artist crée le modèle du Gardien des Brumes
- [ ] L'Animator crée les animations de base du joueur
- [ ] Le Programmeur teste et corrige les bugs
- [ ] Le Game Designer ajuste les valeurs de balance

### Semaine prochaine :
- [ ] Créer l'environnement du Sanctuaire de Pierre
- [ ] Implémenter les compétences de l'Âme de Brume
- [ ] Créer les sons de combat
- [ ] Tester le boss Gardien des Brumes
- [ ] Ajuster l'IA du boss

---

## 💡 Conseils

1. **Communiquez** : Utilisez Discord pour partager vos progrès
2. **Testez souvent** : Ne créez pas tout sans tester
3. **Commencez simple** : Des assets simples fonctionnent mieux que des assets complexes cassés
4. **Itérez** : Améliorez progressivement
5. **Documentez** : Notez ce que vous faites pour aider les autres

---

**Bonne chance avec SOULBREAK ! 🎮**
