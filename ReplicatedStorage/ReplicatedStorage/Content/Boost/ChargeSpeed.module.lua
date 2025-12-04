-- Decompiled game.ReplicatedStorage.Content.Boost.ChargeSpeed

local v1 = game:GetService("ReplicatedStorage").Packages
local v_u_2 = require(v1.Knit)
local v3 = require(script.Parent)
return v3.new({
    ["Type"] = v3.Type.Multiplier,
    ["Id"] = script.Name,
    ["DisplayName"] = "Charge Speed Boost",
    ["ItemId"] = "AbilityPotionConsumable",
    ["Start"] = function(p4, p5)
        -- upvalues: (copy) v_u_2
        v_u_2.GetService("MultiplierService"):Set(p4, "AbilityCharge", "Boost", p5.Value)
    end,
    ["End"] = function(p6)
        -- upvalues: (copy) v_u_2
        v_u_2.GetService("MultiplierService"):Remove(p6, "AbilityCharge", "Boost")
    end
})