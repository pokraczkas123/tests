-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.BeachSplashScoreEffect

game:GetService("TweenService")
local v_u_1 = game:GetService("Debris")
return function(p2)
    -- upvalues: (copy) v_u_1
    local v3 = CFrame.new(p2)
    local v4 = script.MeshPartss:Clone()
    v_u_1:AddItem(v4, 6)
    v4.CFrame = v3 * CFrame.new(0, -2.5, 0)
    v4.Parent = workspace
    local v5 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v4.Transparency = 0.5
    v4.Size = Vector3.new(0.1, 0.1, 0.1)
    game:GetService("TweenService"):Create(v4, v5, {
        ["Size"] = Vector3.new(50, 2, 50),
        ["Transparency"] = 1
    }):Play()
    local v6 = script.MeshPart2:Clone()
    v_u_1:AddItem(v6, 6)
    v6.CFrame = v3 * CFrame.new(0, -2.5, 0)
    v6.Parent = workspace
    local v7 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v6.Transparency = 0.5
    v6.Size = Vector3.new(0.1, 0.1, 0.1)
    game:GetService("TweenService"):Create(v6, v7, {
        ["Size"] = Vector3.new(50, 0.1, 50),
        ["Transparency"] = 1
    }):Play()
    local v8 = script.MeshPart3:Clone()
    v_u_1:AddItem(v8, 6)
    v8.CFrame = v3 * CFrame.new(0, -2.5, 0)
    v8.Parent = workspace
    local v9 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v8.Transparency = 0.5
    v8.Size = Vector3.new(0.1, 0.1, 0.1)
    game:GetService("TweenService"):Create(v8, v9, {
        ["Size"] = Vector3.new(70, 20, 70),
        ["Transparency"] = 1
    }):Play()
    local v10 = script.Beach:Clone()
    v_u_1:AddItem(v10, 6)
    v10.CFrame = v6.CFrame * CFrame.new(0, 0, 0)
    v10.Parent = workspace
    for _, v11 in v10:GetDescendants() do
        if v11:IsA("ParticleEmitter") then
            v11:Emit(v11:GetAttribute("EmitCount"))
        end
    end
end