--!strict
-- Système de mouvement du joueur (client)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local InputManager = require(script.Parent.Core.InputManager)
local GameConfig = require(ReplicatedStorage.SoulBreak.Shared.Config.GameConfig)

local MovementSystem = {}

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid") :: Humanoid
local rootPart = character:WaitForChild("HumanoidRootPart")

-- État du mouvement
local isDodging = false
local dodgeEndTime = 0

-- Configurer le mouvement
function MovementSystem.init()
    -- Désactiver le saut par défaut
    humanoid.JumpPower = 0

    -- Écouter le spawn du personnage
    player.CharacterAdded:Connect(function(newCharacter)
        character = newCharacter
        humanoid = character:WaitForChild("Humanoid") :: Humanoid
        rootPart = character:WaitForChild("HumanoidRootPart")
        humanoid.JumpPower = 0
    end)

    -- Boucle de mise à jour
    RunService.Heartbeat:Connect(function(deltaTime)
        MovementSystem.update(deltaTime)
    end)
end

-- Mettre à jour le mouvement
function MovementSystem.update(deltaTime: number)
    if not character or not humanoid or not rootPart then return end

    local movementDirection = InputManager.getMovementDirection()

    -- Normaliser la direction
    if movementDirection.Magnitude > 0 then
        movementDirection = movementDirection.Unit
    end

    -- Vérifier si on esquive
    if isDodging then
        if tick() > dodgeEndTime then
            isDodging = false
        else
            -- Pendant l'esquive, mouvement rapide en direction actuelle
            local camera = workspace.CurrentCamera
            local relativeDirection = camera.CFrame:VectorToWorldSpace(movementDirection)
            rootPart.Velocity = relativeDirection * (GameConfig.Player.baseSpeed * 2)
            return
        end
    end

    -- Mouvement normal
    local camera = workspace.CurrentCamera
    local relativeDirection = camera.CFrame:VectorToWorldSpace(movementDirection)

    if movementDirection.Magnitude > 0 then
        rootPart.Velocity = relativeDirection * GameConfig.Player.baseSpeed
    else
        rootPart.Velocity = Vector3.new()
    end
end

-- Esquive (dash)
function MovementSystem.dodge()
    if isDodging then return end

    local movementDirection = InputManager.getMovementDirection()
    if movementDirection.Magnitude == 0 then return end

    -- Vérifier la stamina (simulation pour l'instant)
    -- TODO: Intégrer avec le système de stamina

    isDodging = true
    dodgeEndTime = tick() + GameConfig.Player.dodgeDuration

    -- Effet visuel (i-frame)
    -- TODO: Ajouter effet visuel d'esquive
end

return MovementSystem
