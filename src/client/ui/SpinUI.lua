--!strict
-- UI de Spin/Gacha pour obtenir des âmes

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

local SpinUI = {}

local screenGui = nil
local spinButton = nil
local spinResult = nil
local soulDisplay = nil
local rarityDisplay = nil
local soulShardsDisplay = nil

-- Couleurs par rareté
local RarityColors = {
    Common = Color3.fromRGB(128, 128, 128),
    Rare = Color3.fromRGB(0, 128, 255),
    Epic = Color3.fromRGB(163, 53, 238),
    Legendary = Color3.fromRGB(255, 215, 0),
    Mythic = Color3.fromRGB(255, 0, 0),
}

-- Créer l'UI
function SpinUI.init()
    screenGui = Instance.new("ScreenGui")
    screenGui.Name = "SpinUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = player.PlayerGui

    -- Fond
    local background = Instance.new("Frame")
    background.Name = "Background"
    background.Size = UDim2.new(0, 400, 0, 500)
    background.Position = UDim2.new(0.5, -200, 0.5, -250)
    background.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    background.Parent = screenGui

    -- Titre
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, 0, 0, 50)
    title.Position = UDim2.new(0, 0, 0, 20)
    title.BackgroundTransparency = 1
    title.Text = "SPIN ÂME"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextScaled = true
    title.Font = Enum.Font.GothamBold
    title.Parent = background

    -- Affichage des Soul Shards
    soulShardsDisplay = Instance.new("TextLabel")
    soulShardsDisplay.Name = "SoulShards"
    soulShardsDisplay.Size = UDim2.new(0, 200, 0, 30)
    soulShardsDisplay.Position = UDim2.new(0.5, -100, 0, 80)
    soulShardsDisplay.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    soulShardsDisplay.TextColor3 = Color3.fromRGB(255, 255, 255)
    soulShardsDisplay.Text = "Soul Shards: 0"
    soulShardsDisplay.TextScaled = true
    soulShardsDisplay.Font = Enum.Font.Gotham
    soulShardsDisplay.Parent = background

    -- Affichage du résultat
    soulDisplay = Instance.new("TextLabel")
    soulDisplay.Name = "SoulDisplay"
    soulDisplay.Size = UDim2.new(0, 300, 0, 100)
    soulDisplay.Position = UDim2.new(0.5, -150, 0, 130)
    soulDisplay.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    soulDisplay.TextColor3 = Color3.fromRGB(255, 255, 255)
    soulDisplay.Text = "??"
    soulDisplay.TextScaled = true
    soulDisplay.Font = Enum.Font.GothamBold
    soulDisplay.Parent = background

    rarityDisplay = Instance.new("TextLabel")
    rarityDisplay.Name = "RarityDisplay"
    rarityDisplay.Size = UDim2.new(0, 200, 0, 40)
    rarityDisplay.Position = UDim2.new(0.5, -100, 0, 240)
    rarityDisplay.BackgroundTransparency = 1
    rarityDisplay.TextColor3 = Color3.fromRGB(255, 255, 255)
    rarityDisplay.Text = ""
    rarityDisplay.TextScaled = true
    rarityDisplay.Font = Enum.Font.GothamBold
    rarityDisplay.Parent = background

    spinResult = Instance.new("TextLabel")
    spinResult.Name = "SpinResult"
    spinResult.Size = UDim2.new(0, 200, 0, 30)
    spinResult.Position = UDim2.new(0.5, -100, 0, 290)
    spinResult.BackgroundTransparency = 1
    spinResult.TextColor3 = Color3.fromRGB(255, 255, 255)
    spinResult.Text = ""
    spinResult.TextScaled = true
    spinResult.Font = Enum.Font.Gotham
    spinResult.Parent = background

    -- Bouton Spin
    spinButton = Instance.new("TextButton")
    spinButton.Name = "SpinButton"
    spinButton.Size = UDim2.new(0, 150, 0, 50)
    spinButton.Position = UDim2.new(0.5, -75, 0, 350)
    spinButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
    spinButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    spinButton.Text = "SPIN (100)"
    spinButton.TextScaled = true
    spinButton.Font = Enum.Font.GothamBold
    spinButton.Parent = background

    spinButton.MouseButton1Click:Connect(function()
        SpinUI.performSpin()
    end)

    -- Mettre à jour les Soul Shards
    SpinUI.updateSoulShards()
end

-- Effectuer un spin
function SpinUI.performSpin()
    local spinEvents = ReplicatedStorage:WaitForChild("SoulBreak"):WaitForChild("SpinEvents")
    local spinEvent = spinEvents:WaitForChild("SpinSoul")

    spinButton.Text = "SPINNING..."
    spinButton.Active = false

    -- Animation de spin
    local spinAnimation = TweenService:Create(soulDisplay, TweenInfo.new(2, Enum.EasingStyle.Linear), {
        TextColor3 = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
    })
    spinAnimation:Play()

    spinEvent:FireServer()

    spinEvent.OnClientEvent:Connect(function(soulId: string?, status: string?)
        spinAnimation:Cancel()

        if soulId then
            local SoulData = require(ReplicatedStorage.SoulBreak.Shared.Data.SoulData)
            local soul = SoulData[soulId]

            if soul then
                soulDisplay.Text = soul.name
                soulDisplay.BackgroundColor3 = RarityColors[soul.rarity] or Color3.fromRGB(128, 128, 128)
                rarityDisplay.Text = soul.rarity
                rarityDisplay.TextColor3 = RarityColors[soul.rarity] or Color3.fromRGB(128, 128, 128)

                if status == "NEW" then
                    spinResult.Text = "NOUVELLE ÂME !"
                    spinResult.TextColor3 = Color3.fromRGB(0, 255, 0)
                else
                    spinResult.Text = "DUPLICATE (Compensation)"
                    spinResult.TextColor3 = Color3.fromRGB(255, 255, 0)
                end
            end
        else
            soulDisplay.Text = "ERREUR"
            spinResult.Text = status or "Erreur inconnue"
            spinResult.TextColor3 = Color3.fromRGB(255, 0, 0)
        end

        spinButton.Text = "SPIN (100)"
        spinButton.Active = true

        SpinUI.updateSoulShards()
    end)
end

-- Mettre à jour l'affichage des Soul Shards
function SpinUI.updateSoulShards()
    -- TODO: Récupérer les données du joueur depuis le serveur
    -- Pour l'instant, afficher une valeur par défaut
    soulShardsDisplay.Text = "Soul Shards: 0"
end

return SpinUI
