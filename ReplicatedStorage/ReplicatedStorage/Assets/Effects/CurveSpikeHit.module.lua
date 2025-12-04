-- Decompiled game.ReplicatedStorage.Assets.Effects.CurveSpikeHit

game:GetService("TweenService")
local v_u_1 = game:GetService("Debris")
return function(p2)
    -- upvalues: (copy) v_u_1
    local v3 = script.Mesh1:Clone()
    v_u_1:AddItem(v3, 3)
    v3.CFrame = p2.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4) * CFrame.Angles(-190, 0, 0)
    v3.Parent = workspace
    local v4 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v3.Transparency = 0
    v3.Size = Vector3.new(0.1, 0.1, 0.1)
    game:GetService("TweenService"):Create(v3, v4, {
        ["Size"] = Vector3.new(20, 6, 20),
        ["Transparency"] = 1
    }):Play()
    local v5 = script.MeshCircle:Clone()
    v_u_1:AddItem(v5, 3)
    v5.CFrame = p2.HumanoidRootPart.CFrame * CFrame.new(0, 1, 0) * CFrame.Angles(-190, 0, 0)
    v5.Parent = workspace
    local v6 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v5.Transparency = 0.5
    v5.Size = Vector3.new(0.1, 0.1, 0.1)
    v5.CFrame = p2.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0) * CFrame.Angles(-190, 0, 0)
    local v7 = {
        ["Size"] = Vector3.new(20, 2, 20),
        ["Transparency"] = 1,
        ["CFrame"] = p2.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3) * CFrame.Angles(-190, 0, 0)
    }
    game:GetService("TweenService"):Create(v5, v6, v7):Play()
    local v8 = script.Whirl:Clone()
    v_u_1:AddItem(v8, 3)
    v8.CFrame = p2.HumanoidRootPart.CFrame * CFrame.new(0, 1, 0) * CFrame.Angles(-190, 0, 0)
    v8.Parent = workspace
    local v9 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v8.Transparency = 0
    v8.Size = Vector3.new(5, 5, 5)
    v8.CFrame = p2.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0) * CFrame.Angles(-190, 0, 0)
    local v10 = {
        ["Size"] = Vector3.new(20, 20, 20),
        ["Transparency"] = 1,
        ["CFrame"] = p2.HumanoidRootPart.CFrame * CFrame.new(0, 0, -10) * CFrame.Angles(-190, 0, 0)
    }
    game:GetService("TweenService"):Create(v8, v9, v10):Play()
    local v11 = script.VFX:Clone()
    v_u_1:AddItem(v11, 3)
    v11.CFrame = v3.CFrame * CFrame.new(0, -1, 0)
    v11.Parent = workspace
    for _, v12 in v11:GetDescendants() do
        if v12:IsA("ParticleEmitter") then
            v12:Emit(v12:GetAttribute("EmitCount"))
        end
    end
end