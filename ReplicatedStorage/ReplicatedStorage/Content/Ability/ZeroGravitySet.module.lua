-- Decompiled game.ReplicatedStorage.Content.Ability.ZeroGravitySet

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Zero Gravity Set",
    ["Description"] = "Causes your next set to lineup the perfect spike!",
    ["Rarity"] = v1.Rarity.Type.Legendary,
    ["Type"] = v1.Type.Action,
    ["Conditions"] = {
        ["Charge"] = 200,
        ["Move"] = v1.Move.Sets
    },
    ["Metadata"] = {
        ["Duration"] = 5,
        ["SetImpulse"] = 6.1935,
        ["LookVectorImpulse"] = 3,
        ["GravityMultiplier"] = 0.1
    },
    ["Action"] = require(script.Action),
    ["PostAction"] = require(script.PostAction)
}
return v2(v3)