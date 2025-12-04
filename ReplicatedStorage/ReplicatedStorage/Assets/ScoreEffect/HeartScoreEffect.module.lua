-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.HeartScoreEffect

local v_u_1 = game:GetService("Debris")
game:GetService("TweenService")
return function(p2)
    -- upvalues: (copy) v_u_1
    local v3 = CFrame.new(p2)
    local v4 = script.MeshPartss:Clone()
    v_u_1:AddItem(v4, 5)
    v4.CFrame = v3 * CFrame.new(0, -2.5, 0)
    v4.Parent = workspace
    local v5 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v4.Transparency = 0.5
    v4.Size = Vector3.new(0.1, 0.1, 0.1)
    game:GetService("TweenService"):Create(v4, v5, {
        ["Size"] = Vector3.new(25, 1, 25),
        ["Transparency"] = 1
    }):Play()
    local v6 = script.MeshPart2:Clone()
    v_u_1:AddItem(v6, 5)
    v6.CFrame = v3 * CFrame.new(0, -2.5, 0)
    v6.Parent = workspace
    local v7 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v6.Transparency = 0.5
    v6.Size = Vector3.new(0.1, 0.1, 0.1)
    game:GetService("TweenService"):Create(v6, v7, {
        ["Size"] = Vector3.new(25, 0.1, 25),
        ["Transparency"] = 1
    }):Play()
    local v8 = script.MeshPart3:Clone()
    v_u_1:AddItem(v8, 5)
    v8.CFrame = v3 * CFrame.new(0, -2.5, 0)
    v8.Parent = workspace
    local v9 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v8.Transparency = 0.5
    v8.Size = Vector3.new(0.1, 0.1, 0.1)
    game:GetService("TweenService"):Create(v8, v9, {
        ["Size"] = Vector3.new(35, 10, 35),
        ["Transparency"] = 1
    }):Play()
    local v10 = script.Heart:Clone()
    v_u_1:AddItem(v10, 5)
    v10.CFrame = v3 * CFrame.new(0, 0, 0)
    v10.Parent = workspace
    local v11 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v10.Transparency = 0
    v10.Size = Vector3.new(5.291, 5.078, 0.476)
    game:GetService("TweenService"):Create(v10, v11, {
        ["Size"] = Vector3.new(25, 25, 4),
        ["Transparency"] = 1
    }):Play()
    local v12 = script.VFX:Clone()
    v_u_1:AddItem(v12, 5)
    v12.CFrame = v6.CFrame * CFrame.new(0, 0, 0)
    v12.Parent = workspace
    for _, v13 in v12:GetDescendants() do
        if v13:IsA("ParticleEmitter") then
            v13:Emit(v13:GetAttribute("EmitCount"))
        end
    end
end