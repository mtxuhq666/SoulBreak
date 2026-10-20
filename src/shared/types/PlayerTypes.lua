--!strict
-- Types pour le joueur et le combat

export type SoulProgress = {
    id: string,
    name: string,
    rarity: string,
    masteryLevel: number,
    experience: number,
    hasV2: boolean,
    mobKills: number, -- Nombre de mobs tués avec cette âme
}

export type PlayerData = {
    level: number,
    experience: number,
    health: number,
    maxHealth: number,
    stamina: number,
    maxStamina: number,
    souls: {[string]: SoulProgress}, -- Âmes débloquées
    activeSoul: string?, -- Âme actuellement équipée
    currency: {
        soulShards: number, -- Monnaie principale pour spin
        fragments: number, -- Monnaie premium
        shards: number, -- Monnaie PvP
    },
    stats: {
        damage: number,
        defense: number,
        speed: number,
    },
}

export type CombatState = {
    isAttacking: boolean,
    isDodging: boolean,
    isBlocking: boolean,
    comboCount: number,
    lastAttackTime: number,
    iFrames: number, -- Frames d'invincibilité
}

export type AttackData = {
    damage: number,
    attacker: Model,
    target: Model,
    attackType: string,
    isCritical: boolean,
}

return {}
