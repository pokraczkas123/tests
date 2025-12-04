-- Decompiled game.ReplicatedStorage.Tools.FusionControls

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Packages.Fusion).Value
return function(p3)
    -- upvalues: (copy) v_u_2
    local v_u_4 = {}
    for v5, v6 in p3.controls do
        v_u_4[v5] = v_u_2(v6)
    end
    return v_u_4, p3.subscribe(function(p7, _)
        -- upvalues: (copy) v_u_4
        for v8, v9 in p7 do
            v_u_4[v8]:set(v9)
        end
    end)
end