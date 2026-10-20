--!strict
-- Gestion des données joueur (serveur)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local GameConfig = require(ReplicatedStorage.SoulBreak.Shared.Config.GameConfig)
local PlayerTypes = require(ReplicatedStorage.SoulBreak.Shared.Types.PlayerTypes)

local PlayerDataManager = {}
local playerDataMap = {}

-- Données par défaut pour un nouveau joueur
local function getDefaultPlayerData(): PlayerTypes.PlayerData
    return {
        level = 1,
        experience = 0,
        health = GameConfig.Player.baseHealth,
        maxHealth = GameConfig.Player.baseHealth,
        stamina = GameConfig.Player.baseStamina,
        maxStamina = GameConfig.Player.baseStamina,
        souls = {},
        activeSoul = nil,
        currency = {
            soulShards = 500, -- Donner 500 Soul Shards au départ pour tester
            fragments = 0,
            shards = 0,
        },
        stats = {
            damage = GameConfig.Player.baseDamage,
            defense = GameConfig.Player.baseDefense,
            speed = GameConfig.Player.baseSpeed,
        },
    }
end

-- Initialiser les données d'un joueur
function PlayerDataManager.initPlayer(player: Player)
    if playerDataMap[player] then
        return
    end

    playerDataMap[player] = getDefaultPlayerData()

    -- Charger les données sauvegardées (à implémenter avec DataStore)
    -- local success, data = pcall(function()
    --     return DataStore:GetAsync("Player_" .. player.UserId)
    -- end)

    -- if success and data then
    --     playerDataMap[player] = data
    -- end
end

-- Obtenir les données d'un joueur
function PlayerDataManager.getPlayerData(player: Player): PlayerTypes.PlayerData
    return playerDataMap[player] or getDefaultPlayerData()
end

-- Mettre à jour les données d'un joueur
function PlayerDataManager.updatePlayerData(player: Player, newData: PlayerTypes.PlayerData)
    playerDataMap[player] = newData

    -- Sauvegarder les données (à implémenter avec DataStore)
    -- pcall(function()
    --     DataStore:SetAsync("Player_" .. player.UserId, newData)
    -- end)
end

-- Nettoyer les données quand un joueur quitte
function PlayerDataManager.cleanupPlayer(player: Player)
    playerDataMap[player] = nil
end

-- Ajouter de l'expérience au joueur
function PlayerDataManager.addExperience(player: Player, amount: number): boolean
    local data = PlayerDataManager.getPlayerData(player)
    data.experience += amount

    -- Vérifier si level up (système simple pour l'instant)
    local xpNeeded = data.level * 100
    if data.experience >= xpNeeded then
        data.level += 1
        data.experience -= xpNeeded
        data.maxHealth += 10
        data.health = data.maxHealth
        return true -- Level up
    end

    PlayerDataManager.updatePlayerData(player, data)
    return false
end

-- Débloquer une âme pour le joueur
function PlayerDataManager.unlockSoul(player: Player, soulId: string): boolean
    local data = PlayerDataManager.getPlayerData(player)

    if data.souls[soulId] then
        return false -- Âme déjà débloquée
    end

    local SoulData = require(ReplicatedStorage.SoulBreak.Shared.Data.SoulData)
    local soul = SoulData[soulId]

    if not soul then
        return false -- Âme inexistante
    end

    data.souls[soulId] = {
        id = soul.id,
        name = soul.name,
        rarity = soul.rarity,
        masteryLevel = 0,
        experience = 0,
        hasV2 = false,
        mobKills = 0,
    }

    PlayerDataManager.updatePlayerData(player, data)
    return true
end

-- Équiper une âme
function PlayerDataManager.equipSoul(player: Player, soulId: string): boolean
    local data = PlayerDataManager.getPlayerData(player)

    if not data.souls[soulId] then
        return false -- Âme non débloquée
    end

    data.activeSoul = soulId
    PlayerDataManager.updatePlayerData(player, data)
    return true
end

-- Événements
Players.PlayerAdded:Connect(function(player)
    PlayerDataManager.initPlayer(player)
end)

Players.PlayerRemoving:Connect(function(player)
    PlayerDataManager.cleanupPlayer(player)
end)

return PlayerDataManager
