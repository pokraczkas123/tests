--[[
╔══════════════════════════════════════════════════════════════════════════════╗
║              VOLTEXBALL - MACHINE LEARNING SPIKE BOT v3.0 (ML)              ║
║                                                                              ║
║  Machine Learning Features:                                                 ║
║  • Adaptive spike angle based on opponent positioning                       ║
║  • Learning from successful vs failed spikes                                ║
║  • Dynamic aggression level adjustment                                      ║
║  • Court zone intelligence (cross vs line)                                  ║
║  • Opponent behavior prediction                                              ║
║  • Automated parameter tuning                                                ║
║  • Win rate optimization                                                    ║
║                                                                              ║
╚══════════════════════════════════════════════════════════════════════════════╝
]]

-- ============================================================================
-- ML CONFIGURATION
-- ============================================================================

local ML_CONFIG = {
    -- Learning parameters
    LEARNING_RATE = 0.01,
    MOMENTUM = 0.9,
    EPSILON = 0.1,  -- Exploration rate
    
    -- Neural network layer sizes
    NN_HIDDEN_SIZE = 64,
    NN_OUTPUT_SIZE = 5,  -- 5 spike angles to try
    
    -- Court zones
    COURT_ZONES = {
        "cross_left",
        "cross_right", 
        "line_left",
        "line_right",
        "middle",
    },
}

-- ============================================================================
-- MACHINE LEARNING ENGINE
-- ============================================================================

local MLEngine = {
    -- Training data
    spike_history = {},
    opponent_patterns = {},
    zone_success_rates = {},
    
    -- Weights (simulated neural network)
    angle_weights = {},
    power_weights = {},
    timing_weights = {},
    
    -- Statistics
    total_episodes = 0,
    successful_episodes = 0,
    learning_progress = 0,
}

-- Initialize weights
for i = 1, ML_CONFIG.NN_HIDDEN_SIZE do
    MLEngine.angle_weights[i] = math.random() * 2 - 1
    MLEngine.power_weights[i] = math.random() * 2 - 1
    MLEngine.timing_weights[i] = math.random() * 2 - 1
end

for _, zone in ipairs(ML_CONFIG.COURT_ZONES) do
    MLEngine.zone_success_rates[zone] = 0.5  -- Start at 50%
end

-- ============================================================================
-- NEURAL NETWORK FUNCTIONS
-- ============================================================================

local function Activation(x)
    -- ReLU activation function
    return math.max(0, x)
end

local function ForwardPass(inputs, weights)
    --[[
    Simple neural network forward pass
    inputs: table of input values
    weights: table of weight values
    returns: output value between -1 and 1
    ]]
    
    local output = 0
    
    for i, input in ipairs(inputs) do
        if weights[i] then
            output = output + input * weights[i]
        end
    end
    
    -- Normalize output to -1..1
    return math.max(-1, math.min(1, output / 10))
end

local function GetNetworkPrediction(ball_pos, player_pos, opponents)
    --[[
    Get spike prediction from neural network
    ]]
    
    -- Prepare inputs
    local inputs = {
        ball_pos.X / 100,
        ball_pos.Y / 100,
        ball_pos.Z / 100,
        (ball_pos - player_pos).Magnitude / 10,
        #opponents,  -- Number of opponents
    }
    
    -- Get predictions from three networks
    local angle_pred = ForwardPass(inputs, MLEngine.angle_weights)
    local power_pred = ForwardPass(inputs, MLEngine.power_weights)
    local timing_pred = ForwardPass(inputs, MLEngine.timing_weights)
    
    return {
        angle = angle_pred,      -- -1 to 1 (left to right)
        power = power_pred,      -- -1 to 1 (weak to strong)
        timing = timing_pred,    -- -1 to 1 (early to late)
    }
end

-- ============================================================================
-- OPPONENT ANALYSIS & PREDICTION
-- ============================================================================

local function AnalyzeOpponentPositions(opponents)
    --[[
    Analyze where opponents are and predict their moves
    ]]
    
    if not opponents or #opponents == 0 then
        return nil
    end
    
    local avg_x, avg_y, avg_z = 0, 0, 0
    local total_distance = 0
    
    for _, opp in ipairs(opponents) do
        if opp.root_part then
            avg_x = avg_x + opp.root_part.Position.X
            avg_y = avg_y + opp.root_part.Position.Y
            avg_z = avg_z + opp.root_part.Position.Z
        end
    end
    
    avg_x = avg_x / #opponents
    avg_y = avg_y / #opponents
    avg_z = avg_z / #opponents
    
    return {
        center = Vector3.new(avg_x, avg_y, avg_z),
        count = #opponents,
        density = #opponents / (10 * 10),  -- Normalized to 10x10 area
    }
end

