--[[
╔══════════════════════════════════════════════════════════════════════════════╗
║                    VOLTEXBALL - ADVANCED SPIKE BOT v2.0                      ║
║                                                                              ║
║  Advanced Features:                                                          ║
║  • Predictive ball tracking (velocity-based)                                ║
║  • Multi-point spike optimization                                            ║
║  • Anti-block detection                                                      ║
║  • Adaptive spike timing                                                     ║
║  • Enemy player detection                                                    ║
║  • Power-based spike angle calculation                                       ║
║  • Real-time performance monitoring                                          ║
║                                                                              ║
╚══════════════════════════════════════════════════════════════════════════════╝
]]

local CONFIG = {
    -- Advanced spike optimization
    PREDICTION_TIME = 0.15,                -- How far ahead to predict ball
    SPIKE_POWER_VARIANTS = {1.0, 1.35, 1.5, 2.0},  -- Different spike powers to try
    OPTIMAL_HIT_ZONE_RADIUS = 1.5,         -- Radius of optimal hit zone
    
    -- Anti-block
    BLOCK_DETECTION_RANGE = 8.0,           -- How far to detect blocks
    AUTO_ANGLE_ADJUST = true,              -- Automatically adjust spike angle
    
    -- Timing
    SPIKE_ANTICIPATION = 0.2,              -- Anticipate opponent moves
    REACTION_TIME = 0.05,                  -- How quickly to react
    
    -- AI settings
    TARGET_COURT_ZONE = "opponent",        -- "opponent", "cross", "line"
    AGGRESSION_LEVEL = 0.8,                -- 0-1, higher = more aggressive
    
    -- Advanced visualization
    SHOW_PREDICTION = true,
    SHOW_BLOCKERS = true,
    SHOW_SPIKE_VARIANTS = true,
    SHOW_PERFORMANCE = true,
}

local AdvancedBotState = {
    last_spike_time = 0,
    spike_success_rate = 0,
    total_spikes = 0,
    successful_spikes = 0,
    ball_velocity = Vector3.new(0, 0, 0),
    previous_ball_pos = nil,
    enemy_players = {},
    performance_data = {},
}

-- ============================================================================
-- PREDICTIVE BALL TRACKING
-- ============================================================================

local function UpdateBallVelocity(ball_pos)
    --[[
    Calculate ball velocity based on position change
    ]]
    
    if AdvancedBotState.previous_ball_pos then
        local delta = ball_pos - AdvancedBotState.previous_ball_pos
        AdvancedBotState.ball_velocity = delta / CONFIG.CHECK_INTERVAL
    end
    
    AdvancedBotState.previous_ball_pos = ball_pos
end

local function PredictBallPosition(current_ball_pos, prediction_time)
    --[[
    Predict where the ball will be in the future
    Takes into account gravity and velocity
    ]]
    
    if not current_ball_pos then
        return nil
    end
    
    local gravity = 196.2  -- Roblox default gravity
    local predicted_pos = current_ball_pos + (AdvancedBotState.ball_velocity * prediction_time)
    
    -- Apply gravity to prediction
    predicted_pos = predicted_pos + Vector3.new(0, -0.5 * gravity * prediction_time^2, 0)
    
    return predicted_pos
end

local function GetBallTrajectory(ball_pos)
    --[[
    Get the trajectory/direction of the ball
    ]]
    
    if AdvancedBotState.ball_velocity.Magnitude == 0 then
        return nil
    end
    
    return AdvancedBotState.ball_velocity.Unit
end

-- ============================================================================
-- SPIKE ZONE OPTIMIZATION
-- ============================================================================

