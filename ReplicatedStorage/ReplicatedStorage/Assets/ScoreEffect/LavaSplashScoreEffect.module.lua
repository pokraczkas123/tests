-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.LavaSplashScoreEffect

game:GetService("TweenService")
local v_u_1 = game:GetService("Debris")
return function(p2, p3)
    -- upvalues: (copy) v_u_1
    local _ = p3.Humanoid
    local _ = p3.HumanoidRootPart
    local _ = p3.UpperTorso
    local v4 = script.LavaImpact:Clone()
    v_u_1:AddItem(v4, 5)
    v4.CFrame = CFrame.new(p2)
    v4.Parent = workspace
    for _, v5 in v4:GetDescendants() do
        if v5:IsA("ParticleEmitter") then
            v5:Emit(v5:GetAttribute("EmitCount"))
        end
    end
    task.wait(5)
    v4:Destroy()
end