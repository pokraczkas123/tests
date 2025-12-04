--[[
╔══════════════════════════════════════════════════════════════════════════════╗
║                     VOLTEXBALL - FULLY AUTOMATED SPIKE BOT                   ║
║                                                                              ║
║  Features:                                                                   ║
║  • Auto-detection of ball position                                           ║
║  • Automatic character rotation to ball                                      ║
║  • Optimal spike position calculation                                        ║
║  • ESP visualization (hitbox, spike zone, trajectory)                        ║
║  • Automatic jump & spike execution                                          ║
║  • Real-time adjustment                                                      ║
║                                                                              ║
╚══════════════════════════════════════════════════════════════════════════════╝
]]

-- ============================================================================
-- CONFIGURATION
-- ============================================================================

local CONFIG = {
    -- Spike settings
    SPIKE_POWER = 1.35,                    -- Mikage default
    SPIKE_REACH = 5.0,                    -- How far to reach for ball
    JUMP_HEIGHT = 50,                     -- Jump force
    OPTIMAL_SPIKE_HEIGHT = 10.0,           -- Optimal height to spike from
    SPIKE_ANGLE_OFFSET = 45,               -- Degrees forward from ball
    
    -- Timing
    SPIKE_DELAY = 0.1,                    -- Delay before spike
    ROTATION_SPEED = 0.15,                 -- Rotation smoothness (0-1)
    CHECK_INTERVAL = 0.016,                -- Check every frame (~60 FPS)
    
    -- ESP Settings
    ESP_ENABLED = true,
    SHOW_BALL_HITBOX = true,
    SHOW_SPIKE_ZONE = true,
    SHOW_TRAJECTORY = true,
    SHOW_DISTANCE = true,
    SHOW_ANGLE = true,
    
    -- Colors
    COLOR_BALL = Color3.fromRGB(0, 255, 0),       -- Green
    COLOR_SPIKE = Color3.fromRGB(255, 0, 0),      -- Red
    COLOR_TRAJECTORY = Color3.fromRGB(255, 255, 0), -- Yellow
    COLOR_INFO = Color3.fromRGB(100, 200, 255),   -- Light blue
    
    -- Keybinds
    TOGGLE_BOT = Enum.KeyCode.F6,
    TOGGLE_ESP = Enum.KeyCode.F7,
}

-- ============================================================================
-- CLASSES & STATE
-- ============================================================================

local BotState = {
    enabled = true,
    esp_enabled = CONFIG.ESP_ENABLED,
    target_ball = nil,
    local_player = game:GetService("Players").LocalPlayer,
    character = nil,
    humanoid_root = nil,
    drawing_objects = {},
    is_spiking = false,
    spike_cooldown = 0,
}

-- ============================================================================
-- UTILITY FUNCTIONS
-- ============================================================================

local function GetBall()
    local workspace = game:GetService("Workspace")
    
    -- Look for any instance with "Ball" tag or name
    local parts = workspace:GetDescendants()
    for _, part in ipairs(parts) do
        if part:IsA("BasePart") then
            local name = part.Name:lower()
            if name:find("ball") or name:find("client_ball") then
                if part.Parent and part.Parent:IsA("Model") then
                    return part.Parent  -- Return the model, not the part
                end
            end
        end
    end
    
    return nil
end

local function GetBallPosition()
    if not BotState.target_ball then
        BotState.target_ball = GetBall()
    end
    
    if BotState.target_ball then
        if BotState.target_ball:IsA("Model") then
            return BotState.target_ball:GetPrimaryPartCFrame().Position
        elseif BotState.target_ball:IsA("BasePart") then
            return BotState.target_ball.Position
        end
    end
    
    return nil
end

local function GetBallHitbox()
    if not BotState.target_ball then
        BotState.target_ball = GetBall()
    end
    
    if BotState.target_ball and BotState.target_ball:IsA("Model") then
        local boundingBox = BotState.target_ball:FindFirstChild("BoundingBox")
        if boundingBox then
            return boundingBox.Size.Magnitude / 2  -- Radius
        end
    end
    
    return 1.29  -- Default hitbox radius
end

local function ClampAngle(angle)
    while angle > 180 do angle = angle - 360 end
    while angle < -180 do angle = angle + 360 end
    return angle
end

