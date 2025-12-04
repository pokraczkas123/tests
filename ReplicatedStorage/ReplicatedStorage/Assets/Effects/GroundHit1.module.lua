-- Decompiled game.ReplicatedStorage.Assets.Effects.GroundHit1

local v_u_1 = game:GetService("Debris")
local v_u_2 = game:GetService("TweenService")
return function(p3)
    -- upvalues: (copy) v_u_1, (copy) v_u_2
    local v4 = script.Mesh1:Clone()
    v_u_1:AddItem(v4, 2)
    v4.CFrame = p3
    v4.Parent = workspace.Effects
    local v5 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v4.Transparency = 0.5
    v4.Size = Vector3.new(0.1, 0.1, 0.1)
    v_u_2:Create(v4, v5, {
        ["Size"] = Vector3.new(5, 0.5, 5),
        ["Transparency"] = 1,
        ["CFrame"] = v4.CFrame * CFrame.new(0, 0.25, 0)
    }):Play()
    local v6 = script.VFX:Clone()
    v_u_1:AddItem(v6, 2)
    v6.CFrame = v4.CFrame
    v6.Parent = workspace.Effects
    for _, v7 in v6:GetDescendants() do
        if v7:IsA("ParticleEmitter") then
            v7:Emit(v7:GetAttribute("EmitCount"))
        end
    end
end