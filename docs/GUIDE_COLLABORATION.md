# Guide de Collaboration - Équipe SoulBreak

Ce guide explique comment CHAQUE membre de l'équipe doit procéder pour travailler sur le projet.

---

## 👥 Les rôles dans l'équipe

### 1. Le Créateur (mtxuhq666) - C'EST VOUS

**Ce que vous avez DÉJÀ fait :**
- ✅ Créé le dossier `C:\Users\hardo\SoulBreak`
- ✅ Créé tout le code du jeu
- ✅ Envoyé le projet sur GitHub
- ✅ Le repository est ici : https://github.com/mtxuhq666/SoulBreak

**Ce que vous devez faire MAINTENANT :**
- ⏭️ Installer Roblox Studio
- ⏭️ Installer Rojo
- ⏭️ Synchroniser le code avec Rojo
- ⏭️ Tester le jeu

**Vous N'AVEZ PAS besoin de :**
- ❌ Cloner le projet (vous l'avez déjà !)
- ❌ Le télécharger depuis GitHub (c'est déjà sur votre ordinateur)

---

### 2. Les Coéquipiers (4 personnes)

**Ce qu'ils N'ONT PAS :**
- ❌ Le dossier SoulBreak sur leur ordinateur
- ❌ Le code du jeu
- ❌ Roblox Studio installé
- ❌ Rojo installé

**Ce qu'ils DOIVENT faire :**
- ⏭️ Cloner le projet depuis GitHub
- ⏭️ Installer Roblox Studio
- ⏭️ Installer Rojo
- ⏭️ Synchroniser le code avec Rojo
- ⏭️ Lire leur rôle dans `docs/TACHES_DETAILLEES.md`

---

## 🎯 PARTIE 1 : Pour LE CRÉATEUR (mtxuhq666)

### ÉTAPE 1 : Installer Roblox Studio

**Instructions détaillées :**

1. **Aller sur le site Roblox**
   - Ouvrir votre navigateur web
   - Aller sur : https://create.roblox.com/
   - Cliquer sur "Start Creating" ou "Download Studio"

2. **Télécharger Roblox Studio**
   - Cliquer sur le bouton de téléchargement
   - Choisir votre système (Windows)
   - Attendre le téléchargement (~500 MB)
   - Ouvrir le fichier téléchargé

3. **Créer un compte Roblox (si nécessaire)**
   - Cliquer sur "Sign Up"
   - Entrer vos informations
   - Vérifier votre email
   - Se connecter

4. **Ouvrir Roblox Studio**
   - Double-cliquer sur l'icône Roblox Studio
   - Attendre le chargement
   - Vous verrez l'écran d'accueil avec des templates

5. **Vérifier que ça marche**
   - Choisir "Baseplate"
   - Cliquer sur "Edit"
   - Appuyer sur Play (F5)
   - Vous devriez voir un personnage
   - Appuyez sur Stop (Shift+F5)

---

### ÉTAPE 2 : Installer Rojo

**Instructions détaillées :**

1. **Télécharger Rojo**
   - Aller sur : https://github.com/rojo-rbx/rojo/releases
   - Chercher la dernière version (ex: v7.4.0)
   - Télécharger : `rojo-7.4.0-windows-x86_64.zip`

2. **Extraire Rojo**
   - Ouvrir le fichier ZIP
   - Extraire tout dans un dossier, par exemple : `C:\Rojo`
   - Vous devriez voir `rojo.exe` dans ce dossier

3. **Ajouter Rojo au PATH (OPTIONNEL mais RECOMMANDÉ)**
   - Ouvrir "Paramètres Windows" (Windows + I)
   - Aller dans "Système" → "À propos" → "Paramètres système avancés"
   - Cliquer sur "Variables d'environnement"
   - Dans "Variables système", chercher "Path"
   - Sélectionner "Path" et cliquer sur "Modifier"
   - Cliquer sur "Nouveau"
   - Ajouter : `C:\Rojo`
   - Cliquer sur "OK" pour fermer toutes les fenêtres
   - **IMPORTANT** : Redémarrer votre ordinateur

4. **Vérifier l'installation**
   - Ouvrir un NOUVEAU terminal (CMD ou PowerShell)
   - Taper : `rojo --version`
   - Vous devriez voir : `rojo 7.4.0` (ou la version que vous avez)

**Si le PATH ne marche pas :**
- Utilisez le chemin complet : `C:\Rojo\rojo.exe --version`

---

### ÉTAPE 3 : Créer le projet Roblox

**Instructions détaillées :**

1. **Ouvrir Roblox Studio**
   - Double-cliquer sur l'icône Roblox Studio

2. **Choisir un template**
   - Choisir "Baseplate" (recommandé)
   - Cliquer sur "Edit"

3. **Sauvegarder le projet**
   - Cliquer sur "File" → "Save As"
   - Naviguer vers : `C:\Users\hardo\SoulBreak`
   - Nommer le fichier : `SoulBreak.rbxl`
   - Cliquer sur "Save"

4. **Vérifier la sauvegarde**
   - Le fichier `SoulBreak.rbxl` devrait être dans `C:\Users\hardo\SoulBreak`
   - Ce fichier contient tout votre projet Roblox

---

### ÉTAPE 4 : Synchroniser le code avec Rojo

**Instructions détaillées :**

#### PARTIE A : Démarrer le serveur Rojo

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
   - Le serveur est actif
   - NE FERMEZ PAS ce terminal

4. **Vérifier que ça marche**
   - Ouvrir votre navigateur web
   - Aller sur : http://localhost:34872
   - Vous devriez voir l'arborescence du projet

#### PARTIE B : Installer le plugin Rojo dans Roblox Studio

1. **Ouvrir le Toolbox**
   - Dans Roblox Studio, cliquer sur l'icône "Toolbox" (mallette en haut à droite)

2. **Chercher le plugin Rojo**
   - Dans la barre de recherche, taper : "rojo"
   - Vous devriez voir "Rojo" par rojo-rbx

3. **Installer le plugin**
   - Cliquer sur "Install" ou "Add"
   - Le plugin est installé
   - Fermer le Toolbox

4. **Trouver le plugin**
   - Le plugin Rojo apparaît dans la barre du haut
   - C'est un icône "Rojo"

#### PARTIE C : Connecter Roblox Studio

1. **Cliquer sur le plugin Rojo**
   - Cliquer sur l'icône Rojo dans la barre du haut
   - Une fenêtre s'ouvre

2. **Connecter**
   - Cliquer sur "Connect"
   - L'URL devrait être : `http://localhost:34872`
   - Si ce n'est pas le cas, entrez cette URL
   - Cliquer sur "Connect"

3. **Vérifier la synchronisation**
   - Ouvrir l'Explorer (barre gauche)
   - Vous devriez voir :
     - `ReplicatedStorage/SoulBreak/Shared`
     - `ServerScriptService/SoulBreak/Server`
     - `StarterPlayer/StarterPlayerScripts/SoulBreak/Client`

4. **Sync en temps réel**
   - Chaque fois que vous modifiez un fichier dans `src/`
   - Roblox Studio se synchronise automatiquement

---

### ÉTAPE 5 : Tester le jeu

**Instructions détaillées :**

1. **Démarrer le jeu**
   - Dans Roblox Studio, appuyer sur **Play** (F5)
   - Le jeu démarre

2. **Ce que vous devriez voir**
   - Un personnage apparaît
   - L'UI de Spin apparaît
   - Le HUD apparaît

3. **Contrôles**
   - **WASD** : Se déplacer
   - **Shift** : Esquive
   - **Clic gauche** : Attaque
   - **F** : Blocage

4. **Tester le Spin**
   - Cliquer sur "SPIN"
   - Vous devriez obtenir une âme

5. **Arrêter le jeu**
   - Appuyer sur **Stop** (Shift+F5)

---

### ÉTAPE 6 : Inviter vos coéquipiers sur GitHub

**Instructions détaillées :**

1. **Aller sur le repository**
   - Aller sur : https://github.com/mtxuhq666/SoulBreak

2. **Ouvrir les paramètres**
   - Cliquer sur "Settings" (en haut)

3. **Ajouter des collaborateurs**
   - Cliquer sur "Collaborators" (menu de gauche)
   - Cliquer sur "Add people"

4. **Ajouter vos 4 coéquipiers**
   - Entrer le username GitHub de chaque coéquipier
   - Choisir "Admin" ou "Maintainer"
   - Cliquer sur "Add"

5. **Ils peuvent maintenant :**
   - Voir le code
   - Modifier le code
   - Envoyer leurs modifications

---

### ÉTAPE 7 : Partager les guides avec votre équipe

Envoyez à vos coéquipiers ce message :

```
Salut l'équipe ! Voici le projet SoulBreak.

📦 Repository GitHub : https://github.com/mtxuhq666/SoulBreak

📚 Documentation importante :
- GUIDE_EQUIPE.md : Comment s'installer et utiliser le projet
- TACHES_DETAILLEES.md : Ce que chaque rôle doit faire

👥 Rôles disponibles :
- Programmeur (Lead Dev)
- 3D Artist (Modeler)
- Animator
- Sound Designer
- Game Designer

Chacun doit choisir un rôle et lire les tâches correspondantes dans TACHES_DETAILLEES.md

Suivez les instructions dans GUIDE_EQUIPE.md pour vous installer !
```

---

## 🎯 PARTIE 2 : Pour les COÉQUIPIERS (4 personnes)

### ÉTAPE 1 : Créer un compte GitHub (si pas déjà fait)

**Instructions détaillées :**

1. **Aller sur GitHub**
   - Aller sur : https://github.com
   - Cliquer sur "Sign up"

2. **Créer le compte**
   - Entrer email, mot de passe, username
   - Vérifier l'email
   - Se connecter

---

### ÉTAPE 2 : Cloner le projet depuis GitHub

**Instructions détaillées :**

1. **Obtenir l'URL du repository**
   - Aller sur : https://github.com/mtxuhq666/SoulBreak
   - Cliquer sur le bouton vert "Code"
   - Copier l'URL : `https://github.com/mtxuhq666/SoulBreak.git`

2. **Cloner le projet**
   - Ouvrir un terminal (CMD ou PowerShell)
   - Naviguer vers votre dossier utilisateur :
     ```bash
     cd C:\Users\VOTRE-NOM
     ```
     (Remplacez VOTRE-NOM par votre vrai nom d'utilisateur Windows)

   - Cloner le projet :
     ```bash
     git clone https://github.com/mtxuhq666/SoulBreak.git
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
     - etc.

---

### ÉTAPE 3 : Installer Roblox Studio

(Même instructions que pour le créateur - voir PARTIE 1, ÉTAPE 1)

---

### ÉTAPE 4 : Installer Rojo

(Même instructions que pour le créateur - voir PARTIE 1, ÉTAPE 2)

---

### ÉTAPE 5 : Créer le projet Roblox

(Même instructions que pour le créateur - voir PARTIE 1, ÉTAPE 3)

---

### ÉTAPE 6 : Synchroniser le code avec Rojo

(Même instructions que pour le créateur - voir PARTIE 1, ÉTAPE 4)

---

### ÉTAPE 7 : Lire la documentation

**OBLIGATOIRE pour tous les coéquipiers :**

1. **Lire GUIDE_EQUIPE.md**
   - Ce fichier explique comment tout fonctionne
   - Comment utiliser Roblox Studio
   - Comment synchroniser avec Rojo
   - Comment tester le jeu

2. **Lire TACHES_DETAILLEES.md**
   - Ce fichier contient TOUTES les tâches détaillées
   - Pour chaque rôle (Programmeur, 3D Artist, etc.)
   - Étapes pas à pas
   - Checklists
   - Fichiers à modifier

3. **Choisir votre rôle**
   - Programmeur (Lead Dev)
   - 3D Artist (Modeler)
   - Animator
   - Sound Designer
   - Game Designer

4. **Commencer vos tâches**
   - Suivre les instructions dans TACHES_DETAILLEES.md
   - Cocher les checklists
   - Demander de l'aide si bloqué

---

## 🔄 PARTIE 3 : Comment travailler ensemble (Git)

### Quand vous modifiez des fichiers

**TOUS les membres de l'équipe :**

1. **Toujours commencer par un pull**
   ```bash
   git pull
   ```
   - Cela télécharge les dernières modifications des autres
   - Évite les conflits

2. **Modifier vos fichiers**
   - Faites vos modifications dans VS Code ou Roblox Studio
   - Sauvegardez les fichiers

3. **Voir les modifications**
   ```bash
   git status
   ```
   - Vous voyez quels fichiers ont été modifiés

4. **Ajouter les modifications**
   ```bash
   git add .
   ```
   - Prépare tous les fichiers modifiés

5. **Faire un commit**
   ```bash
   git commit -m "Description de ce que vous avez fait"
   ```
   - Exemple : `git commit -m "Ajouté le modèle du Spectre Mineur"`
   - Sauvegarde localement

6. **Push vers GitHub**
   ```bash
   git push
   ```
   - Envoie vos modifications vers GitHub
   - Les autres peuvent les voir

---

### Exemple de workflow concret

**Scénario : Le 3D Artist crée un modèle de mob**

1. **Le 3D Artist fait un pull**
   ```bash
   git pull
   ```

2. **Il crée le modèle dans Blender**
   - Exporte en .fbx
   - Place dans `assets/models/mobs/`

3. **Il fait un add**
   ```bash
   git add .
   ```

4. **Il fait un commit**
   ```bash
   git commit -m "Ajouté le modèle du Spectre Mineur"
   ```

5. **Il fait un push**
   ```bash
   git push
   ```

6. **Le Programmeur fait un pull**
   ```bash
   git pull
   ```
   - Il voit le nouveau modèle
   - Il peut l'utiliser dans le jeu

---

## ⚠️ PARTIE 4 : Problèmes courants et solutions

### Problème : "Conflict" quand on fait git pull

**Ce que ça veut dire :**
- Deux personnes ont modifié le même fichier
- Git ne sait pas quelle version garder

**Solution :**
1. Ouvrir le fichier en conflit
2. Vous verrez des marqueurs comme :
   ```
   <<<<<<< HEAD
   Votre version
   =======
   Version de l'autre
   >>>>>>> origin/main
   ```
3. Choisissez quelle version garder
4. Supprimez les marqueurs
5. Sauvegardez le fichier
6. Faites :
   ```bash
   git add .
   git commit -m "Résolu le conflit"
   git push
   ```

---

### Problème : "Permission denied" quand on fait git push

**Ce que ça veut dire :**
- Vous n'avez pas les droits pour modifier

**Solution :**
- Demandez au créateur (mtxuhq666) de vous ajouter comme collaborateur sur GitHub

---

### Problème : Rojo ne se connecte pas

**Ce que ça veut dire :**
- Le serveur Rojo ne tourne pas

**Solution :**
1. Vérifiez que le terminal avec `rojo serve` est ouvert
2. Vérifiez que vous voyez "Serving SoulBreak at http://localhost:34872"
3. Si ce n'est pas le cas, relancez `rojo serve`

---

### Problème : Les scripts ne s'exécutent pas dans Roblox Studio

**Ce que ça veut dire :**
- Les scripts ne sont pas dans les bons dossiers

**Solution :**
1. Vérifiez que les scripts sont dans les bons dossiers :
   - Scripts serveur → `ServerScriptService/SoulBreak/Server`
   - Scripts client → `StarterPlayer/StarterPlayerScripts/SoulBreak/Client`
   - Code partagé → `ReplicatedStorage/SoulBreak/Shared`
2. Si ce n'est pas le cas, vérifiez la synchronisation Rojo

---

## 📋 PARTIE 5 : Checklist pour le lancement

### Pour le créateur (mtxuhq666)

- [ ] Roblox Studio installé
- [ ] Rojo installé
- [ ] Projet Roblox créé
- [ ] Synchronisation Rojo fonctionne
- [ ] Jeu testé et fonctionne
- [ ] Coéquipiers ajoutés sur GitHub
- [ ] Guides partagés avec l'équipe

### Pour chaque coéquipier

- [ ] Compte GitHub créé
- [ ] Projet cloné depuis GitHub
- [ ] Roblox Studio installé
- [ ] Rojo installé
- [ ] Projet Roblox créé
- [ ] Synchronisation Rojo fonctionne
- [ ] GUIDE_EQUIPE.md lu
- [ ] TACHES_DETAILLEES.md lu
- [ ] Rôle choisi
- [ ] Tâches commencées

---

## 📞 Communication

### Où communiquer

**Recommandé : Discord**

1. **Créer un serveur Discord**
   - Aller sur https://discord.com
   - Créer un serveur "SoulBreak"
   - Inviter toute l'équipe

2. **Créer des canaux**
   - #général : Discussion générale
   - #programmeur : Pour le développeur
   - #3d-artist : Pour le modeler
   - #animator : Pour l'animator
   - #sound-designer : Pour le sound designer
   - #game-designer : Pour le game designer
   - #annonces : Annonces importantes
   - #aide : Pour demander de l'aide

3. **Partager les modifications**
   - Quand vous faites un git push, annoncez-le sur Discord
   - Exemple : "J'ai ajouté le modèle du Spectre Mineur ! #3d-artist"

---

## 🎯 Conclusion

### Résumé pour le créateur (mtxuhq666)

1. ✅ Projet créé et envoyé sur GitHub
2. ⏭️ Installer Roblox Studio
3. ⏭️ Installer Rojo
4. ⏭️ Synchroniser avec Rojo
5. ⏭️ Tester le jeu
6. ⏭️ Inviter les coéquipiers sur GitHub
7. ⏭️ Partager les guides
8. ⏭️ Créer un serveur Discord
9. ⏭️ Commencer vos tâches (Programmeur)

### Résumé pour les coéquipiers

1. ⏭️ Créer un compte GitHub (si pas déjà)
2. ⏭️ Cloner le projet : `git clone https://github.com/mtxuhq666/SoulBreak.git`
3. ⏭️ Installer Roblox Studio
4. ⏭️ Installer Rojo
5. ⏭️ Créer le projet Roblox
6. ⏭️ Synchroniser avec Rojo
7. ⏭️ Lire GUIDE_EQUIPE.md
8. ⏭️ Lire TACHES_DETAILLEES.md
9. ⏭️ Choisir un rôle
10. ⏭️ Commencer vos tâches

---

## 🚀 Bonne chance à toute l'équipe !

Repository GitHub : https://github.com/mtxuhq666/SoulBreak

**Tout le monde peut maintenant commencer !** 🎉
