-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.EggHatchScoreEffect

game:GetService("TweenService")
local v_u_1 = game:GetService("Debris")
return function(p2)
    -- upvalues: (copy) v_u_1
    local v3 = CFrame.new(p2)
    local v4 = script.EggMesh:Clone()
    v_u_1:AddItem(v4, 7)
    v4.CFrame = v3 * CFrame.new(0, 2, -3)
    v4.Parent = workspace
    local v5 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v4.Transparency = 0
    v4.Size = Vector3.new(2, 2.606, 2)
    local v6 = script.VFX1:Clone()
    v_u_1:AddItem(v6, 7)
    v6.CFrame = v4.CFrame
    v6.Parent = workspace
    for _, v7 in v6:GetDescendants() do
        if v7:IsA("ParticleEmitter") then
            v7:Emit(v7:GetAttribute("EmitCount"))
        end
    end
    game:GetService("TweenService"):Create(v4, v5, {
        ["Size"] = Vector3.new(8, 10.424, 8),
        ["Transparency"] = 0
    }):Play()
    task.wait(1)
    local v8 = script.VFX:Clone()
    v_u_1:AddItem(v8, 7)
    v8.CFrame = v4.CFrame * CFrame.new(0, 0, 0)
    v8.Parent = workspace
    for _, v9 in v8:GetDescendants() do
        if v9:IsA("ParticleEmitter") then
            v9:Emit(v9:GetAttribute("EmitCount"))
        end
    end
    local v10 = script.Eggs:Clone()
    v_u_1:AddItem(v10, 7)
    v10.CFrame = v4.CFrame * CFrame.new(0, -1.7, 0)
    v10.Parent = workspace
    for _, v11 in v10:GetDescendants() do
        if v11:IsA("ParticleEmitter") then
            v11:Emit(v11:GetAttribute("EmitCount"))
        end
    end
    v4:Destroy()
end