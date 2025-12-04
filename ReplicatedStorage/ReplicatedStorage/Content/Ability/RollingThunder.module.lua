-- Decompiled game.ReplicatedStorage.Content.Ability.RollingThunder

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Rolling Thunder",
    ["Description"] = "Instantly perform a boosted dive!",
    ["Rarity"] = v1.Rarity.Type.Common,
    ["Type"] = v1.Type.Activation,
    ["Conditions"] = {
        ["Charge"] = 50,
        ["TimeActive"] = 2
    },
    ["Metadata"] = {
        ["EventFire"] = "RollingThunder"
    },
    ["OnActivation"] = require(script.OnActivation)
}
return v2(v3)