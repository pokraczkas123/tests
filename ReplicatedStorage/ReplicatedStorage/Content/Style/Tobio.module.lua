-- Decompiled game.ReplicatedStorage.Content.Style.Tobio

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Kyamo",
    ["OldDisplayName"] = "Kagayomo",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Description"] = "An exceptional setter with great serving abilities.",
    ["Number"] = 9,
    ["Multipliers"] = {
        ["Speed"] = 1.1,
        ["SpikePower"] = 1,
        ["JumpPower"] = 1.08,
        ["BumpPower"] = 0.9,
        ["DiveSpeed"] = 1.2,
        ["ServePower"] = 1.2,
        ["SetPower"] = 1.4,
        ["BlockPower"] = 1.3
    }
}
return v2(v3)