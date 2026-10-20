--!strict
-- Script principal client

local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Attendre que les modules partagés soient chargés
local SoulBreakFolder = ReplicatedStorage:WaitForChild("SoulBreak")

-- Charger les systèmes
local InputManager = require(script.Parent.Core.InputManager)
local MovementSystem = require(script.Parent.Systems.MovementSystem)
local CombatClient = require(script.Parent.Systems.CombatClient)
local HUD = require(script.Parent.UI.HUD)
local SpinUI = require(script.Parent.UI.SpinUI)

-- Initialiser les systèmes
InputManager.init()
MovementSystem.init()
CombatClient.init()
HUD.init()
SpinUI.init()

print("[SoulBreak] Client systems initialized")
