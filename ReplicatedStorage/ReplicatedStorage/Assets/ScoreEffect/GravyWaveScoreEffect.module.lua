-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.GravyWaveScoreEffect

Random.new()
local v_u_1 = workspace.CurrentCamera
local _ = game:GetService("Players").LocalPlayer
local v_u_2 = game:GetService("TweenService")
game:GetService("RunService")
local v3 = game.ReplicatedStorage.Assets.Misc.SpecialEffects
require(v3.Modules.BezierModule)
local v_u_5 = require(v3.Modules.ScreenShakeModule).new(Enum.RenderPriority.Camera.Value, function(p4)
    -- upvalues: (copy) v_u_1
    v_u_1.CFrame = workspace.CurrentCamera.CFrame * p4
end)
v_u_5:Start()
local function v_u_9(p6, p7)
    for _, v8 in p6:GetDescendants() do
        if v8:IsA("ParticleEmitter") then
            v8.Enabled = p7
        end
    end
end
local function v_u_13(p10, p11)
    for _, v12 in p10:GetDescendants() do
        if v12:IsA("Trail") or v12:IsA("Beam") then
            v12.Enabled = p11
        end
    end
end
local function v_u_30(p_u_14, p_u_15, p_u_16, p17, p18, p19)
    -- upvalues: (copy) v_u_2
    local v_u_20 = Instance.new("NumberValue")
    v_u_20.Value = 0
    v_u_20:GetPropertyChangedSignal("Value"):Connect(function()
        -- upvalues: (copy) v_u_20, (copy) p_u_15, (copy) p_u_16, (copy) p_u_14
        local v21 = v_u_20.Value
        local v22 = {}
        for v23, v24 in ipairs(p_u_15.Keypoints) do
            local v25 = p_u_16.Keypoints[v23]
            local v26 = v24.Time
            local v27 = v24.Value + (v25.Value - v24.Value) * v21
            local v28 = NumberSequenceKeypoint.new
            table.insert(v22, v28(v26, v27))
        end
        p_u_14.Transparency = NumberSequence.new(v22)
    end)
    local v29 = v_u_2:Create(v_u_20, TweenInfo.new(p17, p18, p19), {
        ["Value"] = 1
    })
    v29.Completed:Connect(function()
        -- upvalues: (copy) v_u_20
        v_u_20:Destroy()
    end)
    v29:Play()
