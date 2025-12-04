-- Decompiled game.ReplicatedStorage.Assets.Effects.SpecialChargeSpikeVFX

local v_u_1 = game:GetService("Debris")
return function(p2)
    -- upvalues: (copy) v_u_1
    local v3 = script.Mesh1:Clone()
    v_u_1:AddItem(v3, 3)
    v3.CFrame = p2.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4) * CFrame.Angles(-190, 0, 0)
    v3.Parent = workspace.Effects
    local v4 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v3.Transparency = 0
    v3.Size = Vector3.new(0.1, 0.1, 0.1)
    game:GetService("TweenService"):Create(v3, v4, {
        ["Size"] = Vector3.new(13, 10, 13),
        ["Transparency"] = 1
    }):Play()
    local v5 = script.MeshCircle:Clone()
    v_u_1:AddItem(v5, 3)
    v5.CFrame = p2.HumanoidRootPart.CFrame * CFrame.new(0, 1, 0) * CFrame.Angles(-190, 0, 0)
    v5.Parent = workspace.Effects
    local v6 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v5.Transparency = 0.4
    v5.Size = Vector3.new(0.1, 0.1, 0.1)
    v5.CFrame = p2.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0) * CFrame.Angles(-190, 0, 0)
    local v7 = {
        ["Size"] = Vector3.new(16, 1.75, 16),
        ["Transparency"] = 1,
        ["CFrame"] = p2.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2.5) * CFrame.Angles(-190, 0, 0)
    }
    game:GetService("TweenService"):Create(v5, v6, v7):Play()
    local v8 = script.VFX:Clone()
    v_u_1:AddItem(v8, 3)
    v8.CFrame = v3.CFrame * CFrame.new(0, -1, 0)
    v8.Parent = workspace.Effects
    for _, v9 in v8:GetDescendants() do
        if v9:IsA("ParticleEmitter") then
            v9:Emit(v9:GetAttribute("EmitCount"))
        end
    end
end