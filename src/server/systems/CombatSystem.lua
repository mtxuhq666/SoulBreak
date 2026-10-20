--!strict
-- Système de combat (serveur)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local GameConfig = require(ReplicatedStorage.SoulBreak.Shared.Config.GameConfig)
local PlayerDataManager = require(script.Parent.Parent.Core.PlayerDataManager)
local PlayerTypes = require(ReplicatedStorage.SoulBreak.Shared.Types.PlayerTypes)

local CombatSystem = {}

-- RemoteEvents pour la communication client-serveur
local combatEvents = Instance.new("Folder")
combatEvents.Name = "CombatEvents"
combatEvents.Parent = ReplicatedStorage.SoulBreak

local attackEvent = Instance.new("RemoteEvent")
attackEvent.Name = "Attack"
attackEvent.Parent = combatEvents

local damageEvent = Instance.new("RemoteEvent")
damageEvent.Name = "TakeDamage"
damageEvent.Parent = combatEvents

local healEvent = Instance.new("RemoteEvent")
healEvent.Name = "Heal"
healEvent.Parent = combatEvents

-- Appliquer des dégâts à une cible
function CombatSystem.applyDamage(attacker: Player, target: Model, damage: number, attackType: string)
    -- Vérifier si la cible est un joueur
    local targetPlayer = Players:GetPlayerFromCharacter(target)

    if not targetPlayer then
        -- Cible est un ennemi/NPC
        local humanoid = target:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Health -= damage

            -- Vérifier si l'ennemi est mort
            if humanoid.Health <= 0 then
                CombatSystem.onEnemyDeath(attacker, target)
            end
        end
    else
        -- Cible est un joueur (PvP)
        local targetData = PlayerDataManager.getPlayerData(targetPlayer)
        local attackerData = PlayerDataManager.getPlayerData(attacker)

        -- Calculer les dégâts avec défense
        local finalDamage = math.max(1, damage - targetData.stats.defense)

        targetData.health -= finalDamage

        -- Notifier le client
        damageEvent:FireClient(targetPlayer, finalDamage, attacker)

        -- Vérifier si le joueur est mort
        if targetData.health <= 0 then
            CombatSystem.onPlayerDeath(targetPlayer, attacker)
        end

        PlayerDataManager.updatePlayerData(targetPlayer, targetData)
    end
end

-- Soigner un joueur
function CombatSystem.healPlayer(player: Player, amount: number)
    local data = PlayerDataManager.getPlayerData(player)
    data.health = math.min(data.health + amount, data.maxHealth)
    PlayerDataManager.updatePlayerData(player, data)

    healEvent:FireClient(player, amount)
end

-- Quand un ennemi meurt
function CombatSystem.onEnemyDeath(killer: Player, enemy: Model)
    local data = PlayerDataManager.getPlayerData(killer)

    -- Si c'est un mob, tracker les kills avec l'âme active
    local isMob = enemy:GetAttribute("IsMob")
    if isMob and data.activeSoul then
        if data.souls[data.activeSoul] then
            data.souls[data.activeSoul].mobKills += 1
            PlayerDataManager.updatePlayerData(killer, data)
        end
    end

    -- Si c'est un boss, donner son âme (si on garde le système de boss)
    local bossId = enemy:GetAttribute("BossId")
    if bossId then
        PlayerDataManager.unlockSoul(killer, bossId)
    end
end

-- Quand un joueur meurt
function CombatSystem.onPlayerDeath(player: Player, killer: Player?)
    -- Respawn le joueur
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Health = 0
        end
    end

    -- Réinitialiser la santé après respawn
    task.wait(3)
    local data = PlayerDataManager.getPlayerData(player)
    data.health = data.maxHealth
    data.stamina = data.maxStamina
    PlayerDataManager.updatePlayerData(player, data)
end

-- Gérer les attaques depuis le client
attackEvent.OnServerEvent:Connect(function(player, target: Model, attackType: string)
    local data = PlayerDataManager.getPlayerData(player)
    local damage = data.stats.damage

    -- Ajouter les dégâts de l'âme active
    if data.activeSoul then
        local SoulData = require(ReplicatedStorage.SoulBreak.Shared.Data.SoulData)
        local soul = SoulData[data.activeSoul]
        if soul then
            damage += 10 -- Bonus de base pour avoir une âme
        end
    end

    -- Calculer critique
    local isCritical = math.random() < GameConfig.Combat.criticalChance
    if isCritical then
        damage *= GameConfig.Combat.criticalMultiplier
    end

    CombatSystem.applyDamage(player, target, damage, attackType)
end)

return CombatSystem
