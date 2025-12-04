-- Decompiled game.ReplicatedStorage.Content.Ability.SuperSprint

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Super Sprint",
    ["Description"] = "Increases your movement speed for a while!",
    ["Rarity"] = v1.Rarity.Type.Common,
    ["Type"] = v1.Type.Time,
    ["Conditions"] = {
        ["Charge"] = 100,
        ["TimeActive"] = 4
    },
    ["Metadata"] = {
        ["SpeedMultiplier"] = 1.7
    },
    ["OnActivation"] = require(script.OnActivation),
    ["OnDeactivation"] = require(script.OnDeactivation)
}
return v2(v3)