--!strict
-- Gestion des entrées utilisateur (client)

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local InputManager = {}

-- État des entrées
InputManager.keysDown = {}
InputManager.mousePosition = Vector2.new()
InputManager.isMouseDown = false

-- Callbacks
InputManager.onKeyPressed = nil
InputManager.onKeyReleased = nil
InputManager.onMousePressed = nil
InputManager.onMouseReleased = nil

-- Initialiser
function InputManager.init()
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end

        if input.UserInputType == Enum.UserInputType.Keyboard then
            InputManager.keysDown[input.KeyCode] = true
            if InputManager.onKeyPressed then
                InputManager.onKeyPressed(input.KeyCode)
            end
        elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
            InputManager.isMouseDown = true
            if InputManager.onMousePressed then
                InputManager.onMousePressed(input.Position)
            end
        end
    end)

    UserInputService.InputEnded:Connect(function(input, gameProcessed)
        if gameProcessed then return end

        if input.UserInputType == Enum.UserInputType.Keyboard then
            InputManager.keysDown[input.KeyCode] = false
            if InputManager.onKeyReleased then
                InputManager.onKeyReleased(input.KeyCode)
            end
        elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
            InputManager.isMouseDown = false
            if InputManager.onMouseReleased then
                InputManager.onMouseReleased(input.Position)
            end
        end
    end)

    UserInputService.MouseMoved:Connect(function(position)
        InputManager.mousePosition = position
    end)
end

-- Vérifier si une touche est enfoncée
function InputManager.isKeyDown(keyCode: Enum.KeyCode): boolean
    return InputManager.keysDown[keyCode] or false
end

-- Obtenir la direction du mouvement (WASD)
function InputManager.getMovementDirection(): Vector3
    local direction = Vector3.new()

    if InputManager.isKeyDown(Enum.KeyCode.W) then
        direction += Vector3.new(0, 0, -1)
    end
    if InputManager.isKeyDown(Enum.KeyCode.S) then
        direction += Vector3.new(0, 0, 1)
    end
    if InputManager.isKeyDown(Enum.KeyCode.A) then
        direction += Vector3.new(-1, 0, 0)
    end
    if InputManager.isKeyDown(Enum.KeyCode.D) then
        direction += Vector3.new(1, 0, 0)
    end

    return direction
end

return InputManager
