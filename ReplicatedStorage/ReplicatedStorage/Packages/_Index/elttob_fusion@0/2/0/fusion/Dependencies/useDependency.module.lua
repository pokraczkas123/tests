-- Decompiled game.ReplicatedStorage.Packages._Index.elttob_fusion@0.2.0.fusion.Dependencies.useDependency

local v1 = script.Parent.Parent
require(v1.PubTypes)
local v_u_2 = require(v1.Dependencies.sharedState)
local v_u_3 = v_u_2.initialisedStack
return function(p4)
    -- upvalues: (copy) v_u_2, (copy) v_u_3
    local v5 = v_u_2.dependencySet
    if v5 ~= nil then
        local v6 = v_u_2.initialisedStackSize
        if v6 > 0 and v_u_3[v6][p4] ~= nil then
            return
        end
        v5[p4] = true
    end
end