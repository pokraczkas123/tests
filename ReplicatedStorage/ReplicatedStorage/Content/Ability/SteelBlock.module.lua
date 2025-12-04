-- Decompiled game.ReplicatedStorage.Content.Ability.SteelBlock

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Steel Block",
    ["Description"] = "Causes your next block to push the ball downwards!",
    ["Rarity"] = v1.Rarity.Type.Legendary,
    ["Type"] = v1.Type.Action,
    ["Conditions"] = {
        ["Charge"] = 125,
        ["Move"] = v1.Move.Block
    },
    ["PostAction"] = require(script.PostAction)
}
return v2(v3)