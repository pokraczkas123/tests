-- Decompiled game.ReplicatedStorage.Assets.Effects.GroundHit2

local v_u_1 = game:GetService("Debris")
local v_u_2 = game:GetService("TweenService")
return function(p3)
    -- upvalues: (copy) v_u_1, (copy) v_u_2
    local v4 = script.MeshPartss:Clone()
    v_u_1:AddItem(v4, 1)
    v4.CFrame = p3
    v4.Parent = workspace.Effects
    local v5 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v4.Transparency = 0.5
    v4.Size = Vector3.new(0.1, 0.1, 0.1)
    v_u_2:Create(v4, v5, {
        ["Size"] = Vector3.new(25, 1, 25),
        ["Transparency"] = 1
    }):Play()
    local v6 = script.MeshPart2:Clone()
    v_u_1:AddItem(v6, 1)
    v6.CFrame = p3
    v6.Parent = workspace.Effects
    local v7 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v6.Transparency = 0.5
    v6.Size = Vector3.new(0.1, 0.1, 0.1)
    v_u_2:Create(v6, v7, {
        ["Size"] = Vector3.new(25, 0.1, 25),
        ["Transparency"] = 1
    }):Play()
    local v8 = script.MeshPart3:Clone()
    v_u_1:AddItem(v8, 1)
    v8.CFrame = p3
    v8.Parent = workspace.Effects
    local v9 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v8.Transparency = 0.5
    v8.Size = Vector3.new(0.1, 0.1, 0.1)
    v_u_2:Create(v8, v9, {
        ["Size"] = Vector3.new(35, 5, 35),
        ["Transparency"] = 1
    }):Play()
    local v10 = script.VFX:Clone()
    v_u_1:AddItem(v10, 5)
    v10.CFrame = v6.CFrame * CFrame.new(0, 0, 0)
    v10.Parent = workspace.Effects
    for _, v11 in v10:GetDescendants() do
        if v11:IsA("ParticleEmitter") then
            v11:Emit(v11:GetAttribute("EmitCount"))
        end
    end
end