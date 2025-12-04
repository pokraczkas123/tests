-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.SpiderInfestationScoreEffect

local _ = game:GetService("ReplicatedStorage").Assets.Misc.SpecialEffects.Modules
local v_u_1 = game:GetService("TweenService")
local v_u_2 = workspace:WaitForChild("Effects")
local v_u_3 = script.SpidersEffect
local v_u_4 = script.Spider
local v_u_5 = v_u_4.PrimaryPart.PivotOffset:Inverse()
local function v_u_9(p_u_6, p7, p8)
    if p7 and p7 > 0 then
        p_u_6.Enabled = true
        task.delay(p7, function()
            -- upvalues: (copy) p_u_6
            p_u_6.Enabled = false
        end)
    end
    p_u_6:Emit(p8)
end
local function v_u_14(p_u_10)
    -- upvalues: (copy) v_u_9
    local v11 = p_u_10:GetAttributes()
    if v11.EmitDelay and v11.EmitDelay > 0 then
        task.delay(v11.EmitDelay, v_u_9, v11.EmitDuration, v11.EmitCount)
    else
        local v12 = v11.EmitDuration
        local v13 = v11.EmitCount
        if v12 and v12 > 0 then
            p_u_10.Enabled = true
            task.delay(v12, function()
                -- upvalues: (copy) p_u_10
                p_u_10.Enabled = false
            end)
        end
        p_u_10:Emit(v13)
    end
    return (v11.EmitDuration or 0) + (v11.EmitDelay or 0) + p_u_10.Lifetime.Max
end
local function v_u_19(p15)
    -- upvalues: (copy) v_u_14
    local v16 = 0
    for _, v17 in p15:GetDescendants() do
        if v17.ClassName == "ParticleEmitter" then
            local v18 = v_u_14(v17)
            v16 = math.max(v18, v16)
        end
    end
    return v16
end
return function(p20, _, p21)
    -- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_19, (copy) v_u_4, (copy) v_u_5, (copy) v_u_1
    local v22 = v_u_3:Clone()
    v22.Parent = v_u_2
    v22.Position = p20
    local v23 = v_u_19(v22)
    p21:GiveTask(v22)
    task.delay(v23, v22.Destroy, v22)
    local v24 = Instance.new("Folder")
    v24.Parent = v_u_2
    local v25 = 0
    for v26 = 1, 12 do
        local v_u_27 = v_u_4:Clone()
        v_u_27.Parent = v24
        local v28 = v_u_27.PrimaryPart or v_u_27.Main
        local v29 = 0.5235987755982988 * v26
        local v30 = math.cos(v29)
        local v31 = math.sin(v29)
        local v32 = Vector3.new(v30, 0, v31)
        local v33 = p20 + v32 * (10 + 10 * 0.3 * (math.random() - 0.5) * 2)
        local v34 = CFrame.new(p20, p20 + v32) * v_u_5
        local v35 = CFrame.new(v33, v33 + v32) * v_u_5
        local v36 = 1.2 + 1.2 * 0.4 * (math.random() - 0.5) * 2
        v25 = math.max(v25, v36)
        local v37 = TweenInfo.new(v36, Enum.EasingStyle.Linear)
        v28.CFrame = v34
        v_u_1:Create(v28, v37, {
            ["CFrame"] = v35
        }):Play()
        local v_u_38 = {
            ["Transparency"] = 1
        }
        local v39 = v36 * 0.7
        local v_u_40 = TweenInfo.new(v36 - v39, Enum.EasingStyle.Linear)
        task.delay(v39, function()
            -- upvalues: (copy) v_u_27, (ref) v_u_1, (copy) v_u_40, (copy) v_u_38
            for _, v41 in v_u_27:GetChildren() do
                if v41:IsA("BasePart") then
                    v_u_1:Create(v41, v_u_40, v_u_38):Play()
                end
            end
        end)
    end
    p21:GiveTask(v24)
    task.delay(v25, v24.Destroy, v24)
end