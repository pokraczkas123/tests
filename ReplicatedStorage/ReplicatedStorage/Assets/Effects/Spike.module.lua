-- Decompiled game.ReplicatedStorage.Assets.Effects.Spike

game:GetService("TweenService")
local v_u_1 = game:GetService("Debris")
return function(p2)
    -- upvalues: (copy) v_u_1
    local v3 = script.Mesh1:Clone()
    v_u_1:AddItem(v3, 3)
    v3.CFrame = p2.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4) * CFrame.Angles(-190, 0, 0)
    v3.Parent = workspace.Effects
    local v4 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v3.Transparency = 0
    v3.Size = Vector3.new(0.1, 0.1, 0.1)
    game:GetService("TweenService"):Create(v3, v4, {
        ["Size"] = Vector3.new(13, 4, 13),
        ["Transparency"] = 1
    }):Play()
    local v5 = script.VFX:Clone()
    v_u_1:AddItem(v5, 3)
    v5.CFrame = v3.CFrame * CFrame.new(0, -1, 0)
    v5.Parent = workspace.Effects
    for _, v6 in v5:GetDescendants() do
        if v6:IsA("ParticleEmitter") then
            v6:Emit(v6:GetAttribute("EmitCount"))
        end
    end
end