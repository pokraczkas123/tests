-- Decompiled game.ReplicatedStorage.Content.ShopBundle

local v_u_1 = game:GetService("RunService"):IsClient()
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = nil
local v_u_4 = require(v2.Packages.Knit)
local v5 = require(v2.Tools.Factory).new(script)
require(v2.Content.Reward)
local v_u_6 = setmetatable({}, {
    ["__index"] = v5
})
function v_u_6.new(p7)
    -- upvalues: (copy) v_u_6, (copy) v_u_1
    local v8 = v_u_6:Create(p7)
    local v9 = v8.Rewards
    assert(v9, "Failed to create ShopBundle. Missing \'Rewards\' field.")
    local v10 = v8.Cost
    assert(v10, "Failed to create ShopBundle. Missing \'Cost\' field.")
    local v11 = v8.MaxPurchases
    assert(v11, "Failed to create ShopBundle. Missing \'MaxPurchases\' field.")
    local v12 = v8.Priority
    assert(v12, "Failed to create ShopBundle. Missing \'Priority\' field.")
    local v_u_13 = v8.isPlayerEligible
    assert(v_u_13, "Failed to create ShopBundle. Missing \'isPlayerEligible\' field.")
    function v8.isPlayerEligible(p14)
        -- upvalues: (ref) v_u_1, (copy) v_u_13
        if v_u_1 then
            error("ShopBundle.isPlayerEligible can only be called on the server.")
        end
        return v_u_13(p14)
    end
    return v8
end
function v_u_6.getOrderedBundles()
    -- upvalues: (copy) v_u_6
    if v_u_6._orderedBundles then
        return v_u_6._orderedBundles
    end
    local v15 = v_u_6:GetAll() or {}
    table.sort(v15, function(p16, p17)
        return p16.Priority > p17.Priority
    end)
    v_u_6._orderedBundles = v15
    return v15
end
function v_u_6.getForPlayer(p18, p19)
    -- upvalues: (copy) v_u_1, (ref) v_u_3, (copy) v_u_4, (copy) v_u_6
    if v_u_1 then
        error("ShopBundle.getForPlayer can only be called on the server.")
    end
    v_u_3 = v_u_3 or v_u_4.GetService("ShopService")
    local v20 = {}
    for _, v21 in v_u_6.getOrderedBundles() do
        if v_u_3:CanPlayerPurchaseShopBundle(p18, v21) then
            table.insert(v20, v21)
        end
        if p19 <= #v20 then
            break
        end
    end
    return v20
end
return v_u_6