--[[
╔══════════════════════════════════════════════════════════════════════════════╗
║                    BALL HITBOX EXPANDER - WORKING CODE                      ║
║                                                                              ║
║  Funkcjonuje z każdą piłką - BEZ zmiany SIZE!                              ║
║                                                                              ║
╚══════════════════════════════════════════════════════════════════════════════╝
]]

-- ============================================================================
-- CONFIG
-- ============================================================================

local HITBOX_CONFIG = {
    EXPANDER_METHOD = 1,  -- 1 = Helper Part, 2 = Magnitude, 3 = Multiple
    HITBOX_SIZE = 5,      -- Size of helper part
    MAGNITUDE_THRESHOLD = 10,  -- Zamiast 5
    ENABLED = true,
    DEBUG_VISIBLE = false,  -- Pokaż helper (Transparency=0 zamiast 1)
}

-- ============================================================================
-- METODA #1: INVISIBLE HELPER PART (NAJLEPSZA)
-- ============================================================================

local function Method1_HelperPart()
    --[[
    Dodaj niewidoczny Part wokół piłki
    Piłka wizualnie taka sama, hitbox 2x większy
    ]]
    
    local workspace = game:GetService("Workspace")
    local ball = nil
    
    -- Szukaj piłki
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Model") then
            if obj.Name:lower():find("ball") or obj.Name:lower():find("client_ball") then
                if obj:FindFirstChild("BoundingBox") or obj:FindFirstChild("Sphere") then
                    ball = obj
                    break
                end
            end
        end
    end
    
    if not ball then
        print("[HITBOX] Piłka nie znaleziona")
        return false
    end
    
    local primary_part = ball:IsA("Model") and ball.PrimaryPart or ball
    
    if not primary_part then
        print("[HITBOX] PrimaryPart nie znaleziony")
        return false
    end
    
    -- Sprawdzić czy już ma expander
    if ball:FindFirstChild("HitboxExpander") then
        print("[HITBOX] Expander już istnieje")
        return true
    end
    
    -- Stwórz helper part
    local expander = Instance.new("Part")
    expander.Name = "HitboxExpander"
    expander.Shape = Enum.PartType.Ball
    expander.Size = Vector3.new(HITBOX_CONFIG.HITBOX_SIZE, HITBOX_CONFIG.HITBOX_SIZE, HITBOX_CONFIG.HITBOX_SIZE)
    expander.CanCollide = false  -- KLUCZOWE
    expander.Transparency = HITBOX_CONFIG.DEBUG_VISIBLE and 0.3 or 1  -- Niewidoczny
    expander.Color = Color3.fromRGB(0, 255, 0)  -- Zielony dla debug
    expander.Parent = ball
    
    -- Weld do piłki aby się poruszała z nią
    local weld = Instance.new("WeldConstraint")
    weld.Part0 = primary_part
    weld.Part1 = expander
    weld.Parent = expander
    
    print("[HITBOX] ✅ Expander Part dodany do piłki!")
    print("[HITBOX] Size: " .. HITBOX_CONFIG.HITBOX_SIZE .. "x" .. HITBOX_CONFIG.HITBOX_SIZE .. "x" .. HITBOX_CONFIG.HITBOX_SIZE)
    
    return true
end

-- ============================================================================
-- METODA #2: MAGNITUDE THRESHOLD (NAJPROSTSZA)
-- ============================================================================

local function Method2_MagnitudeThreshold()
    --[[
    Zmień MAGNITUDE > 5 na MAGNITUDE > 10
    W Ball.module.lua linia 53
    
    Wymaga modyfikacji skompilowanego pliku lub hooking
    ]]
    
    print("[HITBOX] ⚠️ Metoda #2 wymaga modyfikacji Ball.module.lua")
    print("[HITBOX] Zmień: if magnitude > 5 then")
    print("[HITBOX] Na:    if magnitude > 10 then")
    
    -- Jeśli jest dostęp do Ball.module.lua:
    local RS = game:GetService("ReplicatedStorage")
    local ball_module = RS:FindFirstChild("BallController"):FindFirstChild("Ball")
    
    if ball_module then
        -- Kod byłby tutaj (zależy od dostępu)
        print("[HITBOX] Ball.module znaleziony")
    end
    
    return false  -- Wymaga manual edit
end

-- ============================================================================
-- METODA #3: MULTIPLE HELPER PARTS (PROFESJONALNA)
-- ============================================================================

local function Method3_MultipleHelpers()
    --[[
    Dodaj 6 helper parts wokół piłki (sześciokierunkowy hitbox)
    ]]
    
    local workspace = game:GetService("Workspace")
    local ball = nil
    
    -- Szukaj piłki
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Model") then
            if obj.Name:lower():find("ball") or obj.Name:lower():find("client_ball") then
                if obj:FindFirstChild("BoundingBox") or obj:FindFirstChild("Sphere") then
                    ball = obj
                    break
                end
            end
        end
    end
    
    if not ball then return false end
    
    local primary_part = ball:IsA("Model") and ball.PrimaryPart or ball
    if not primary_part then return false end
    
    -- Czy już ma ekspandery
    if ball:FindFirstChild("MultiExpander_1") then
        print("[HITBOX] Multi-expanders już istnieją")
        return true
    end
    
    -- 6 kierunków (sześciokierunkowy hitbox)
    local offsets = {
        Vector3.new(3, 0, 0),    -- Right
        Vector3.new(-3, 0, 0),   -- Left
        Vector3.new(0, 3, 0),    -- Up
        Vector3.new(0, -3, 0),   -- Down
        Vector3.new(0, 0, 3),    -- Forward
        Vector3.new(0, 0, -3),   -- Back
    }
    
    for i, offset in ipairs(offsets) do
        local helper = Instance.new("Part")
        helper.Name = "MultiExpander_" .. i
        helper.Shape = Enum.PartType.Ball
        helper.Size = Vector3.new(2.5, 2.5, 2.5)
        helper.CanCollide = false
        helper.Transparency = HITBOX_CONFIG.DEBUG_VISIBLE and 0.3 or 1
        helper.Color = Color3.fromRGB(255, 100, 0)
        helper.CFrame = primary_part.CFrame + offset
        helper.Parent = ball
        
        -- Weld
        local weld = Instance.new("WeldConstraint")
        weld.Part0 = primary_part
        weld.Part1 = helper
        weld.Parent = helper
    end
    
    print("[HITBOX] ✅ 6-directional expanders dodane!")
    
    return true
