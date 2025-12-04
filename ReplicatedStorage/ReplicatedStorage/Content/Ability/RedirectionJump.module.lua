-- Decompiled game.ReplicatedStorage.Content.Ability.RedirectionJump

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Redirection Jump",
    ["Description"] = "Jumps and allows you to change your angle mid-air!",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Type"] = v1.Type.Activation,
    ["Conditions"] = {
        ["Charge"] = 200
    },
    ["Metadata"] = {
        ["EventFire"] = "RedirectionJump"
    },
    ["OnActivation"] = require(script.OnActivation)
}
return v2(v3)