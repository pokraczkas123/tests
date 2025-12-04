-- Decompiled game.ReplicatedStorage.Assets.Effects.Hit1

game:GetService("TweenService")
local v_u_1 = game:GetService("Debris")
return function(p2)
    -- upvalues: (copy) v_u_1
    local v3 = script.MeshPartss:Clone()
    v_u_1:AddItem(v3, 5)
    v3.CFrame = p2.HumanoidRootPart.CFrame * CFrame.new(0, -2.5, 0)
    v3.Parent = workspace.Effects
    local v4 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v3.Transparency = 0.85
    v3.Size = Vector3.new(0.1, 0.1, 0.1)
    game:GetService("TweenService"):Create(v3, v4, {
        ["Size"] = Vector3.new(10, 1, 10),
        ["Transparency"] = 1
    }):Play()
    local v5 = script.VFX:Clone()
    v_u_1:AddItem(v5, 5)
    v5.CFrame = v3.CFrame * CFrame.new(0, 0, 0)
    v5.Parent = workspace.Effects
    for _, v6 in v5:GetDescendants() do
        if v6:IsA("ParticleEmitter") then
            v6:Emit(v6:GetAttribute("EmitCount"))
        end
    end
end