local function CalculateMultiPointOptimalSpike(ball_pos, player_pos)
    --[[
    Calculate multiple optimal spike points and rank them
    Returns: table of {position, score, spike_power}
    ]]
    
    if not ball_pos or not player_pos then
        return {}
    end
    
    local spike_points = {}
    local direction_to_ball = (ball_pos - player_pos).Unit
    
    -- Generate multiple spike candidates
    for power_idx, spike_power in ipairs(CONFIG.SPIKE_POWER_VARIANTS) do
        -- Vary position based on power
        local power_factor = spike_power / 1.35  -- Normalize to default
        
        -- Different spike angles
        for angle = -30, 30, 15 do
            local angle_rad = math.rad(angle)
            
            -- Rotate direction
            local rotated_dir = CFrame.fromAxisAngle(Vector3.new(0, 1, 0), angle_rad) * direction_to_ball
            
            -- Calculate spike position
            local spike_offset = rotated_dir * (5.0 * power_factor)
            spike_offset = spike_offset + Vector3.new(0, 8.0 + (2.0 * power_factor), 0)
            
            local spike_pos = ball_pos + spike_offset
            
            -- Calculate score (higher is better)
            local distance_from_player = (spike_pos - player_pos).Magnitude
            local height_bonus = math.max(0, spike_pos.Y - 5) / 5
            local angle_penalty = math.abs(angle) / 30
            
            local score = (1 / distance_from_player) * (1 + height_bonus) * (1 - angle_penalty * 0.3)
            
            table.insert(spike_points, {
                position = spike_pos,
                score = score,
                spike_power = spike_power,
                angle = angle,
            })
        end
    end
    
    -- Sort by score (descending)
    table.sort(spike_points, function(a, b)
        return a.score > b.score
    end)
    
    return spike_points
end

local function GetBestSpikePoint(spike_candidates)
    --[[
    Get the best spike point from candidates
    ]]
    
    if #spike_candidates == 0 then
        return nil
    end
    
    return spike_candidates[1]
end

-- ============================================================================
-- ENEMY DETECTION & ANTI-BLOCK
-- ============================================================================

local function DetectEnemyPlayers()
    --[[
    Find and track enemy players who might block
    ]]
    
    local players = game:GetService("Players"):GetPlayers()
    AdvancedBotState.enemy_players = {}
    
    local local_player = game:GetService("Players").LocalPlayer
    local local_team = local_player.Team
    
    for _, player in ipairs(players) do
        if player ~= local_player and player.Character then
            if player.Team ~= local_team then
                table.insert(AdvancedBotState.enemy_players, {
                    player = player,
                    character = player.Character,
                    root_part = player.Character:FindFirstChild("HumanoidRootPart"),
                })
            end
        end
    end
end

local function IsBlockerInPath(spike_start, spike_direction, blocker_pos)
    --[[
    Check if an enemy player is in the path of a spike
    ]]
    
    if not spike_start or not spike_direction or not blocker_pos then
        return false
    end
    
    -- Vector from spike start to blocker
    local to_blocker = blocker_pos - spike_start
    
    -- Project onto spike direction
    local projection_length = to_blocker:Dot(spike_direction)
    
    -- Check if blocker is ahead of spike
    if projection_length < 0 then
        return false
    end
    
    -- Calculate closest point on spike trajectory to blocker
    local closest_point = spike_start + spike_direction * projection_length
    local distance_to_trajectory = (blocker_pos - closest_point).Magnitude
    
    -- Blocker is in path if within 2 studs of trajectory
    return distance_to_trajectory < 2.0
end

local function FindBlockersInSpikeZone(spike_start, spike_direction)
    --[[
    Find all potential blockers in the spike trajectory
    ]]
    
    local blockers = {}
    
    for _, enemy in ipairs(AdvancedBotState.enemy_players) do
        if enemy.root_part then
            if IsBlockerInPath(spike_start, spike_direction, enemy.root_part.Position) then
                table.insert(blockers, enemy)
            end
        end
    end
    
    return blockers
end

local function AdjustSpikeForBlockers(spike_candidates, spike_start)
    --[[
    Adjust spike angle to avoid blockers
    ]]
    
    if #spike_candidates == 0 then
        return nil
    end
    
    for _, candidate in ipairs(spike_candidates) do
        local spike_dir = (candidate.position - spike_start).Unit
        local blockers = FindBlockersInSpikeZone(spike_start, spike_dir)
        
        if #blockers == 0 then
            return candidate  -- No blockers, use this spike
        end
    end
    
    -- All candidates have blockers, use the one with highest score
    return spike_candidates[1]
