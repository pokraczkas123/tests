-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.PotionSplashScoreEffect

local v_u_1 = game:GetService("TweenService")
local v_u_2 = game:GetService("Debris")
return function(p3)
    -- upvalues: (copy) v_u_2, (copy) v_u_1
    local v4 = CFrame.new(p3)
    local v5 = script.Potion1:Clone()
    v_u_2:AddItem(v5, 1)
    v5.CFrame = v4 * CFrame.new(0, 2, -11)
    v5.Parent = workspace
    local v6 = script.Potion2:Clone()
    v_u_2:AddItem(v6, 1)
    v6.CFrame = v4 * CFrame.new(0, 0, -11)
    v6.Parent = workspace
    local v7 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v5.Size = Vector3.new(1.12, 1.88, 1.08)
    v6.Size = Vector3.new(1, 1, 1)
    local v8 = script.Appear:Clone()
    v_u_2:AddItem(v8, 5)
    v8.CFrame = v5.CFrame
    v8.Parent = workspace
    for _, v9 in v8:GetDescendants() do
        if v9:IsA("ParticleEmitter") then
            v9:Emit(v9:GetAttribute("EmitCount"))
        end
    end
    v_u_1:Create(v5, v7, {
        ["Size"] = Vector3.new(8.213, 13.786, 7.919)
    }):Play()
    v_u_1:Create(v6, v7, {
        ["Size"] = Vector3.new(7.333, 7.333, 7.333)
    }):Play()
    task.wait(1)
    local v10 = script.Dissappear:Clone()
    v_u_2:AddItem(v10, 5)
    v10.CFrame = v5.CFrame * CFrame.new(0, 0, 0)
    v10.Parent = workspace
    for _, v11 in v10:GetDescendants() do
        if v11:IsA("ParticleEmitter") then
            v11:Emit(v11:GetAttribute("EmitCount"))
        end
    end
end