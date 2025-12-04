-- Decompiled game.ReplicatedStorage.Content.Ability.BoomJump

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Boom Jump",
    ["Description"] = "Causes you to jump super high!",
    ["Rarity"] = v1.Rarity.Type.Rare,
    ["Type"] = v1.Type.Activation,
    ["Conditions"] = {
        ["Charge"] = 100,
        ["TimeActive"] = 5,
        ["NeedsGround"] = true
    },
    ["Metadata"] = {
        ["JumpMultiplier"] = 0.3,
        ["EventFire"] = "BoomJump"
    }
}
return v2(v3)