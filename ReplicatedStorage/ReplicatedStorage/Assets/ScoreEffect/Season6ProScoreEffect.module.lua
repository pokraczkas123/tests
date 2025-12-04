-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.Season6ProScoreEffect

local v_u_1 = Random.new()
local v_u_2 = workspace.CurrentCamera
local v_u_3 = game:GetService("TweenService")
local v_u_5 = require(game.ReplicatedStorage.Assets.Misc.SpecialEffects.Modules.ScreenShakeModule).new(Enum.RenderPriority.Camera.Value, function(p4)
    -- upvalues: (copy) v_u_2
    v_u_2.CFrame = v_u_2.CFrame * p4
end)
local function v_u_9(p6, p7)
    for _, v8 in p6:GetDescendants() do
        if v8:IsA("ParticleEmitter") or v8:IsA("Trail") or v8:IsA("Beam") then
            v8.Enabled = p7
        end
    end
end
local function v_u_12(p10)
    for _, v_u_11 in p10:GetDescendants() do
        if v_u_11:IsA("ParticleEmitter") then
            task.delay(v_u_11:GetAttribute("EmitDelay"), function()
                -- upvalues: (copy) v_u_11
                v_u_11:Emit(v_u_11:GetAttribute("EmitCount"))
            end)
        end
    end
end
return function(p13, _, p14)
    -- upvalues: (copy) v_u_5, (copy) v_u_9, (copy) v_u_3, (copy) v_u_12, (copy) v_u_1
    v_u_5:Start()
    local v15 = script.Fireworks:Clone()
    local v_u_16 = v15.Firework
    local v17 = v15.SeasonFX
    p14:GiveTask(v15)
    v15.Parent = workspace.Effects
    v_u_16.Position = p13 + Vector3.new(0, -5, 0)
    v_u_9(v_u_16, true)
    v_u_3:Create(v_u_16, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
        ["CFrame"] = v_u_16.CFrame * CFrame.new(0, 25, 0)
    }):Play()
    task.wait(1)
    v_u_16.Transparency = 1
    local v18 = {
        Color3.new(1, 0, 0),
        Color3.new(0.333333, 0, 0.498039),
        Color3.new(0.333333, 0, 1),
        Color3.new(0.333333, 0.333333, 1),
        Color3.new(1, 0, 0.498039),
        Color3.new(0, 0.333333, 1),
        Color3.new(0, 0, 1),
        Color3.new(0.666667, 0, 0)
    }
    v_u_5:Shake(v_u_5.Presets.MidExplosion)
    for v19 = 1, 15 do
        local v20 = v18[math.random(#v18)]
        local v21 = v15.FireworkFX:Clone()
        v21.Parent = v15
        for _, v22 in v21:GetDescendants() do
            if v22:IsA("ParticleEmitter") then
                v22.Color = ColorSequence.new(v20)
            end
        end
        if v19 == 1 then
            v21.CFrame = v_u_16.CFrame
            v17.CFrame = v_u_16.CFrame
            v_u_12(v17)
        else
            v21.CFrame = v_u_16.CFrame * CFrame.new(v_u_1:NextNumber(-20, 20), v_u_1:NextNumber(-10, 10), v_u_1:NextNumber(-20, 20))
        end
        v_u_12(v21)
        task.wait(0.05)
    end
    task.delay(2, function()
        -- upvalues: (ref) v_u_9, (copy) v_u_16
        v_u_9(v_u_16, false)
    end)
end