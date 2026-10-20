--!strict
-- Système de combat côté client

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local InputManager = require(script.Parent.Parent.Core.InputManager)
local GameConfig = require(ReplicatedStorage.SoulBreak.Shared.Config.GameConfig)
local PlayerTypes = require(ReplicatedStorage.SoulBreak.Shared.Types.PlayerTypes)

local CombatClient = {}

local player = Players.LocalPlayer
local combatState: PlayerTypes.CombatState = {
    isAttacking = false,
    isDodging = false,
    isBlocking = false,
    comboCount = 0,
    lastAttackTime = 0,
    iFrames = 0,
}

-- RemoteEvents
local combatEvents = ReplicatedStorage:WaitForChild("SoulBreak"):WaitForChild("CombatEvents")
local attackEvent = combatEvents:WaitForChild("Attack")
local damageEvent = combatEvents:WaitForChild("TakeDamage")
local healEvent = combatEvents:WaitForChild("Heal")

-- Initialiser
function CombatClient.init()
    -- Écouter les dégâts reçus
    damageEvent.OnClientEvent:Connect(function(damage: number, attacker: Player)
        CombatClient.onTakeDamage(damage, attacker)
    end)

    -- Écouter les soins
    healEvent.OnClientEvent:Connect(function(amount: number)
        CombatClient.onHeal(amount)
    end)

    -- Configurer les entrées
    InputManager.onKeyPressed = function(keyCode: Enum.KeyCode)
        if keyCode == Enum.KeyCode.LeftShift then
            -- Esquive
            local MovementSystem = require(script.Parent.Parent.Systems.MovementSystem)
            MovementSystem.dodge()
            combatState.isDodging = true
            combatState.iFrames = GameConfig.Player.dodgeDuration
        elseif keyCode == Enum.KeyCode.F then
            -- Blocage
            combatState.isBlocking = true
        end
    end

    InputManager.onKeyReleased = function(keyCode: Enum.KeyCode)
        if keyCode == Enum.KeyCode.F then
            combatState.isBlocking = false
        end
    end

    InputManager.onMousePressed = function(position: Vector2)
        if not combatState.isAttacking then
            CombatClient.performAttack()
        end
    end
end

-- Effectuer une attaque
function CombatClient.performAttack()
    local currentTime = tick()

    -- Vérifier le cooldown
    if currentTime - combatState.lastAttackTime < GameConfig.Player.attackCooldown then
        return
    end

    combatState.isAttacking = true
    combatState.lastAttackTime = currentTime

    -- Vérifier le combo
    if currentTime - combatState.lastAttackTime < GameConfig.Player.comboWindow then
        combatState.comboCount = math.min(combatState.comboCount + 1, GameConfig.Combat.maxCombo)
    else
        combatState.comboCount = 1
    end

    -- Trouver la cible (raycast)
    local character = player.Character
    if not character then return end

    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end

    local camera = workspace.CurrentCamera
    local mousePosition = UserInputService:GetMouseLocation()
    local ray = camera:ViewportPointToRay(mousePosition.X, mousePosition.Y)

    local raycastParams = RaycastParams.new()
    raycastParams.FilterDescendantsInstances = {character}
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude

    local result = workspace:Raycast(ray.Origin, ray.Direction * 20, raycastParams)

    if result and result.Instance then
        local targetModel = result.Instance:FindFirstAncestorOfClass("Model")

        if targetModel then
            -- Envoyer l'attaque au serveur
            local damage = 10 -- Dégâts de base
            damage *= (1 + (combatState.comboCount - 1) * GameConfig.Combat.comboMultiplier)

            attackEvent:FireServer(targetModel, "LightAttack")
        end
    end

    -- Animation d'attaque
    -- TODO: Jouer l'animation d'attaque

    task.wait(0.3) -- Durée de l'attaque
    combatState.isAttacking = false
end

-- Quand on reçoit des dégâts
function CombatClient.onTakeDamage(damage: number, attacker: Player)
    -- Vérifier les i-frames
    if combatState.iFrames > 0 then
        return
    end

    -- Vérifier le blocage
    if combatState.isBlocking then
        damage = damage * 0.5 -- Réduire les dégâts de 50%
    end

    -- Effet visuel de dégâts
    -- TODO: Ajouter effet visuel
end

-- Quand on est soigné
function CombatClient.onHeal(amount: number)
    -- Effet visuel de soin
    -- TODO: Ajouter effet visuel
end

-- Mise à jour des i-frames
game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
    if combatState.iFrames > 0 then
        combatState.iFrames -= deltaTime
        if combatState.iFrames < 0 then
            combatState.iFrames = 0
            combatState.isDodging = false
        end
    end
end)

return CombatClient
