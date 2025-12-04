-- Decompiled game.ReplicatedStorage.Packages._Index.elttob_fusion@0.2.0.fusion.State.unwrap

local v1 = script.Parent.Parent
require(v1.PubTypes)
local v_u_2 = require(v1.Utility.xtypeof)
return function(p3, p4)
    -- upvalues: (copy) v_u_2
    if v_u_2(p3) == "State" then
        return p3:get(p4)
    else
        return p3
    end
end