local function GetYawPitch(from_pos, to_pos)
    local diff = (to_pos - from_pos)
    
    -- Calculate yaw (horizontal rotation)
    local yaw = math.atan2(diff.X, diff.Z)
    
    -- Calculate pitch (vertical rotation)
    local horizontal_dist = math.sqrt(diff.X^2 + diff.Z^2)
    local pitch = math.atan2(diff.Y, horizontal_dist)
    
    return math.deg(yaw), math.deg(pitch)
end

-- ============================================================================
-- SPIKE CALCULATION ENGINE
-- ============================================================================

local function CalculateOptimalSpikePosition(ball_pos)
    --[[
    Optimal spike position:
    - Above the ball (higher = more power)
    - Slightly in front of the ball (forward vector)
    - At an angle (left or right depending on approach)
    ]]
    
    if not ball_pos or not BotState.humanoid_root then
        return nil
    end
    
    local player_pos = BotState.humanoid_root.Position
    
    -- Direction from player to ball
    local direction = (ball_pos - player_pos).Unit
    
    -- Offset: above and in front of ball
    local offset = Vector3.new(
        direction.X * CONFIG.SPIKE_ANGLE_OFFSET,
        CONFIG.OPTIMAL_SPIKE_HEIGHT,
        direction.Z * CONFIG.SPIKE_ANGLE_OFFSET
    )
    
    local optimal_pos = ball_pos + offset
    
    return optimal_pos
end

local function CalculateSpikeTrajectory(from_pos, ball_pos)
    --[[
    Calculate the trajectory of the spike
    Returns: direction vector pointing where spike will go
    ]]
    
    if not from_pos or not ball_pos then
        return nil
    end
    
    -- Direction from spike origin to ball (and beyond)
    local direction = (ball_pos - from_pos).Unit
    
    -- Add downward angle for spike (aggressive downward spike)
    direction = direction + Vector3.new(0, -0.3, 0)
    
    return direction.Unit
end

local function CalculateDistanceToBall()
    if not BotState.humanoid_root then
        return math.huge
    end
    
    local ball_pos = GetBallPosition()
    if not ball_pos then
        return math.huge
    end
    
    return (ball_pos - BotState.humanoid_root.Position).Magnitude
end

local function CalculateAngleToBall()
    if not BotState.humanoid_root then
        return 0
    end
    
    local ball_pos = GetBallPosition()
    if not ball_pos then
        return 0
    end
    
    local yaw, _ = GetYawPitch(BotState.humanoid_root.Position, ball_pos)
    return yaw
end

-- ============================================================================
-- CHARACTER CONTROL
-- ============================================================================

local function RotateCharacterTowardsBall()
    --[[
    Smoothly rotate character to face the ball
    ]]
    
    if not BotState.enabled or not BotState.humanoid_root then
        return
    end
    
    local ball_pos = GetBallPosition()
    if not ball_pos then
        return
    end
    
    local target_yaw, target_pitch = GetYawPitch(
        BotState.humanoid_root.Position,
        ball_pos
    )
    
    local current_cframe = BotState.humanoid_root.CFrame
    local current_yaw, current_pitch = GetYawPitch(
        current_cframe.Position,
        current_cframe.Position + current_cframe.LookVector
    )
    
    -- Smooth rotation
    local new_yaw = current_yaw + ClampAngle(target_yaw - current_yaw) * CONFIG.ROTATION_SPEED
    local new_pitch = current_pitch + ClampAngle(target_pitch - current_pitch) * CONFIG.ROTATION_SPEED
    
    -- Apply rotation
    local new_cframe = CFrame.new(current_cframe.Position)
        * CFrame.Angles(math.rad(new_pitch), math.rad(new_yaw), 0)
    
    BotState.humanoid_root.CFrame = new_cframe
end

local function JumpTowardsBall()
    --[[
    Make the player jump toward the ball for optimal spike
    ]]
    
    if not BotState.humanoid_root or not BotState.humanoid then
        return
    end
    
    local ball_pos = GetBallPosition()
    if not ball_pos then
        return
    end
    
    -- Set humanoid jump
    BotState.humanoid.Jump = true
    
    -- Apply impulse toward ball
    local direction = (ball_pos - BotState.humanoid_root.Position).Unit
    BotState.humanoid_root.AssemblyLinearVelocity = direction * CONFIG.JUMP_HEIGHT
