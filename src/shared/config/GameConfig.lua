--!strict
-- Configuration principale du jeu

local GameConfig = {}

-- Configuration du joueur
GameConfig.Player = {
    baseHealth = 100,
    baseStamina = 100,
    baseDamage = 10,
    baseDefense = 5,
    baseSpeed = 16,

    staminaRegenRate = 20, -- par seconde
    staminaDodgeCost = 25,
    staminaAttackCost = 10,
    staminaBlockCost = 5, -- par seconde en bloquant

    dodgeDuration = 0.3, -- secondes d'i-frame
    attackCooldown = 0.5, -- secondes entre attaques
    comboWindow = 1.0, -- secondes pour enchaîner un combo
}

-- Configuration du combat
GameConfig.Combat = {
    comboMultiplier = 0.1, -- +10% dégâts par combo
    maxCombo = 5,
    criticalChance = 0.1, -- 10% de crit
    criticalMultiplier = 1.5, -- 1.5x dégâts en crit

    enemyBaseHealth = 50,
    enemyBaseDamage = 5,
}

-- Configuration des âmes
GameConfig.Souls = {
    maxEquipped = 1, -- Une âme équipée à la fois
    masteryXPPerUse = 10,
    masteryLevels = {
        {level = 1, xp = 0},
        {level = 2, xp = 100},
        {level = 3, xp = 300},
        {level = 4, xp = 600},
        {level = 5, xp = 1000},
        {level = 6, xp = 1500},
        {level = 7, xp = 2100},
        {level = 8, xp = 2800},
        {level = 9, xp = 3600},
        {level = 10, xp = 4500},
    },
}

-- Configuration des boss
GameConfig.Boss = {
    phaseTransitionHealthPercent = {0.5, 0.25}, -- À 50% et 25% de vie
    enrageThreshold = 0.1, -- À 10% de vie, le boss devient furieux
}

return GameConfig
