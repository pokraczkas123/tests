-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.FlameScoreEffect

local v_u_1 = game:GetService("Debris")
return function(p2)
    -- upvalues: (copy) v_u_1
    local v3 = script.Emit:Clone()
    v_u_1:AddItem(v3, 5)
    v3.CFrame = CFrame.new(p2)
    v3.Parent = workspace.Effects
    for _, v4 in v3:GetDescendants() do
        if v4:IsA("ParticleEmitter") then
            v4:Emit(v4:GetAttribute("EmitCount"))
        end
    end
    task.wait(0.2)
    local v5 = script.Flame:Clone()
    v_u_1:AddItem(v5, 8)
    v5.CFrame = CFrame.new(p2) * CFrame.new(0, -2.5, 0)
    v5.Parent = workspace.Effects
    for _, v6 in v5:GetDescendants() do
        if v6:IsA("ParticleEmitter") then
            v6.Enabled = true
        end
    end
    task.wait(2)
    for _, v7 in v5:GetDescendants() do
        if v7:IsA("ParticleEmitter") then
            v7.Enabled = false
        end
    end
end