end

local function PerformSpike()
    --[[
    Execute the spike attack
    Uses: E key (JumpSet) or appropriate spike key
    ]]
    
    if BotState.is_spiking or BotState.spike_cooldown > 0 then
        return
    end
    
    BotState.is_spiking = true
    BotState.spike_cooldown = 1.0  -- 1 second cooldown
    
    -- Press spike key (E for JumpSet)
    keypress(0x45)  -- E key
    wait(0.05)
    keyrelease(0x45)
    
    wait(CONFIG.SPIKE_DELAY)
    BotState.is_spiking = false
end

-- ============================================================================
-- DISTANCE & ANGLE CHECKS
-- ============================================================================

local function IsInSpikeRange()
    --[[
    Check if ball is within spike range
    ]]
    
    local distance = CalculateDistanceToBall()
    return distance <= CONFIG.SPIKE_REACH
end

local function IsBallAboveGround()
    --[[
    Check if ball is at a good height for spiking
    ]]
    
    local ball_pos = GetBallPosition()
    if not ball_pos then
        return false
    end
    
    -- Ball should be at least 3 units above ground (floor height ~0)
    return ball_pos.Y > 3.0
end

local function IsAlignedWithBall()
    --[[
    Check if player is properly aligned for spike
    ]]
    
    local angle = math.abs(CalculateAngleToBall())
    return angle < 45  -- Within 45 degrees
end

-- ============================================================================
-- ESP / VISUALIZATION
-- ============================================================================

local function ClearESP()
    for _, obj in ipairs(BotState.drawing_objects) do
        if obj and obj.Remove then
            obj:Remove()
        end
    end
    BotState.drawing_objects = {}
end

local function DrawLine(from, to, color, thickness)
    if not from or not to then return end
    
    local from_screen, from_visible = WorldToScreen(from)
    local to_screen, to_visible = WorldToScreen(to)
    
    if not (from_visible and to_visible) then return end
    
    local line = Drawing.new("Line")
    line.From = from_screen
    line.To = to_screen
    line.Color = color
    line.Thickness = thickness or 2
    line.Transparency = 0.8
    
    table.insert(BotState.drawing_objects, line)
end

local function DrawCircle(position, radius, color)
    if not position then return end
    
    local screen_pos, is_visible = WorldToScreen(position)
    if not is_visible then return end
    
    local circle = Drawing.new("Circle")
    circle.Position = screen_pos
    circle.Radius = radius * 10  -- Scale for screen
    circle.Color = color
    circle.Thickness = 2
    circle.NumSides = 30
    circle.Transparency = 0.7
    circle.Filled = false
    
    table.insert(BotState.drawing_objects, circle)
end

local function DrawText(position, text, color)
    if not position then return end
    
    local screen_pos, is_visible = WorldToScreen(position)
    if not is_visible then return end
    
    local text_obj = Drawing.new("Text")
    text_obj.Text = text
    text_obj.Position = screen_pos
    text_obj.Color = color
    text_obj.Size = 14
    text_obj.Center = true
    text_obj.Outline = true
    text_obj.OutlineColor = Color3.new(0, 0, 0)
    
    table.insert(BotState.drawing_objects, text_obj)
end

local function UpdateESP()
    --[[
    Draw all ESP elements
    ]]
    
    if not BotState.esp_enabled then
        ClearESP()
        return
    end
    
    ClearESP()
    
    local ball_pos = GetBallPosition()
    if not ball_pos then return end
    
    -- Draw ball hitbox
    if CONFIG.SHOW_BALL_HITBOX then
        local hitbox_radius = GetBallHitbox()
        DrawCircle(ball_pos, hitbox_radius, CONFIG.COLOR_BALL)
    end
    
    -- Draw spike zone (optimal position)
    if CONFIG.SHOW_SPIKE_ZONE then
        local optimal_spike_pos = CalculateOptimalSpikePosition(ball_pos)
        if optimal_spike_pos then
            DrawCircle(optimal_spike_pos, 2.0, CONFIG.COLOR_SPIKE)
            
            -- Draw line from player to optimal position
            if BotState.humanoid_root then
                DrawLine(BotState.humanoid_root.Position, optimal_spike_pos, CONFIG.COLOR_SPIKE, 2)
            end
        end
    end
    
    -- Draw spike trajectory
    if CONFIG.SHOW_TRAJECTORY then
        if BotState.humanoid_root then
            local trajectory_dir = CalculateSpikeTrajectory(BotState.humanoid_root.Position, ball_pos)
            if trajectory_dir then
                local trajectory_end = ball_pos + trajectory_dir * 30
                DrawLine(ball_pos, trajectory_end, CONFIG.COLOR_TRAJECTORY, 1)
            end
        end
    end
    
    -- Draw distance info
    if CONFIG.SHOW_DISTANCE then
        local distance = CalculateDistanceToBall()
        DrawText(ball_pos + Vector3.new(0, 3, 0), string.format("Dist: %.1f", distance), CONFIG.COLOR_INFO)
    end
    
    -- Draw angle info
    if CONFIG.SHOW_ANGLE then
        local angle = CalculateAngleToBall()
        DrawText(ball_pos + Vector3.new(0, 4, 0), string.format("Angle: %.0f°", angle), CONFIG.COLOR_INFO)
    end
