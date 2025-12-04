-- Decompiled game.ReplicatedStorage.Content.Ability.Moonball

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Moonball",
    ["Description"] = "Causes your next bump to soar past the enemy spikers!",
    ["Rarity"] = v1.Rarity.Type.Rare,
    ["Type"] = v1.Type.Action,
    ["Conditions"] = {
        ["Charge"] = 175,
        ["Move"] = v1.Move.Bump
    },
    ["Action"] = require(script.Action)
}
return v2(v3)