-- Decompiled game.ReplicatedStorage.Content.Boost.BunnyPhysics

local v1 = game:GetService("ReplicatedStorage").Packages
local v_u_2 = require(v1.Knit)
local v3 = require(script.Parent)
return v3.new({
    ["Type"] = v3.Type.Physics,
    ["Id"] = script.Name,
    ["ItemId"] = "BouncyPotionConsumable",
    ["DisplayName"] = "Bunny Physics Boost",
    ["Start"] = function(p4, _)
        -- upvalues: (copy) v_u_2
        local v5 = v_u_2.GetService("BoostService")
        local v6 = v_u_2.GetService("MultiplierService")
        v5.Client.Gravity:Fire(p4, 100)
        v6:Set(p4, "JumpPower", "BunnyBoost", 1.75)
    end,
    ["End"] = function(p7)
        -- upvalues: (copy) v_u_2
        local v8 = v_u_2.GetService("BoostService")
        local v9 = v_u_2.GetService("MultiplierService")
        v8.Client.Gravity:Fire(p7, workspace.Gravity)
        v9:Remove(p7, "JumpPower", "BunnyBoost")
    end
})