end

-- ============================================================================
-- MAIN BOT LOOP
-- ============================================================================

local function UpdateBot()
    --[[
    Main bot logic - executed every frame
    ]]
    
    if not BotState.enabled then
        ClearESP()
        return
    end
    
    -- Update character reference
    if not BotState.character or not BotState.character.Parent then
        BotState.character = BotState.local_player.Character
        BotState.humanoid_root = BotState.character and BotState.character:FindFirstChild("HumanoidRootPart")
        BotState.humanoid = BotState.character and BotState.character:FindFirstChild("Humanoid")
        return
    end
    
    -- Find ball
    BotState.target_ball = GetBall()
    
    if not BotState.target_ball then
        ClearESP()
        return
    end
    
    -- Update ESP
    UpdateESP()
    
    -- Main logic
    RotateCharacterTowardsBall()
    
    -- Check if conditions are met for spiking
    if IsInSpikeRange() and IsBallAboveGround() and IsAlignedWithBall() then
        JumpTowardsBall()
        PerformSpike()
    end
    
    -- Update cooldown
    if BotState.spike_cooldown > 0 then
        BotState.spike_cooldown = BotState.spike_cooldown - CONFIG.CHECK_INTERVAL
    end
end

-- ============================================================================
-- INPUT HANDLING
-- ============================================================================

local function OnInputBegan(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == CONFIG.TOGGLE_BOT then
        BotState.enabled = not BotState.enabled
        print("[SPIKE BOT] Bot " .. (BotState.enabled and "ENABLED" or "DISABLED"))
    end
    
    if input.KeyCode == CONFIG.TOGGLE_ESP then
        BotState.esp_enabled = not BotState.esp_enabled
        print("[SPIKE BOT] ESP " .. (BotState.esp_enabled and "ENABLED" or "DISABLED"))
        if not BotState.esp_enabled then
            ClearESP()
        end
    end
end

-- ============================================================================
-- INITIALIZATION
-- ============================================================================

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Connect input
UserInputService.InputBegan:Connect(OnInputBegan)

-- Main loop
RunService.RenderStepped:Connect(function()
    UpdateBot()
end)

-- Handle character respawn
BotState.local_player.CharacterAdded:Connect(function(character)
    BotState.character = character
    BotState.humanoid_root = character:WaitForChild("HumanoidRootPart")
    BotState.humanoid = character:WaitForChild("Humanoid")
    print("[SPIKE BOT] Character loaded")
end)

-- ============================================================================
-- STARTUP MESSAGE
-- ============================================================================

print("╔════════════════════════════════════════════════════════════════╗")
print("║          VOLTEXBALL - FULLY AUTOMATED SPIKE BOT               ║")
print("║                                                                ║")
print("║  Controls:                                                     ║")
print("║  • F6 - Toggle Bot (ON/OFF)                                    ║")
print("║  • F7 - Toggle ESP Visualization                              ║")
print("║                                                                ║")
print("║  Features:                                                     ║")
print("║  • Auto-rotation to ball                                       ║")
print("║  • Optimal spike position calculation                         ║")
print("║  • ESP with hitbox/trajectory visualization                   ║")
print("║  • Automatic jump & spike execution                           ║")
print("║                                                                ║")
print("╚════════════════════════════════════════════════════════════════╝")
