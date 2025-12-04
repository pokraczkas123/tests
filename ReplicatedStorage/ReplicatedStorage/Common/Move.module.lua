-- Decompiled game.ReplicatedStorage.Common.Move

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Moves)
local v_u_3 = require(v1.Tools.Logger).new(script.Name)
local v_u_16 = {
    ["Type"] = v2,
    ["matchesSets"] = function(p4, p5)
        -- upvalues: (copy) v_u_16
        local v6 = p4 == v_u_16.Type.Set and true or p4 == v_u_16.Type.JumpSet
        return p5 == v_u_16.Type.Sets and v6 and true or false
    end,
    ["matchesServe"] = function(p7, p8, p9)
        -- upvalues: (copy) v_u_16
        local v10 = p7 == v_u_16.Type.Spike and true or p7 == v_u_16.Type.Bump
        return p8 == v_u_16.Type.Serves and p9 and v10 and true or p8 == v_u_16.Type.Serves and (p7 == v_u_16.Type.ServeSpike or p7 == v_u_16.Type.ServeBump) and true or p8 == v_u_16.Type.ServeSpike and p9 and p7 == v_u_16.Type.Spike and true or p8 == v_u_16.Type.ServeBump and p9 and p7 == v_u_16.Type.Bump and true or false
    end,
    ["matchesAerial"] = function(p11, p12)
        -- upvalues: (copy) v_u_16
        if p12 == v_u_16.Type.Aerial then
            return (p11 == v_u_16.Type.JumpSet or p11 == v_u_16.Type.Spike) and true or p11 == v_u_16.Type.Block
        else
            return false
        end
    end,
    ["matches"] = function(p13, p14, p15)
        -- upvalues: (copy) v_u_16, (copy) v_u_3
        if p14 == v_u_16.Type.None then
            return false
        end
        if v_u_16.Type[p13] then
            return p14 == v_u_16.Type.All and true or p14 == p13 and true or v_u_16.matchesSets(p13, p14) and true or v_u_16.matchesServe(p13, p14, p15) and true or v_u_16.matchesAerial(p13, p14) and true or false
        end
        v_u_3:Warn((("Unrecognized move: %*"):format(p13)))
        return false
    end
}
return v_u_16