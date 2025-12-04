-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.CryoFlareScoreEffect

game:GetService("TweenService")
return function(p1, p2, p3)
    local _ = p2.Humanoid
    local _ = p2.HumanoidRootPart
    local _ = p2.UpperTorso
    local v4 = script.WaterExplosion:Clone()
    v4.CFrame = CFrame.new(p1) * CFrame.new(0, 5.5, 0)
    v4.Parent = workspace
    p3:GiveTask(v4)
    for _, v5 in v4:GetDescendants() do
        if v5:IsA("ParticleEmitter") then
            v5:Emit(v5:GetAttribute("EmitCount"))
        end
    end
    task.wait(0.2)
    local v6 = script.FlameENbale:Clone()
    v6.CFrame = CFrame.new(p1) * CFrame.new(0, 3.5, 0)
    v6.Parent = workspace
    p3:GiveTask(v6)
    for _, v7 in v6:GetDescendants() do
        if v7:IsA("ParticleEmitter") then
            v7.Enabled = true
        end
    end
    task.wait(2)
    for _, v8 in v6:GetDescendants() do
        if v8:IsA("ParticleEmitter") then
            v8.Enabled = false
        end
    end
    task.wait(5)
end