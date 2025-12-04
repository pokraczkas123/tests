-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.SixSevenScoreEffect

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
end