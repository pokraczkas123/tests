-- Decompiled game.ReplicatedStorage.Assets.Effects.Serve1

game:GetService("TweenService")
local v_u_1 = game:GetService("Debris")
return function(p2)
    -- upvalues: (copy) v_u_1
    local v3 = script.Mesh1:Clone()
    v_u_1:AddItem(v3, 3)
    v3.CFrame = p2.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4) * CFrame.Angles(-190, 0, 0)
    v3.Parent = workspace.Effects
    local v4 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v3.Transparency = 0.5
    v3.Size = Vector3.new(0.1, 0.1, 0.1)
    local v5 = {
        ["Size"] = Vector3.new(5, 0.5, 5),
        ["Transparency"] = 1,
        ["CFrame"] = v3.CFrame * CFrame.new(0, 0.25, 0)
    }
    game:GetService("TweenService"):Create(v3, v4, v5):Play()
    local v6 = script.VFX:Clone()
    v_u_1:AddItem(v6, 3)
    v6.CFrame = v3.CFrame * CFrame.new(0, 0, 0)
    v6.Parent = workspace.Effects
    for _, v7 in v6:GetDescendants() do
        if v7:IsA("ParticleEmitter") then
            v7:Emit(v7:GetAttribute("EmitCount"))
        end
    end
end