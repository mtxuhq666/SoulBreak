--!strict
-- Système de mobs pour le farm (style Blox Fruits)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local GameConfig = require(ReplicatedStorage.SoulBreak.Shared.Config.GameConfig)
local PlayerDataManager = require(script.Parent.Core.PlayerDataManager)

local MobSystem = {}

-- Données des mobs par zone
local MobData = {
    -- Zone 1: Sanctuaire de Pierre (Niveau 1-50)
    SanctuaireDePierre = {
        {
            name = "Spectre Mineur",
            health = 50,
            damage = 5,
            xp = 10,
            soulShards = 5,
            respawnTime = 10,
        },
        {
            name = "Gardien Pierre",
            health = 100,
            damage = 10,
            xp = 20,
            soulShards = 10,
            respawnTime = 15,
        },
        {
            name = "Brutaliste",
            health = 200,
            damage = 15,
            xp = 40,
            soulShards = 20,
            respawnTime = 20,
        },
    },

    -- Zone 2: Forêt des Échos (Niveau 50-200)
    ForetDesEchos = {
        {
            name = "Ombre Furtive",
            health = 300,
            damage = 20,
            xp = 50,
            soulShards = 30,
            respawnTime = 15,
        },
        {
            name = "Miroir Brisé",
            health = 500,
            damage = 30,
            xp = 80,
            soulShards = 50,
            respawnTime = 20,
        },
        {
            name = "Illusionniste",
            health = 800,
            damage = 40,
            xp = 120,
            soulShards = 80,
            respawnTime = 25,
        },
    },

    -- Zone 3: Pic des Anciens (Niveau 200-500)
    PicDesAnciens = {
        {
            name = "Tempérament",
            health = 1000,
            damage = 50,
            xp = 150,
            soulShards = 100,
            respawnTime = 20,
        },
        {
            name = "Chronophage",
            health = 1500,
            damage = 70,
            xp = 200,
            soulShards = 150,
            respawnTime = 25,
        },
        {
            name = "Ancien Gardien",
            health = 2500,
            damage = 100,
            xp = 300,
            soulShards = 250,
            respawnTime = 30,
        },
    },
}

-- Créer un mob
function MobSystem.spawnMob(zoneName: string, mobIndex: number, position: Vector3): Model
    local zoneMobs = MobData[zoneName]
    if not zoneMobs then return nil end

    local mobData = zoneMobs[mobIndex]
    if not mobData then return nil end

    -- Créer le modèle du mob
    local mob = Instance.new("Model")
    mob.Name = mobData.name

    -- Humanoid
    local humanoid = Instance.new("Humanoid")
    humanoid.MaxHealth = mobData.health
    humanoid.Health = mobData.health
    humanoid.WalkSpeed = 8
    humanoid.Parent = mob

    -- Partie du corps (simple pour l'instant)
    local hrp = Instance.new("HumanoidRootPart")
    hrp.Position = position
    hrp.Size = Vector3.new(2, 5, 1)
    hrp.Parent = mob

    -- Ajouter les attributs
    mob:SetAttribute("IsMob", true)
    mob:SetAttribute("MobName", mobData.name)
    mob:SetAttribute("Zone", zoneName)
    mob:SetAttribute("XP", mobData.xp)
    mob:SetAttribute("SoulShards", mobData.soulShards)

    -- IA simple du mob
    MobSystem.setupMobAI(mob)

    -- Quand le mob meurt
    humanoid.Died:Connect(function()
        local killer = humanoid:FindFirstChild("creator")
        if killer then
            local killerPlayer = killer.Value
            if killerPlayer:IsA("Player") then
                MobSystem.onMobDeath(killerPlayer, mob)
            end
        end

        -- Respawn après le délai
        task.delay(mobData.respawnTime, function()
            if mob and mob.Parent then
                mob:Destroy()
                MobSystem.spawnMob(zoneName, mobIndex, position)
            end
        end)
    end)

    mob.Parent = workspace
    return mob
end

-- IA simple du mob
function MobSystem.setupMobAI(mob: Model)
    local humanoid = mob:FindFirstChildOfClass("Humanoid")
    local hrp = mob:FindFirstChild("HumanoidRootPart")

    if not humanoid or not hrp then return end

    -- Trouver le joueur le plus proche et attaquer
    task.spawn(function()
        while humanoid.Health > 0 and mob.Parent do
            task.wait(1)

            local closestPlayer = nil
            local closestDistance = math.huge

            for _, player in pairs(Players:GetPlayers()) do
                local character = player.Character
                if character then
                    local playerHRP = character:FindFirstChild("HumanoidRootPart")
                    if playerHRP then
                        local distance = (hrp.Position - playerHRP.Position).Magnitude
                        if distance < 30 and distance < closestDistance then
                            closestDistance = distance
                            closestPlayer = player
                        end
                    end
                end
            end

            if closestPlayer then
                local character = closestPlayer.Character
                if character then
                    local playerHRP = character:FindFirstChild("HumanoidRootPart")
                    if playerHRP then
                        -- Se déplacer vers le joueur
                        humanoid:MoveTo(playerHRP.Position)

                        -- Attaquer si proche
                        if closestDistance < 5 then
                            local playerHumanoid = character:FindFirstChildOfClass("Humanoid")
                            if playerHumanoid then
                                playerHumanoid:TakeDamage(10) -- Dégâts de base
                            end
                        end
                    end
                end
            end
        end
    end)
end

-- Quand un mob meurt
function MobSystem.onMobDeath(player: Player, mob: Model)
    local xp = mob:GetAttribute("XP") or 10
    local soulShards = mob:GetAttribute("SoulShards") or 5
    local mobName = mob:GetAttribute("MobName") or "Mob"

    -- Donner de l'XP
    PlayerDataManager.addExperience(player, xp)

    -- Donner des Soul Shards
    local data = PlayerDataManager.getPlayerData(player)
    data.currency.soulShards += soulShards
    PlayerDataManager.updatePlayerData(player, data)

    -- Notifier le client
    -- TODO: Ajouter notification UI

    print("[MobSystem] " .. player.Name .. " a tué " .. mobName .. " (+ " .. xp .. " XP, +" .. soulShards .. " Soul Shards)")
end

-- Initialiser les mobs d'une zone
function MobSystem.initZone(zoneName: string, zoneFolder: Folder)
    local zoneMobs = MobData[zoneName]
    if not zoneMobs then return end

    -- Placer les spawn points (à définir dans Roblox Studio)
    local spawnPoints = zoneFolder:GetChildren()

    for i, mobData in ipairs(zoneMobs) do
        -- Créer plusieurs mobs de chaque type
        for j = 1, 5 do -- 5 mobs de chaque type
            local spawnPoint = spawnPoints[math.random(1, #spawnPoints)]
            if spawnPoint then
                local position = spawnPoint.Position + Vector3.new(math.random(-10, 10), 0, math.random(-10, 10))
                MobSystem.spawnMob(zoneName, i, position)
            end
        end
    end
end

return MobSystem
