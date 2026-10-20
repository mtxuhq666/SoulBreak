--!strict
-- Script du boss Gardien des Brumes

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local BossAI = require(script.Parent.BossAI)

-- Ce script doit être placé dans le modèle du boss dans Roblox Studio
local boss = script.Parent

-- Configurer le boss
local humanoid = boss:FindFirstChildOfClass("Humanoid")
if humanoid then
    humanoid.MaxHealth = 500
    humanoid.Health = 500
    humanoid.WalkSpeed = 8
end

-- Ajouter l'attribut BossId pour débloquer l'âme
boss:SetAttribute("BossId", "Brume")

-- Initialiser l'IA avec des comportements spécifiques
local behaviors = {
    meleeAttack = {
        damage = 30,
        range = 10,
        cooldown = 2,
    },
    aoeAttack = {
        damage = 40,
        range = 15,
        cooldown = 4,
    },
    smokeScreen = {
        duration = 5,
        cooldown = 10,
    },
}

BossAI.init(boss, behaviors)

print("[SoulBreak] Gardien des Brumes initialized")
