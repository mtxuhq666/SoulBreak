--!strict
-- Script principal serveur

local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Créer le dossier SoulBreak dans ReplicatedStorage
local soulBreakFolder = Instance.new("Folder")
soulBreakFolder.Name = "SoulBreak"
soulBreakFolder.Parent = ReplicatedStorage

-- Créer les sous-dossiers
local sharedFolder = Instance.new("Folder")
sharedFolder.Name = "Shared"
sharedFolder.Parent = soulBreakFolder

local configFolder = Instance.new("Folder")
configFolder.Name = "Config"
configFolder.Parent = sharedFolder

local dataFolder = Instance.new("Folder")
dataFolder.Name = "Data"
dataFolder.Parent = sharedFolder

local typesFolder = Instance.new("Folder")
typesFolder.Name = "Types"
typesFolder.Parent = sharedFolder

-- Charger les systèmes
local PlayerDataManager = require(script.Parent.Core.PlayerDataManager)
local CombatSystem = require(script.Parent.Systems.CombatSystem)
local SoulSpinSystem = require(script.Parent.Systems.SoulSpinSystem)
local MobSystem = require(script.Parent.Systems.MobSystem)

print("[SoulBreak] Server systems initialized")
