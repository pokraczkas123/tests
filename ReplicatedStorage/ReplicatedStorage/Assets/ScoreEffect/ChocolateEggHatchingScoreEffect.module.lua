-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.ChocolateEggHatchingScoreEffect

game:GetService("TweenService")
local v_u_1 = game:GetService("Debris")
return function(p2)
    -- upvalues: (copy) v_u_1
    local v3 = script.EggMesh:Clone()
    v_u_1:AddItem(v3, 7)
    v3.CFrame = CFrame.new(p2 + Vector3.new(0, 1.8, 0))
    v3.Parent = workspace
    local v4 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v3.Transparency = 0
    v3.Size = Vector3.new(2, 2.606, 2)
    local v5 = script.VFX1:Clone()
    v_u_1:AddItem(v5, 7)
    v5.CFrame = v3.CFrame
    v5.Parent = workspace
    for _, v6 in v5:GetDescendants() do
        if v6:IsA("ParticleEmitter") then
            v6:Emit(v6:GetAttribute("EmitCount"))
        end
    end
    game:GetService("TweenService"):Create(v3, v4, {
        ["Size"] = Vector3.new(8, 10.424, 8),
        ["Transparency"] = 0
    }):Play()
    task.wait(1)
    local v7 = script.VFX:Clone()
    v_u_1:AddItem(v7, 7)
    v7.CFrame = v3.CFrame * CFrame.new(0, 0, 0)
    v7.Parent = workspace
    for _, v8 in v7:GetDescendants() do
        if v8:IsA("ParticleEmitter") then
            v8:Emit(v8:GetAttribute("EmitCount"))
        end
    end
    local v9 = script.Eggs:Clone()
    v_u_1:AddItem(v9, 7)
    v9.CFrame = v3.CFrame * CFrame.new(0, -1.7, 0)
    v9.Parent = workspace
    for _, v10 in v9:GetDescendants() do
        if v10:IsA("ParticleEmitter") then
            v10:Emit(v10:GetAttribute("EmitCount"))
        end
    end
    v3:Destroy()
end