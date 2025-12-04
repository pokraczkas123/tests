-- Decompiled game.ReplicatedStorage.Assets.Effects.Hit2

game:GetService("TweenService")
local v_u_1 = game:GetService("Debris")
return function(p2)
    -- upvalues: (copy) v_u_1
    local v3 = script.MeshPartss:Clone()
    v_u_1:AddItem(v3, 3)
    v3.CFrame = p2.HumanoidRootPart.CFrame * CFrame.new(0, -2.5, 0)
    v3.Parent = workspace.Effects
    local v4 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v3.Transparency = 0.5
    v3.Size = Vector3.new(0.1, 0.1, 0.1)
    game:GetService("TweenService"):Create(v3, v4, {
        ["Size"] = Vector3.new(25, 1, 25),
        ["Transparency"] = 1
    }):Play()
    local v5 = script.MeshPart2:Clone()
    v_u_1:AddItem(v5, 3)
    v5.CFrame = p2.HumanoidRootPart.CFrame * CFrame.new(0, -2.5, 0)
    v5.Parent = workspace.Effects
    local v6 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v5.Transparency = 0.5
    v5.Size = Vector3.new(0.1, 0.1, 0.1)
    game:GetService("TweenService"):Create(v5, v6, {
        ["Size"] = Vector3.new(25, 0.1, 25),
        ["Transparency"] = 1
    }):Play()
    local v7 = script.MeshPart3:Clone()
    v_u_1:AddItem(v7, 3)
    v7.CFrame = p2.HumanoidRootPart.CFrame * CFrame.new(0, -2.5, 0)
    v7.Parent = workspace.Effects
    local v8 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v7.Transparency = 0.5
    v7.Size = Vector3.new(0.1, 0.1, 0.1)
    game:GetService("TweenService"):Create(v7, v8, {
        ["Size"] = Vector3.new(35, 5, 35),
        ["Transparency"] = 1
    }):Play()
    local v9 = script.VFX:Clone()
    v_u_1:AddItem(v9, 3)
    v9.CFrame = v5.CFrame * CFrame.new(0, 0, 0)
    v9.Parent = workspace.Effects
    for _, v10 in v9:GetDescendants() do
        if v10:IsA("ParticleEmitter") then
            v10:Emit(v10:GetAttribute("EmitCount"))
        end
    end
end