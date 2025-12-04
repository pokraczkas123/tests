-- Decompiled game.ReplicatedStorage.Assets.Effects.RageAura

local v_u_1 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local v_u_2 = require(v_u_1.Tools.Sound)
return function(p3, p4)
    -- upvalues: (copy) v_u_2, (copy) v_u_1
    local v5 = p3:GetAttribute("MasteryCompleted") == "Yogan"
    local v6 = p3:FindFirstChild("Head")
    if v6 then
        local v7 = v6:FindFirstChild("RageVFX")
        if p4.State or v7 then
            if v5 and v7 and not v7:GetAttribute("IsMastery") then
                v7:Destroy()
                v7 = nil
            end
            if p4.State then
                v_u_2.fromName("RageActivation")({
                    ["Parent"] = v6
                })
            end
            if p4.State and not v7 then
                local v8 = v_u_1.Assets.Effects[("%*Rage"):format(v5 and "Blue" or "")].Attachment:Clone()
                v8.Name = "RageVFX"
                v8.Parent = v6
            else
                for _, v9 in pairs(v6:GetDescendants()) do
                    if v9:IsA("ParticleEmitter") or v9:IsA("Trail") then
                        v9.Enabled = p4.State
                    end
                end
            end
        else
            return
        end
    else
        return
    end
end