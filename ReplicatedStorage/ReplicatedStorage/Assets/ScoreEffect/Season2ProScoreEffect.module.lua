-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.Season2ProScoreEffect

game:GetService("TweenService")
local v_u_1 = game:GetService("Debris")
return function(p2)
    -- upvalues: (copy) v_u_1
    local v3 = CFrame.new(p2)
    local v4 = script.VFX:Clone()
    v_u_1:AddItem(v4, 7)
    v4.CFrame = v3 * CFrame.new(0, 0, 0)
    v4.Parent = workspace
    for _, v_u_5 in pairs(v4:GetDescendants()) do
        if v_u_5:IsA("ParticleEmitter") then
            local v6 = v_u_5:GetAttribute("EmitDelay")
            local v_u_7 = v_u_5:GetAttribute("EmitCount")
            if v6 then
                task.delay(v6, function()
                    -- upvalues: (copy) v_u_5, (copy) v_u_7
                    v_u_5:Emit(v_u_7)
                end)
            else
                v_u_5:Emit(v_u_7)
            end
        end
    end
end