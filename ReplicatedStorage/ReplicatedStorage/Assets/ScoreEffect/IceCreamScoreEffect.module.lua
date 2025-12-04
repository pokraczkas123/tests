-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.IceCreamScoreEffect

game:GetService("TweenService")
local v_u_1 = game:GetService("Debris")
return function(p2)
    -- upvalues: (copy) v_u_1
    local v3 = CFrame.new(p2)
    local v4 = script.IceCream:Clone()
    v_u_1:AddItem(v4, 6)
    v4.CFrame = v3 * CFrame.new(0, 6, 0)
    v4.Parent = workspace
    local v5 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v4.Transparency = 0
    v4.Size = Vector3.new(1.214, 1.99, 1.214)
    game:GetService("TweenService"):Create(v4, v5, {
        ["Size"] = Vector3.new(6.069, 9.948, 6.069),
        ["Transparency"] = 0
    }):Play()
    task.wait(0.5)
    local v6 = script.Emit1:Clone()
    v_u_1:AddItem(v6, 6)
    v6.CFrame = v3 * CFrame.new(0, 3.75, 0)
    v6.Parent = workspace
    for _, v7 in v6:GetDescendants() do
        if v7:IsA("ParticleEmitter") then
            v7:Emit(v7:GetAttribute("EmitCount"))
        end
    end
    v4:Destroy()
end