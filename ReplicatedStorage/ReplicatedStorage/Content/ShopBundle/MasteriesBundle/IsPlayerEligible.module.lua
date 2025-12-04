-- Decompiled game.ReplicatedStorage.Content.ShopBundle.MasteriesBundle.IsPlayerEligible

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = nil
local v_u_3 = require(v1.Packages.Knit)
return function(p4)
    -- upvalues: (ref) v_u_2, (copy) v_u_3
    v_u_2 = v_u_2 or v_u_3.GetService("ShopService")
    return v_u_2:HasPlayerPurchasedAnyBundle(p4)
end