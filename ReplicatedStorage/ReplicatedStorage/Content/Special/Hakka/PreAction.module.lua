-- Decompiled game.ReplicatedStorage.Content.Special.Hakka.PreAction

local v1 = game:GetService("ReplicatedStorage")
require(v1.Common.Context)
local v_u_2 = require(v1.Common.State)
local v_u_3 = require(v1.Common.Move)
require(script.Parent.Parent)
return function(p4, p5)
    -- upvalues: (copy) v_u_2, (copy) v_u_3
    p5.State.Events.SpecialActive = true
    local v6 = p4.Metadata.ClonePowerMasteryMap[p5.Move]
    if not v6 then
        return true
    end
    local v7 = v_u_2.get(p5.Player, v_u_2.Id.Mastery, "Level", 0)
    local v8 = v6[v7]
    if not v8 then
        for v9 = v7 - 1, 1, -1 do
            v8 = v6[v9]
            if v8 then
                break
            end
        end
    end
    p5.State.Control.Alpha = v8 or p5.State.Control.Alpha
    local v10 = p5.SpecialProps
    local v11
    if v8 and v_u_3.matches(p5.Move, v_u_3.Type.Spike) then
        v11 = p4.Metadata.ClonePowerBackTilt
    else
        v11 = nil
    end
    v10.BacktiltInfluence = v11
    return true
end