--!strict
-- IA de base pour les boss

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local GameConfig = require(ReplicatedStorage.SoulBreak.Shared.Config.GameConfig)

local BossAI = {}

-- État du boss
type BossState = {
    currentPhase: number,
    health: number,
    maxHealth: number,
    isEnraged: boolean,
    lastAttackTime: number,
    attackCooldown: number,
}

-- Comportements du boss
local function doMeleeAttack(boss: Model, target: Model)
    local bossHRP = boss:FindFirstChild("HumanoidRootPart")
    local targetHRP = target:FindFirstChild("HumanoidRootPart")

    if not bossHRP or not targetHRP then return end

    local distance = (bossHRP.Position - targetHRP.Position).Magnitude

    if distance < 10 then
        -- Attaque en mêlée
        local targetHumanoid = target:FindFirstChildOfClass("Humanoid")
        if targetHumanoid then
            targetHumanoid:TakeDamage(20)
        end
    end
end

local function doAOEAttack(boss: Model)
    local bossHRP = boss:FindFirstChild("HumanoidRootPart")
    if not bossHRP then return end

    -- Attaque AOE autour du boss
    for _, character in pairs(workspace:GetDescendants()) do
        if character:IsA("Model") and character:FindFirstChild("Humanoid") then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            local hrp = character:FindFirstChild("HumanoidRootPart")

            if hrp and humanoid.Health > 0 then
                local distance = (bossHRP.Position - hrp.Position).Magnitude
                if distance < 15 then
                    humanoid:TakeDamage(30)
                end
            end
        end
    end
end

-- Initialiser l'IA d'un boss
function BossAI.init(boss: Model, behaviors: {[string]: any})
    local state: BossState = {
        currentPhase = 1,
        health = 100,
        maxHealth = 100,
        isEnraged = false,
        lastAttackTime = 0,
        attackCooldown = 2,
    }

    local humanoid = boss:FindFirstChildOfClass("Humanoid")
    if humanoid then
        state.maxHealth = humanoid.MaxHealth
        state.health = humanoid.Health
    end

    -- Mettre à jour l'état
    humanoid.HealthChanged:Connect(function(newHealth)
        state.health = newHealth

        -- Vérifier les transitions de phase
        local healthPercent = newHealth / state.maxHealth

        for i, threshold in ipairs(GameConfig.Boss.phaseTransitionHealthPercent) do
            if healthPercent <= threshold and state.currentPhase < i + 1 then
                state.currentPhase = i + 1
                state.attackCooldown = math.max(0.5, state.attackCooldown - 0.5) -- Plus rapide

                -- Effet visuel de transition
                -- TODO: Ajouter effet visuel
            end
        end

        -- Vérifier l'enrage
        if healthPercent <= GameConfig.Boss.enrageThreshold and not state.isEnraged then
            state.isEnraged = true
            state.attackCooldown = 0.5 -- Très rapide

            -- Effet visuel d'enrage
            -- TODO: Ajouter effet visuel
        end
    end)

    -- Boucle d'IA
    RunService.Heartbeat:Connect(function(deltaTime)
        if not boss or not boss.Parent then return end

        local currentTime = tick()

        -- Vérifier le cooldown
        if currentTime - state.lastAttackTime < state.attackCooldown then
            return
        end

        -- Trouver la cible la plus proche
        local closestTarget = nil
        local closestDistance = math.huge

        local bossHRP = boss:FindFirstChild("HumanoidRootPart")
        if not bossHRP then return end

        for _, character in pairs(workspace:GetDescendants()) do
            if character:IsA("Model") and character:FindFirstChild("Humanoid") then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                local hrp = character:FindFirstChild("HumanoidRootPart")

                if hrp and humanoid.Health > 0 and character ~= boss then
                    local distance = (bossHRP.Position - hrp.Position).Magnitude
                    if distance < 50 and distance < closestDistance then
                        closestDistance = distance
                        closestTarget = character
                    end
                end
            end
        end

        if closestTarget then
            -- Choisir une attaque aléatoire selon la phase
            local attackChoice = math.random()

            if state.currentPhase == 1 then
                -- Phase 1 : Attaques simples
                if attackChoice < 0.7 then
                    doMeleeAttack(boss, closestTarget)
                else
                    doAOEAttack(boss)
                end
            elseif state.currentPhase == 2 then
                -- Phase 2 : Plus d'AOE
                if attackChoice < 0.5 then
                    doMeleeAttack(boss, closestTarget)
                else
                    doAOEAttack(boss)
                end
            else
                -- Phase 3+ : Attaques agressives
                if attackChoice < 0.3 then
                    doMeleeAttack(boss, closestTarget)
                else
                    doAOEAttack(boss)
                end
            end

            state.lastAttackTime = currentTime
        end
    end)
end

return BossAI
