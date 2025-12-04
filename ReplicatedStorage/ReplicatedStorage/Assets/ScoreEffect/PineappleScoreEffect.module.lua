-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.PineappleScoreEffect

local v_u_1 = game:GetService("TweenService")
local v_u_2 = game:GetService("Debris")
return function(p3)
    -- upvalues: (copy) v_u_2, (copy) v_u_1
    local v4 = CFrame.new(p3) * CFrame.new(0, 6, 0)
    local v5 = script.Pineapple:Clone()
    v_u_2:AddItem(v5, 6)
    v5.CFrame = v4 * CFrame.new(0, 30, -3)
    v5.Parent = workspace
    local v6 = TweenInfo.new(2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out)
    v5.Transparency = 0
    v5.Size = Vector3.new(13.5075, 23.234999, 13.5075)
    v_u_1:Create(v5, v6, {
        ["CFrame"] = v4,
        ["Transparency"] = 0
    }):Play()
    task.wait(0.7)
    v5.Size = v5.Size * Vector3.new(1.3, 0.5, 1.3)
    v_u_1:Create(v5, TweenInfo.new(1.7, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
        ["Size"] = Vector3.new(13.5075, 23.234999, 13.5075)
    }):Play()
    task.wait(1.7)
    v_u_1:Create(v5, TweenInfo.new(0.3, Enum.EasingStyle.Elastic, Enum.EasingDirection.In), {
        ["Size"] = Vector3.new(0.1, 0.1, 0.1)
    }):Play()
    task.wait(0.3)
    local v7 = script.Emit:Clone()
    v_u_2:AddItem(v7, 6)
    v7.CFrame = v5.CFrame * CFrame.new(0, 0, 0)
    v7.Parent = workspace
    for _, v8 in v7:GetDescendants() do
        if v8:IsA("ParticleEmitter") then
            v8:Emit(v8:GetAttribute("EmitCount"))
        end
    end
    v5:Destroy()
    task.wait(3)
    v7:Destroy()
end