-- Decompiled game.ReplicatedStorage.Content.Style.Wakatoshi

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Uchikai",
    ["OldDisplayName"] = "Uchishima",
    ["Rarity"] = v1.Rarity.Type.Legendary,
    ["Description"] = "A powerful opposite hitter with a very strong spike.",
    ["Number"] = 1,
    ["Multipliers"] = {
        ["Speed"] = 1,
        ["SpikePower"] = 1.5,
        ["JumpPower"] = 1.05,
        ["BumpPower"] = 0.9,
        ["DiveSpeed"] = 1,
        ["ServePower"] = 1,
        ["SetPower"] = 0.9,
        ["BlockPower"] = 1
    }
}
return v2(v3)