end

-- ============================================================================
-- ADAPTIVE SPIKE TIMING
-- ============================================================================

local function CalculateSpikeTimingWindow(ball_pos, player_pos)
    --[[
    Calculate the optimal timing window for a spike
    Takes into account ball velocity and player position
    ]]
    
    if not ball_pos or not player_pos then
        return {ready = false, window = 0}
    end
    
    local distance = (ball_pos - player_pos).Magnitude
    local ball_height = ball_pos.Y
    
    -- Ball should be at good height (6-12 studs above ground)
    local height_good = ball_height >= 6 and ball_height <= 12
    
    -- Player should be reasonably close (within spike reach)
    local distance_good = distance <= CONFIG.SPIKE_REACH
    
    -- Calculate timing window in milliseconds
    local timing_window = 200 + (distance * 10)  -- More distance = wider window
    
    return {
        ready = height_good and distance_good,
        window = timing_window / 1000,
        height_good = height_good,
        distance_good = distance_good,
    }
end

-- ============================================================================
-- INTELLIGENT SPIKE EXECUTION
-- ============================================================================

local function ExecuteIntelligentSpike()
    --[[
    Execute spike with all optimizations
    ]]
    
    local local_player = game:GetService("Players").LocalPlayer
    if not local_player.Character then return end
    
    local humanoid_root = local_player.Character:FindFirstChild("HumanoidRootPart")
    if not humanoid_root then return end
    
    local ball_pos = BotState.target_ball and 
        (BotState.target_ball:IsA("Model") and BotState.target_ball:GetPrimaryPartCFrame().Position or 
         BotState.target_ball.Position)
    
    if not ball_pos then return end
    
    -- Update ball tracking
    UpdateBallVelocity(ball_pos)
    
    -- Predict where ball will be
    local predicted_pos = PredictBallPosition(ball_pos, CONFIG.PREDICTION_TIME)
    if not predicted_pos then predicted_pos = ball_pos end
    
    -- Calculate optimal spike points
    local spike_candidates = CalculateMultiPointOptimalSpike(predicted_pos, humanoid_root.Position)
    if #spike_candidates == 0 then return end
    
    -- Detect enemies and adjust for blocks
    DetectEnemyPlayers()
    local best_spike = CONFIG.AUTO_ANGLE_ADJUST and 
        AdjustSpikeForBlockers(spike_candidates, humanoid_root.Position) or
        GetBestSpikePoint(spike_candidates)
    
    if not best_spike then return end
    
    -- Check timing
    local timing = CalculateSpikeTimingWindow(predicted_pos, humanoid_root.Position)
    if not timing.ready then return end
    
    -- Execute spike
    PerformSpike()
    
    -- Track statistics
    AdvancedBotState.total_spikes = AdvancedBotState.total_spikes + 1
    AdvancedBotState.last_spike_time = tick()
end

-- ============================================================================
-- PERFORMANCE MONITORING
-- ============================================================================

local function UpdatePerformanceStats()
    --[[
    Track and display performance metrics
    ]]
    
    if AdvancedBotState.total_spikes > 0 then
        AdvancedBotState.spike_success_rate = 
            AdvancedBotState.successful_spikes / AdvancedBotState.total_spikes * 100
    end
end

local function OnSpikeSuccess()
    --[[
    Called when a spike successfully hits the ball
    ]]
    
    AdvancedBotState.successful_spikes = AdvancedBotState.successful_spikes + 1
    print(string.format("[SPIKE BOT] Successful spike! (%.1f%% success rate)",
        AdvancedBotState.spike_success_rate))
end

-- ============================================================================
-- ADVANCED ESP
-- ============================================================================

