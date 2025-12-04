-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.FountainScoreEffect

Random.new()
local v_u_1 = workspace.CurrentCamera
local v_u_2 = game:GetService("TweenService")
local v_u_4 = require(game.ReplicatedStorage.Assets.Misc.SpecialEffects.Modules.ScreenShakeModule).new(Enum.RenderPriority.Camera.Value, function(p3)
    -- upvalues: (copy) v_u_1
    v_u_1.CFrame = v_u_1.CFrame * p3
end)
local function v_u_8(p5, p6)
    for _, v7 in p5:GetDescendants() do
        if v7:IsA("ParticleEmitter") or v7:IsA("Trail") or v7:IsA("Beam") then
            v7.Enabled = p6
        end
    end
end
local function v_u_13(p9, p10, p11)
    -- upvalues: (copy) v_u_2
    for _, v12 in p9:GetDescendants() do
        if v12:IsA("Beam") then
            v_u_2:Create(v12, TweenInfo.new(1, Enum.EasingStyle.Sine), {
                [p10] = p11
            }):Play()
        end
    end
end
local function v_u_16(p14)
    for _, v_u_15 in p14:GetDescendants() do
        if v_u_15:IsA("ParticleEmitter") then
            task.delay(v_u_15:GetAttribute("EmitDelay"), function()
                -- upvalues: (copy) v_u_15
                v_u_15:Emit(v_u_15:GetAttribute("EmitCount"))
            end)
        end
    end
end
return function(p17, _, _)
    -- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_16, (copy) v_u_8, (copy) v_u_13
    v_u_4:Start()
    local v_u_18 = script.Fountain:Clone()
    local v19 = v_u_18.Fountain
    local v_u_20 = v_u_18.FountainFX
    v_u_18.Parent = workspace.Effects
    v19["Circle.002"].CFrame = CFrame.new(p17) * CFrame.new(0, -15, 0)
    v_u_20.CFrame = v19["Circle.002"].CFrame * CFrame.new(0, 8.5, 0)
    v_u_2:Create(v19["Circle.002"], TweenInfo.new(1, Enum.EasingStyle.Bounce), {
        ["CFrame"] = CFrame.new(p17 + Vector3.new(0, 5, 0))
    }):Play()
    task.delay(0.25, function()
        -- upvalues: (ref) v_u_4, (ref) v_u_16, (copy) v_u_20
        v_u_4:Shake(v_u_4.Presets.SofterExplosion)
        v_u_16(v_u_20)
    end)
    task.wait(1)
    v_u_8(v19["Circle.002"].FountainFlow, true)
    v_u_8(v19["Circle.002"].WaterFX.First, true)
    task.wait(0.15)
    v_u_13(v19["Circle.002"].FountainFlow.First, "Brightness", 5)
    task.wait(0.35)
    v_u_8(v19["Circle.002"].WaterFX.Second, true)
    task.wait(0.15)
    v_u_13(v19["Circle.002"].FountainFlow.Second, "Brightness", 5)
    task.wait(0.35)
    v_u_8(v19["Circle.002"].WaterFX.Third, true)
    task.wait(0.15)
    v_u_13(v19["Circle.002"].FountainFlow.Third, "Brightness", 5)
    task.wait(3)
    v_u_8(v19["Circle.002"].WaterFX.First, false)
    v_u_13(v19["Circle.002"].FountainFlow.First, "Brightness", 0)
    task.wait(0.35)
    v_u_8(v19["Circle.002"].WaterFX.Second, false)
    v_u_13(v19["Circle.002"].FountainFlow.Second, "Brightness", 0)
    task.wait(0.35)
    v_u_8(v19["Circle.002"].WaterFX.Third, false)
    v_u_13(v19["Circle.002"].FountainFlow.Third, "Brightness", 0)
    task.wait(0.75)
    v_u_2:Create(v19["Circle.002"], TweenInfo.new(1, Enum.EasingStyle.Bounce), {
        ["CFrame"] = CFrame.new(p17) * CFrame.new(0, -20, 0)
    }):Play()
    v_u_4:Shake(v_u_4.Presets.SofterExplosion)
    v_u_16(v_u_20)
    task.delay(1, function()
        -- upvalues: (copy) v_u_18
        v_u_18:Destroy()
    end)
end