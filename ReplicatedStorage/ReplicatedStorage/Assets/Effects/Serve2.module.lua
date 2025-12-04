-- Decompiled game.ReplicatedStorage.Assets.Effects.Serve2

game:GetService("TweenService")
return function(p1)
    local v2 = script.Mesh1:Clone()
    v2.CFrame = p1.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4) * CFrame.Angles(-190, 0, 0)
    v2.Parent = workspace.Effects
    local v3 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v2.Transparency = 0
    v2.Size = Vector3.new(0.1, 0.1, 0.1)
    game:GetService("TweenService"):Create(v2, v3, {
        ["Size"] = Vector3.new(13, 4, 13),
        ["Transparency"] = 1
    }):Play()
    local v4 = script.VFX:Clone()
    v4.CFrame = v2.CFrame * CFrame.new(0, -1, 0)
    v4.Parent = workspace.Effects
    for _, v5 in v4:GetDescendants() do
        if v5:IsA("ParticleEmitter") then
            v5:Emit(v5:GetAttribute("EmitCount"))
        end
    end
end