end
return function(p31, _, p32)
    -- upvalues: (copy) v_u_5, (copy) v_u_9, (copy) v_u_13, (copy) v_u_2, (copy) v_u_30
    local v_u_33 = os.clock() + 2
    local v_u_34 = script.GravyWave:Clone()
    local v_u_35 = v_u_34.WaveFX
    p32:GiveTask(v_u_34)
    v_u_34.Parent = workspace.Effects
    task.spawn(function()
        -- upvalues: (ref) v_u_5, (copy) v_u_33
        repeat
            v_u_5:Shake(v_u_5.Presets.SoftVibration)
            task.wait(0.15)
        until v_u_33 <= os.clock()
    end)
    v_u_35.CFrame = CFrame.new(p31) * CFrame.new(0, 1, 75) * CFrame.Angles(0, 3.141592653589793, 0)
    v_u_9(v_u_35, true)
    v_u_13(v_u_35.Beams.Att0, true)
    v_u_2:Create(v_u_35.Beams["Att1.5"], TweenInfo.new(2.6666666666666665, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        ["Position"] = Vector3.new(0, -3.5, -75)
    }):Play()
    v_u_2:Create(v_u_35.Beams.Att1, TweenInfo.new(2.1333333333333333, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
        ["Position"] = Vector3.new(0, 0, -60)
    }):Play()
    for _, v36 in v_u_35.Beams["Att0.5"]:GetDescendants() do
        if v36:IsA("Beam") then
            v_u_2:Create(v36, TweenInfo.new(1, Enum.EasingStyle.Sine), {
                ["CurveSize0"] = 30
            }):Play()
        end
    end
    v_u_2:Create(v_u_35, TweenInfo.new(4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        ["CFrame"] = v_u_35.CFrame * CFrame.new(0, 0, 131.25)
    }):Play()
    task.delay(0.25, function()
        -- upvalues: (ref) v_u_2, (copy) v_u_35, (ref) v_u_30
        v_u_2:Create(v_u_35.Beams["Att0.5"], TweenInfo.new(0.15, Enum.EasingStyle.Sine), {
            ["Position"] = Vector3.new(0, 0, 0)
        }):Play()
        v_u_2:Create(v_u_35.Beams.Att0.Background, TweenInfo.new(0.15, Enum.EasingStyle.Back), {
            ["Brightness"] = 2
        }):Play()
        v_u_2:Create(v_u_35.Beams.Att0.Waves1, TweenInfo.new(0.15, Enum.EasingStyle.Back), {
            ["Brightness"] = 10
        }):Play()
        v_u_2:Create(v_u_35.Beams.Att0.Waves2, TweenInfo.new(0.15, Enum.EasingStyle.Back), {
            ["Brightness"] = 30
        }):Play()
        for _, v_u_37 in v_u_35.Beams.Att0:GetChildren() do
            if v_u_37:IsA("Beam") then
                v_u_2:Create(v_u_37, TweenInfo.new(0.15, Enum.EasingStyle.Back), {
                    ["CurveSize1"] = 5
                }):Play()
                local v_u_38 = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.5, 0), NumberSequenceKeypoint.new(1, 1) })
                local v_u_39 = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0), NumberSequenceKeypoint.new(1, 0) })
                task.spawn(function()
                    -- upvalues: (ref) v_u_30, (copy) v_u_37, (copy) v_u_38, (copy) v_u_39
                    v_u_30(v_u_37, v_u_38, v_u_39, 0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
                end)
            end
        end
    end)
    task.delay(0.275, function()
        -- upvalues: (ref) v_u_13, (copy) v_u_35
        v_u_13(v_u_35.Beams["Att0.5"].Group1, true)
        v_u_13(v_u_35.Beams["Att1.5"], true)
        task.wait(0.125)
        v_u_13(v_u_35.Beams["Att0.5"].Group2, true)
    end)
    task.delay(2, function()
        -- upvalues: (ref) v_u_2, (copy) v_u_35, (ref) v_u_9, (ref) v_u_30, (ref) v_u_13
        v_u_2:Create(v_u_35.Beams.Att0, TweenInfo.new(0.3, Enum.EasingStyle.Sine), {
            ["Position"] = Vector3.new(0, 0, 0)
        }):Play()
        v_u_9(v_u_35, false)
        for _, v40 in v_u_35.Beams.Att0:GetChildren() do
            if v40:IsA("Beam") then
                v_u_2:Create(v40, TweenInfo.new(0.3, Enum.EasingStyle.Sine), {
                    ["CurveSize1"] = 0
                }):Play()
            end
        end
        for _, v41 in v_u_35.Beams["Att1.5"]:GetDescendants() do
            if v41:IsA("Beam") then
                v_u_2:Create(v41, TweenInfo.new(1, Enum.EasingStyle.Sine), {
                    ["Brightness"] = 0,
                    ["TextureSpeed"] = 1
                }):Play()
            end
        end
        task.delay(0.25, function()
            -- upvalues: (ref) v_u_2, (ref) v_u_35, (ref) v_u_30, (ref) v_u_13
            v_u_2:Create(v_u_35.Beams["Att0.5"], TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                ["Position"] = Vector3.new(0, 0, -60)
            }):Play()
            for _, v_u_42 in v_u_35.Beams["Att0.5"]:GetDescendants() do
                if v_u_42:IsA("Beam") then
                    v_u_2:Create(v_u_42, TweenInfo.new(0.8, Enum.EasingStyle.Back), {
                        ["CurveSize0"] = 0
                    }):Play()
                    v_u_2:Create(v_u_42, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
                        ["TextureSpeed"] = 0
                    }):Play()
                    task.delay(0.4, function()
                        -- upvalues: (ref) v_u_2, (copy) v_u_42
                        v_u_2:Create(v_u_42, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
                            ["Brightness"] = 1
                        }):Play()
                    end)
                    v_u_30(v_u_42, NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.5, 0), NumberSequenceKeypoint.new(1, 1) }), NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0), NumberSequenceKeypoint.new(1, 1) }), 0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
                end
            end
            v_u_13(v_u_35.Beams.Att0, false)
            task.wait(1)
            v_u_13(v_u_35, false)
        end)
    end)
    task.delay(5, function()
        -- upvalues: (copy) v_u_34
        v_u_34:Destroy()
    end)
end