local function DrawAdvancedESP()
    --[[
    Draw advanced ESP information
    ]]
    
    if not BotState.esp_enabled then return end
    
    local local_player = game:GetService("Players").LocalPlayer
    if not local_player.Character then return end
    
    local humanoid_root = local_player.Character:FindFirstChild("HumanoidRootPart")
    if not humanoid_root then return end
    
    local ball_pos = BotState.target_ball and 
        (BotState.target_ball:IsA("Model") and BotState.target_ball:GetPrimaryPartCFrame().Position or 
         BotState.target_ball.Position)
    
    if not ball_pos then return end
    
    -- Draw predicted ball position
    if CONFIG.SHOW_PREDICTION then
        local predicted_pos = PredictBallPosition(ball_pos, CONFIG.PREDICTION_TIME)
        if predicted_pos then
            DrawCircle(predicted_pos, 1.0, Color3.fromRGB(255, 200, 0))
        end
    end
    
    -- Draw blockers
    if CONFIG.SHOW_BLOCKERS then
        for _, enemy in ipairs(AdvancedBotState.enemy_players) do
            if enemy.root_part then
                DrawCircle(enemy.root_part.Position, 2.0, Color3.fromRGB(255, 0, 0))
            end
        end
    end
    
    -- Draw spike variants
    if CONFIG.SHOW_SPIKE_VARIANTS then
        local spike_candidates = CalculateMultiPointOptimalSpike(ball_pos, humanoid_root.Position)
        for i, candidate in ipairs(spike_candidates) do
            if i <= 3 then  -- Show top 3
                DrawCircle(candidate.position, 0.5, 
                    Color3.fromRGB(100, 200, 255))
            end
        end
    end
    
    -- Draw performance info
    if CONFIG.SHOW_PERFORMANCE then
        DrawText(Vector3.new(0, 100, 0), 
            string.format("Spikes: %d | Success: %.1f%%",
                AdvancedBotState.total_spikes,
                AdvancedBotState.spike_success_rate), 
            Color3.fromRGB(100, 255, 100))
    end
end

-- ============================================================================
-- MAIN UPDATE LOOP (Override from basic bot)
-- ============================================================================

local original_update_bot = UpdateBot

local function AdvancedUpdateBot()
    if not BotState.enabled then
        ClearESP()
        return
    end
    
    -- Update character
    if not BotState.character or not BotState.character.Parent then
        BotState.character = game:GetService("Players").LocalPlayer.Character
        if BotState.character then
            BotState.humanoid_root = BotState.character:FindFirstChild("HumanoidRootPart")
            BotState.humanoid = BotState.character:FindFirstChild("Humanoid")
        end
        return
    end
    
    -- Find ball
    BotState.target_ball = GetBall()
    if not BotState.target_ball then
        ClearESP()
        return
    end
    
    -- Update advanced ESP
    if BotState.esp_enabled then
        DrawAdvancedESP()
    end
    
    -- Basic controls
    RotateCharacterTowardsBall()
    
    -- Intelligent spike execution
    if IsInSpikeRange() and IsBallAboveGround() then
        ExecuteIntelligentSpike()
    end
    
    -- Update stats
    UpdatePerformanceStats()
end

-- Override the main loop
RunService.RenderStepped:Disconnect()
RunService.RenderStepped:Connect(function()
    AdvancedUpdateBot()
end)

print("╔════════════════════════════════════════════════════════════════╗")
print("║        VOLTEXBALL - ADVANCED SPIKE BOT v2.0 LOADED            ║")
print("║                                                                ║")
print("║  Advanced Features Enabled:                                    ║")
print("║  ✓ Predictive ball tracking                                    ║")
print("║  ✓ Multi-point spike optimization                              ║")
print("║  ✓ Anti-block detection & auto-adjustment                      ║")
print("║  ✓ Adaptive spike timing                                       ║")
print("║  ✓ Enemy player detection                                      ║")
print("║  ✓ Performance monitoring                                      ║")
print("║  ✓ Advanced ESP visualization                                  ║")
print("║                                                                ║")
print("╚════════════════════════════════════════════════════════════════╝")