end

-- ============================================================================
-- VISUALIZATION (DEBUG)
-- ============================================================================

local function ToggleDebugVisualization()
    HITBOX_CONFIG.DEBUG_VISIBLE = not HITBOX_CONFIG.DEBUG_VISIBLE
    
    local workspace = game:GetService("Workspace")
    
    -- Znajdź wszystkie expandery
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name:find("Expander") or obj.Name:find("MultiExpander") then
            obj.Transparency = HITBOX_CONFIG.DEBUG_VISIBLE and 0.3 or 1
        end
    end
    
    print("[HITBOX] Debug visualization: " .. (HITBOX_CONFIG.DEBUG_VISIBLE and "ON" or "OFF"))
end

-- ============================================================================
-- MAIN FUNCTIONS
-- ============================================================================

local function EnableHitboxExpander()
    if not HITBOX_CONFIG.ENABLED then
        print("[HITBOX] Hitbox expander jest wyłączony")
        return
    end
    
    print("[HITBOX] Włączam Hitbox Expander...")
    
    local success = false
    
    if HITBOX_CONFIG.EXPANDER_METHOD == 1 then
        success = Method1_HelperPart()
    elseif HITBOX_CONFIG.EXPANDER_METHOD == 2 then
        success = Method2_MagnitudeThreshold()
    elseif HITBOX_CONFIG.EXPANDER_METHOD == 3 then
        success = Method3_MultipleHelpers()
    end
    
    if success then
        print("[HITBOX] ✅ GOTOWE! Hitbox piłki powiększony!")
        print("[HITBOX] Piłka wizualnie TAKA SAMA - tylko hitbox większy!")
    else
        print("[HITBOX] ❌ Nie udało się")
    end
end

local function DisableHitboxExpander()
    print("[HITBOX] Wyłączam Hitbox Expander...")
    
    local workspace = game:GetService("Workspace")
    
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name:find("Expander") or obj.Name:find("MultiExpander") then
            obj:Destroy()
        end
    end
    
    print("[HITBOX] ✅ Expanders usunięte")
end

-- ============================================================================
-- INPUT HANDLING
-- ============================================================================

local function OnKeyPress(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.F8 then
        EnableHitboxExpander()
    elseif input.KeyCode == Enum.KeyCode.F9 then
        DisableHitboxExpander()
    elseif input.KeyCode == Enum.KeyCode.F10 then
        ToggleDebugVisualization()
    end
end

local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(OnKeyPress)

-- ============================================================================
-- AUTO-ENABLE ON BALL SPAWN
-- ============================================================================

local RunService = game:GetService("RunService")
local last_ball = nil

RunService.Heartbeat:Connect(function()
    if not HITBOX_CONFIG.ENABLED then return end
    
    local workspace = game:GetService("Workspace")
    local current_ball = nil
    
    -- Szukaj piłki
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Model") then
            if obj.Name:lower():find("ball") or obj.Name:lower():find("client_ball") then
                if obj:FindFirstChild("BoundingBox") or obj:FindFirstChild("Sphere") then
                    current_ball = obj
                    break
                end
            end
        end
    end
    
    -- Nowa piłka spawniła
    if current_ball and current_ball ~= last_ball then
        last_ball = current_ball
        wait(0.5)  -- Czekaj aż piłka się załaduje
        
        if HITBOX_CONFIG.EXPANDER_METHOD == 1 then
            Method1_HelperPart()
        elseif HITBOX_CONFIG.EXPANDER_METHOD == 3 then
            Method3_MultipleHelpers()
        end
    end
    
    -- Piłka zniknęła
    if not current_ball and last_ball then
        last_ball = nil
    end
end)

-- ============================================================================
-- STARTUP
-- ============================================================================

print("╔════════════════════════════════════════════════════════════════╗")
print("║           BALL HITBOX EXPANDER - BEZ ZMIANY SIZE              ║")
print("║                                                                ║")
print("║  Metody:                                                       ║")
print("║  1. Invisible Helper Part (RECOMMENDED)                        ║")
print("║  2. Magnitude Threshold (Requires manual edit)                 ║")
print("║  3. Multiple Helper Parts (Professional)                       ║")
print("║                                                                ║")
print("║  Keybinds:                                                     ║")
print("║  F8  - Enable Hitbox Expander                                  ║")
print("║  F9  - Disable Hitbox Expander                                 ║")
print("║  F10 - Toggle Debug Visualization                              ║")
print("║                                                                ║")
print("║  Current Method: #" .. HITBOX_CONFIG.EXPANDER_METHOD)
print("║  Auto-Enable: ON                                               ║")
print("║                                                                ║")
print("╚════════════════════════════════════════════════════════════════╝")

-- Auto-enable
wait(1)
if HITBOX_CONFIG.ENABLED then
    EnableHitboxExpander()
end
