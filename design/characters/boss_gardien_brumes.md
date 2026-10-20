# Boss - Gardien des Brumes

## Design du Boss

### Concept
Un ancien gardien corrompu par les brumes de l'île. Lent mais puissant, il utilise la fumée pour se cacher et frapper de manière imprévisible.

### Apparence
- Taille : 3x la taille du joueur
- Corps fait de roche et de brume grise
- Une épée massive en acier rouillé
- Un masque en pierre fissuré

### Barre de Vie
- **PV :** 10,000
- **Phases :** 3

## Phase 1 : Gardien (100% - 70% PV)

### Attaques
1. **Coup d'Épée**
   - Animation lente mais évidente
   - Dégâts : 200
   - Frappe dans un cône devant lui
   - Parryable

2. **Charge Brume**
   - Le bot s'arrête, s'enveloppe de fumme
   - Charge rapidement vers le joueur
   - Dégâts : 300
   - Indication : traînée de fumme vers le joueur

3. **Coup de Mass**
   - Frappe le sol avec son épée
   - Crée une onde de choc
   - Dégâts : 150 AOE
   - Indication : soulève l'épée haut

### Comportement
- Lent mais prévisible
- Répète ses attaques en patterns
- Ne change pas de phase de manière aggressive

## Phase 2 : Brume (70% - 40% PV)

### Changements
- Devient plus rapide
- Utilise plus la fumée
- Attaques deviennent plus erratiques

### Nouvelles Attaques
1. **Éruption de Brume**
   - Explose de fumée autour de lui
   - Crée une zone de dégâts
   - Dégâts : 50 par seconde
   - Durée : 5 secondes
   - Contre : Sortir de la zone

2. **Coup Fantôme**
   - Son épée traverse les murs
   - Attaque invisible
   - Dégâts : 250
   - Indication : étincelles dans l'air
   - Parryable si timing parfait

3. **Cache de Fumée**
   - Devient invisible pendant 3 secondes
   - Se repositionne
   - Réapparaît derrière le joueur
   - Contre : Écouter les bruits de pas

### Comportement
- Plus agressif
- Utilise la fumée pour dérouter
- Change de position pendant la phase

## Phase 3 : Éruption (40% - 0% PV)

### Changements
- Vitesse doublée
- Attaques en chaîne
- Fumée noire (empoisonnement)

### Attaques Finales
1. **Torrent de Brume**
   - Lance des projectiles de fumée
   - 10 projectiles
   - Homing léger
   - Dégâts : 100 chacun

2. **Éruption Mortelle**
   - Explosion massive
   - Dégâts : 500 AOE
   - Indication : boss s'arrête, se met à trembler
   - Évitement : Sortir du range

3. **Last Stand**
   - À 10% PV, le boss entre en berserk
   - Attaques très rapides
   - Ne peut être stun
   - Dégâts augmentés de 50%

### Mort
- Le boss s'effondre en poussière grise
- L'âme apparaît au centre de l'arène
- Animation de victoire du joueur

## Stratégie pour le Joueur

### Phase 1
- Apprendre les timings
- Parry les coups d'épée
- Esquiver la charge

### Phase 2
- Écouter les bruits pour le cache de fumme
- Parry le coup fantôme
- Sortir de la zone d'éruption

### Phase 3
- Kiter le boss
- Esquiver le torrent
- Sortir du range de l'éruption
- Finisher pendant le last stand

## Récompenses

### Première Victoire
- Âme de Brume
- 1000 Ordes de l'Âme
- Fragment de Mémoire : "Le Gardien"

### Victory flawless (sans être touché)
- Variant "Gardien Pur"
- 500 Ordes supplémentaires
- Titre "Purificateur"

### Speedrun (< 5 minutes)
- Variant "Brume Fulgurante"
- Classement sur le leaderboard

## Debug Checklist

- [ ] Les dégâts sont corrects
- [ ] Les timings sont parryables
- [ ] L'IA ne bug pas
- [ ] La mort du boss fonctionne
- [ ] La récompense est donnée
- [ ] La phase 2 se déclenche à 70%
- [ ] La phase 3 se déclenche à 40%
