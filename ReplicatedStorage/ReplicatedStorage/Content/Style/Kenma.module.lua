-- Decompiled game.ReplicatedStorage.Content.Style.Kenma

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Kyoshin",
    ["OldDisplayName"] = "Kosumi",
    ["Rarity"] = v1.Rarity.Type.Legendary,
    ["Description"] = "An exceptional setter with great receiving abilities.",
    ["Number"] = 12,
    ["Multipliers"] = {
        ["Speed"] = 1,
        ["SpikePower"] = 0.8,
        ["JumpPower"] = 1.05,
        ["BumpPower"] = 1.6,
        ["DiveSpeed"] = 1.35,
        ["ServePower"] = 0.8,
        ["SetPower"] = 1.3,
        ["BlockPower"] = 1.2
    }
}
return v2(v3)