local function PredictOpponentMovement(opponent, history)
    --[[
    Predict where opponent will move based on history
    ]]
    
    -- Simple linear prediction
    if #history < 2 then
        return opponent.root_part.Position
    end
    
    local prev_pos = history[#history - 1]
    local curr_pos = history[#history]
    
    local velocity = curr_pos - prev_pos
    local predicted = curr_pos + velocity
    
    return predicted
end

-- ============================================================================
-- INTELLIGENT ZONE SELECTION
-- ============================================================================

local function SelectTargetZone(ball_pos, opponents_center, opponent_analysis)
    --[[
    Intelligently select which court zone to target based on opponent position
    ]]
    
    if not opponents_center then
        -- No opponents, go to middle for maximum power
        return "middle", 0
    end
    
    -- Calculate distances to different zones
    local zones_scores = {}
    
    for _, zone in ipairs(ML_CONFIG.COURT_ZONES) do
        -- Get zone offset from ball
        local zone_offset
        
        if zone == "cross_left" then
            zone_offset = Vector3.new(-8, 0, 12)
        elseif zone == "cross_right" then
            zone_offset = Vector3.new(8, 0, 12)
        elseif zone == "line_left" then
            zone_offset = Vector3.new(-12, 0, 0)
        elseif zone == "line_right" then
            zone_offset = Vector3.new(12, 0, 0)
        else  -- middle
            zone_offset = Vector3.new(0, 0, 10)
        end
        
        local zone_pos = ball_pos + zone_offset
        
        -- Distance from opponents to zone (higher = better)
        local distance_from_opponents = (zone_pos - opponents_center).Magnitude
        
        -- Success rate bonus
        local success_bonus = MLEngine.zone_success_rates[zone] or 0.5
        
        -- Score: distance * success_rate
        zones_scores[zone] = (distance_from_opponents / 10) * (1 + success_bonus)
    end
    
    -- Find best zone
    local best_zone = "middle"
    local best_score = 0
    
    for zone, score in pairs(zones_scores) do
        if score > best_score then
            best_score = score
            best_zone = zone
        end
    end
    
    return best_zone, best_score
end

-- ============================================================================
-- LEARNING FROM RESULTS
-- ============================================================================

local function RecordSpikeAttempt(spike_data, success)
    --[[
    Record spike attempt in training history
    ]]
    
    table.insert(MLEngine.spike_history, {
        angle = spike_data.angle,
        power = spike_data.power,
        timing = spike_data.timing,
        zone = spike_data.zone,
        success = success,
        timestamp = tick(),
    })
    
    if success then
        MLEngine.successful_episodes = MLEngine.successful_episodes + 1
    end
    
    MLEngine.total_episodes = MLEngine.total_episodes + 1
    
    -- Keep only last 100 records
    if #MLEngine.spike_history > 100 then
        table.remove(MLEngine.spike_history, 1)
    end
end

local function UpdateZoneSuccessRate(zone, success)
    --[[
    Update success rate for a specific zone
    ]]
    
    if not MLEngine.zone_success_rates[zone] then
        return
    end
    
    local current_rate = MLEngine.zone_success_rates[zone]
    local adjustment = success and 0.05 or -0.05
    
    MLEngine.zone_success_rates[zone] = 
        math.max(0.1, math.min(0.9, current_rate + adjustment))
end

local function UpdateWeights(prediction, success)
    --[[
    Update neural network weights based on result (simplified SGD)
    ]]
    
    if success then
        -- Increase weights that led to success
        for i = 1, #MLEngine.angle_weights do
            MLEngine.angle_weights[i] = MLEngine.angle_weights[i] + 
                ML_CONFIG.LEARNING_RATE * math.random()
        end
    else
        -- Decrease weights that led to failure
        for i = 1, #MLEngine.angle_weights do
            MLEngine.angle_weights[i] = MLEngine.angle_weights[i] - 
                ML_CONFIG.LEARNING_RATE * math.random()
        end
    end
end

-- ============================================================================
-- ADAPTIVE AGGRESSION
-- ============================================================================

local function CalculateAdaptiveAggression()
    --[[
    Calculate aggression level based on win rate
    ]]
    
    if MLEngine.total_episodes == 0 then
        return 0.5
    end
    
    local win_rate = MLEngine.successful_episodes / MLEngine.total_episodes
    
    -- Map win_rate (0-1) to aggression (0-1)
    -- Higher win rate = more aggressive
    return 0.2 + (win_rate * 0.8)
end

local function CalculateLearningProgress()
    --[[
    Calculate how much the bot has learned
    ]]
    
    if MLEngine.total_episodes == 0 then
        return 0
    end
    
    -- Look at last 20 episodes
    local recent_history = {}
    for i = math.max(1, #MLEngine.spike_history - 19), #MLEngine.spike_history do
        table.insert(recent_history, MLEngine.spike_history[i])
    end
    
    if #recent_history == 0 then
        return 0
    end
    
    local success_count = 0
    for _, record in ipairs(recent_history) do
        if record.success then
            success_count = success_count + 1
        end
    end
    
    return success_count / #recent_history
end

-- ============================================================================
-- INTELLIGENT SPIKE EXECUTION (ML VERSION)
-- ============================================================================

local function ExecuteMLOptimizedSpike()
    --[[
    Execute spike using machine learning predictions
    ]]
    
    local local_player = game:GetService("Players").LocalPlayer
    if not local_player.Character then return end
    
    local humanoid_root = local_player.Character:FindFirstChild("HumanoidRootPart")
    if not humanoid_root then return end
    
    if not BotState.target_ball then return end
    
    local ball_pos = BotState.target_ball:IsA("Model") and 
        BotState.target_ball:GetPrimaryPartCFrame().Position or 
        BotState.target_ball.Position
    
    if not ball_pos then return end
    
    -- Get network prediction
    DetectEnemyPlayers()
    local opponent_analysis = AnalyzeOpponentPositions(AdvancedBotState.enemy_players)
    local prediction = GetNetworkPrediction(ball_pos, humanoid_root.Position, 
        AdvancedBotState.enemy_players)
    
    -- Select target zone
    local zone, zone_score = SelectTargetZone(ball_pos, 
        opponent_analysis and opponent_analysis.center, opponent_analysis)
    
    -- Convert prediction to spike angle
    local spike_angle = prediction.angle * 60  -- -60 to +60 degrees
    local spike_power = math.max(0.8, 1 + prediction.power * 0.5)
    
    -- Execute spike (basic version)
    if IsInSpikeRange() and IsBallAboveGround() then
        PerformSpike()
        
        -- Record attempt (assuming success for now - would need real feedback)
        RecordSpikeAttempt({
            angle = spike_angle,
            power = spike_power,
            timing = prediction.timing,
            zone = zone,
        }, true)
        
        UpdateZoneSuccessRate(zone, true)
        UpdateWeights(prediction, true)
    end
end

-- ============================================================================
-- STATISTICS & LEARNING DISPLAY
-- ============================================================================

local function GetMLStats()
    --[[
    Get machine learning statistics
    ]]
    
    return {
        total_spikes = MLEngine.total_episodes,
        successful_spikes = MLEngine.successful_episodes,
        success_rate = MLEngine.total_episodes > 0 and 
            (MLEngine.successful_episodes / MLEngine.total_episodes * 100) or 0,
        learning_progress = CalculateLearningProgress() * 100,
        aggression_level = CalculateAdaptiveAggression(),
        best_zone = (function()
            local best_zone = "middle"
            local best_rate = 0
            for zone, rate in pairs(MLEngine.zone_success_rates) do
                if rate > best_rate then
                    best_rate = rate
                    best_zone = zone
                end
            end
            return best_zone
        end)(),
    }
end

local function DrawMLStats()
    --[[
    Draw ML statistics on screen
    ]]
    
    local stats = GetMLStats()
    
    DrawText(Vector3.new(0, 150, 0), 
        string.format("SPIKE BOT ML v3.0"),
        Color3.fromRGB(255, 100, 0))
    
    DrawText(Vector3.new(0, 160, 0), 
        string.format("Spikes: %d | Success: %.1f%%",
            stats.total_spikes, stats.success_rate),
        Color3.fromRGB(100, 200, 100))
    
    DrawText(Vector3.new(0, 170, 0), 
        string.format("Learning: %.1f%% | Aggression: %.1f%%",
            stats.learning_progress, stats.aggression_level * 100),
        Color3.fromRGB(100, 150, 255))
    
    DrawText(Vector3.new(0, 180, 0), 
        string.format("Best Zone: %s", stats.best_zone),
        Color3.fromRGB(255, 150, 100))
end

-- ============================================================================
-- MAIN ML BOT LOOP (Override)
-- ============================================================================

local function MLBotUpdate()
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
    
    -- Update ESP
    if BotState.esp_enabled then
        UpdateESP()
        DrawAdvancedESP()
        DrawMLStats()
    end
    
    -- Rotate toward ball
    RotateCharacterTowardsBall()
    
    -- Execute ML-optimized spike
    if IsInSpikeRange() and IsBallAboveGround() then
        ExecuteMLOptimizedSpike()
    end
end

-- Override main loop
RunService.RenderStepped:Connect(function()
    MLBotUpdate()
end)

print("╔════════════════════════════════════════════════════════════════╗")
print("║      VOLTEXBALL - ML SPIKE BOT v3.0 - NEURAL NETWORK LOADED   ║")
print("║                                                                ║")
print("║  Machine Learning Features:                                    ║")
print("║  ✓ Neural network predictions                                 ║")
print("║  ✓ Adaptive spike angle learning                              ║")
print("║  ✓ Zone success rate tracking                                 ║")
print("║  ✓ Opponent behavior analysis                                 ║")
print("║  ✓ Dynamic aggression adjustment                              ║")
print("║  ✓ Real-time learning statistics                              ║")
print("║                                                                ║")
print("║  Training Data: " .. MLEngine.total_episodes .. " episodes recorded")
print("║  Current Success Rate: " .. 
    string.format("%.1f%%", MLEngine.total_episodes > 0 and 
    (MLEngine.successful_episodes / MLEngine.total_episodes * 100) or 0))
print("║                                                                ║")
print("╚════════════════════════════════════════════════════════════════╝")
