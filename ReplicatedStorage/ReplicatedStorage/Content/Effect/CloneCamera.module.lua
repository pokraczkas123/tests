-- Decompiled game.ReplicatedStorage.Content.Effect.CloneCamera

local v1 = require(script.Parent)
local v_u_2 = require(script.CloneCamera)
return v1.new({
    ["Name"] = script.Name,
    ["Play"] = function(_, p3)
        -- upvalues: (copy) v_u_2
        if p3.Clone then
            v_u_2.add(p3.Clone)
        else
            warn("CloneCamera effect requires a Clone property!")
        end
    end
})