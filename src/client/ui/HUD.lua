--!strict
-- HUD du jeu (barre de vie, stamina, etc.)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

local HUD = {}

local screenGui = nil
local healthBar = nil
local staminaBar = nil
local soulName = nil
local comboCounter = nil

-- Créer l'UI
function HUD.init()
    -- Créer le ScreenGui
    screenGui = Instance.new("ScreenGui")
    screenGui.Name = "SoulBreakHUD"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = player.PlayerGui

    -- Barre de vie
    local healthFrame = Instance.new("Frame")
    healthFrame.Name = "HealthFrame"
    healthFrame.Size = UDim2.new(0, 200, 0, 20)
    healthFrame.Position = UDim2.new(0, 20, 1, -40)
    healthFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    healthFrame.Parent = screenGui

    healthBar = Instance.new("Frame")
    healthBar.Name = "HealthBar"
    healthBar.Size = UDim2.new(1, 0, 1, 0)
    healthBar.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    healthBar.Parent = healthFrame

    local healthText = Instance.new("TextLabel")
    healthText.Name = "HealthText"
    healthText.Size = UDim2.new(1, 0, 1, 0)
    healthText.BackgroundTransparency = 1
    healthText.TextColor3 = Color3.fromRGB(255, 255, 255)
    healthText.TextScaled = true
    healthText.Font = Enum.Font.GothamBold
    healthText.Parent = healthFrame

    -- Barre de stamina
    local staminaFrame = Instance.new("Frame")
    staminaFrame.Name = "StaminaFrame"
    staminaFrame.Size = UDim2.new(0, 200, 0, 15)
    staminaFrame.Position = UDim2.new(0, 20, 1, -20)
    staminaFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    staminaFrame.Parent = screenGui

    staminaBar = Instance.new("Frame")
    staminaBar.Name = "StaminaBar"
    staminaBar.Size = UDim2.new(1, 0, 1, 0)
    staminaBar.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
    staminaBar.Parent = staminaFrame

    -- Nom de l'âme active
    soulName = Instance.new("TextLabel")
    soulName.Name = "SoulName"
    soulName.Size = UDim2.new(0, 200, 0, 30)
    soulName.Position = UDim2.new(1, -220, 1, -40)
    soulName.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    soulName.TextColor3 = Color3.fromRGB(255, 255, 255)
    soulName.Text = "Aucune Âme"
    soulName.TextScaled = true
    soulName.Font = Enum.Font.GothamBold
    soulName.Parent = screenGui

    -- Compteur de combo
    comboCounter = Instance.new("TextLabel")
    comboCounter.Name = "ComboCounter"
    comboCounter.Size = UDim2.new(0, 100, 0, 50)
    comboCounter.Position = UDim2.new(0.5, -50, 0.5, -100)
    comboCounter.BackgroundTransparency = 1
    comboCounter.TextColor3 = Color3.fromRGB(255, 255, 0)
    comboCounter.Text = ""
    comboCounter.TextScaled = true
    comboCounter.Font = Enum.Font.GothamBold
    comboCounter.Parent = screenGui

    -- Boucle de mise à jour
    RunService.Heartbeat:Connect(function()
        HUD.update()
    end)
end

-- Mettre à jour l'UI
function HUD.update()
    -- TODO: Récupérer les données du joueur depuis le serveur
    -- Pour l'instant, afficher des valeurs par défaut

    local healthPercent = 1 -- Placeholder
    local staminaPercent = 1 -- Placeholder

    if healthBar then
        healthBar.Size = UDim2.new(healthPercent, 0, 1, 0)
    end

    if staminaBar then
        staminaBar.Size = UDim2.new(staminaPercent, 0, 1, 0)
    end
end

-- Mettre à jour le compteur de combo
function HUD.updateCombo(count: number)
    if comboCounter then
        if count > 1 then
            comboCounter.Text = tostring(count) .. "x"
        else
            comboCounter.Text = ""
        end
    end
end

-- Mettre à jour le nom de l'âme
function HUD.updateSoulName(soulNameText: string)
    if soulName then
        soulName.Text = soulNameText
    end
end

return HUD
