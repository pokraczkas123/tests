-- Decompiled game.ReplicatedStorage.Content.ShopBundle.SuperStyleLuckBundle.IsPlayerEligible

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = nil
local v_u_3 = require(v1.Packages.Knit)
return function(p4)
    -- upvalues: (ref) v_u_2, (copy) v_u_3
    v_u_2 = v_u_2 or v_u_3.GetService("DataService")
    local v5 = v_u_2:Get(p4, "Purchases")
    if v5 then
        v5 = v5.RobuxSpent > 10000
    end
    return v5
end