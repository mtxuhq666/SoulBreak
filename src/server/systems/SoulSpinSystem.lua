--!strict
-- Système de Spin/Gacha pour obtenir des âmes (style Blox Fruits)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local SoulData = require(ReplicatedStorage.SoulBreak.Shared.Data.SoulData)
local PlayerDataManager = require(script.Parent.Core.PlayerDataManager)

local SoulSpinSystem = {}

-- RemoteEvent pour le spin
local spinEvents = Instance.new("Folder")
spinEvents.Name = "SpinEvents"
spinEvents.Parent = ReplicatedStorage.SoulBreak

local spinEvent = Instance.new("RemoteEvent")
spinEvent.Name = "SpinSoul"
spinEvent.Parent = spinEvents

local equipEvent = Instance.new("RemoteEvent")
equipEvent.Name = "EquipSoul"
equipEvent.Parent = spinEvents

local unlockV2Event = Instance.new("RemoteEvent")
unlockV2Event.Name = "UnlockV2"
unlockV2Event.Parent = spinEvents

-- Coût d'un spin (en monnaie)
local SPIN_COST = 100

-- Calculer les pourcentages de spin
local function calculateSpinResult(): string
    local random = math.random() * 100

    -- Mythic: 0.5%
    if random < 0.5 then
        -- Choisir une âme Mythic aléatoire
        local mythicSouls = {}
        for soulId, soul in pairs(SoulData) do
            if soul.rarity == "Mythic" then
                table.insert(mythicSouls, soulId)
            end
        end
        return mythicSouls[math.random(1, #mythicSouls)]

    -- Legendary: 2.5%
    elseif random < 3 then
        local legendarySouls = {}
        for soulId, soul in pairs(SoulData) do
            if soul.rarity == "Legendary" then
                table.insert(legendarySouls, soulId)
            end
        end
        return legendarySouls[math.random(1, #legendarySouls)]

    -- Epic: 12%
    elseif random < 15 then
        local epicSouls = {}
        for soulId, soul in pairs(SoulData) do
            if soul.rarity == "Epic" then
                table.insert(epicSouls, soulId)
            end
        end
        return epicSouls[math.random(1, #epicSouls)]

    -- Rare: 35%
    elseif random < 50 then
        local rareSouls = {}
        for soulId, soul in pairs(SoulData) do
            if soul.rarity == "Rare" then
                table.insert(rareSouls, soulId)
            end
        end
        return rareSouls[math.random(1, #rareSouls)]

    -- Common: 50%
    else
        local commonSouls = {}
        for soulId, soul in pairs(SoulData) do
            if soul.rarity == "Common" then
                table.insert(commonSouls, soulId)
            end
        end
        return commonSouls[math.random(1, #commonSouls)]
    end
end

-- Effectuer un spin
function SoulSpinSystem.spin(player: Player): (boolean, string?, string?)
    local data = PlayerDataManager.getPlayerData(player)

    -- Vérifier si le joueur a assez de monnaie
    if data.currency.soulShards < SPIN_COST then
        return false, nil, "Pas assez de Soul Shards"
    end

    -- Déduire le coût
    data.currency.soulShards -= SPIN_COST
    PlayerDataManager.updatePlayerData(player, data)

    -- Calculer le résultat
    local soulId = calculateSpinResult()
    local soul = SoulData[soulId]

    -- Vérifier si le joueur a déjà cette âme
    local isNew = not data.souls[soulId]

    if isNew then
        -- Ajouter l'âme à la collection
        data.souls[soulId] = {
            id = soul.id,
            name = soul.name,
            rarity = soul.rarity,
            masteryLevel = 0,
            experience = 0,
            hasV2 = false,
        }
        PlayerDataManager.updatePlayerData(player, data)
    else
        -- Si déjà possédée, donner de la monnaie de compensation
        local compensation = 0
        if soul.rarity == "Common" then
            compensation = 50
        elseif soul.rarity == "Rare" then
            compensation = 100
        elseif soul.rarity == "Epic" then
            compensation = 250
        elseif soul.rarity == "Legendary" then
            compensation = 500
        elseif soul.rarity == "Mythic" then
            compensation = 1000
        end

        data.currency.soulShards += compensation
        PlayerDataManager.updatePlayerData(player, data)
    end

    return true, soulId, isNew and "NEW" or "DUPLICATE"
end

-- Équiper une âme
function SoulSpinSystem.equipSoul(player: Player, soulId: string): boolean
    local data = PlayerDataManager.getPlayerData(player)

    if not data.souls[soulId] then
        return false -- Âme non possédée
    end

    data.activeSoul = soulId
    PlayerDataManager.updatePlayerData(player, data)
    return true
end

-- Débloquer V2 d'une âme
function SoulSpinSystem.unlockV2(player: Player, soulId: string): boolean
    local data = PlayerDataManager.getPlayerData(player)

    if not data.souls[soulId] then
        return false -- Âme non possédée
    end

    if data.souls[soulId].hasV2 then
        return false -- V2 déjà débloquée
    end

    local soul = SoulData[soulId]

    -- Vérifier les conditions (simplifié pour l'instant)
    -- TODO: Implémenter les vraies conditions (kills, niveau)
    if data.level < 50 then
        return false -- Niveau insuffisant
    end

    -- Débloquer V2
    data.souls[soulId].hasV2 = true
    PlayerDataManager.updatePlayerData(player, data)

    return true
end

-- Gérer les événements clients
spinEvent.OnServerEvent:Connect(function(player)
    local success, soulId, status = SoulSpinSystem.spin(player)

    if success then
        spinEvent:FireClient(player, soulId, status)
    else
        spinEvent:FireClient(player, nil, status)
    end
end)

equipEvent.OnServerEvent:Connect(function(player, soulId: string)
    local success = SoulSpinSystem.equipSoul(player, soulId)
    equipEvent:FireClient(player, success)
end)

unlockV2Event.OnServerEvent:Connect(function(player, soulId: string)
    local success = SoulSpinSystem.unlockV2(player, soulId)
    unlockV2Event:FireClient(player, success)
end)

return SoulSpinSystem
