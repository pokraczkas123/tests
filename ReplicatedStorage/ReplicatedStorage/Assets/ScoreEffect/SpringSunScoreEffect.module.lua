-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.SpringSunScoreEffect

game:GetService("TweenService")
local v_u_1 = game:GetService("Debris")
return function(p2)
    -- upvalues: (copy) v_u_1
    local v3 = CFrame.new(p2)
    local v4 = script.FlowerEmit:Clone()
    v_u_1:AddItem(v4, 7)
    v4.CFrame = v3 * CFrame.new(0, 3, 0)
    v4.Parent = workspace
    for _, v5 in v4:GetDescendants() do
        if v5:IsA("ParticleEmitter") then
            v5:Emit(v5:GetAttribute("EmitCount"))
        end
    end
    task.wait(0.2)
    local v6 = script.FlowerEnable:Clone()
    v_u_1:AddItem(v6, 7)
    v6.CFrame = v3 * CFrame.new(0, -2.5, 0)
    v6.Parent = workspace
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
    task.wait(1)
    v4:Destroy()
    v6:Destroy()
end