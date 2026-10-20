--!strict
-- Types pour le système d'âmes (style Blox Fruits)

export type SoulId = "Brume" | "Reflexion" | "Temporelle" | "RoiDechu" | "Flamme" | "Foudre" | "Glace" | "Ombre" | "Gravite" | "Nature"

export type Rarity = "Common" | "Rare" | "Epic" | "Legendary" | "Mythic"

export type Soul = {
    id: SoulId,
    name: string,
    description: string,
    rarity: Rarity,
    spinChance: number, -- Pourcentage de chance (0-100)
    style: string, -- "Tank", "Agile", "Utilitaire", "Equilibre"
    skills: {SoulSkill},
    v2UnlockCondition: string, -- Condition pour débloquer V2
    hasV2: boolean, -- Si V2 est débloquée
}

export type SoulSkill = {
    id: string,
    name: string,
    description: string,
    cooldown: number,
    damage: number,
    range: number,
    type: "Active" | "Passive",
    v2Name: string?, -- Nom amélioré en V2
    v2Damage: number?, -- Dégâts améliorés en V2
    v2Description: string?, -- Description améliorée en V2
}

export type SpinResult = {
    soul: Soul,
    isNew: boolean,
    rarity: Rarity,
}

return {}
