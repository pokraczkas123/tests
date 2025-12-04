-- Decompiled game.ReplicatedStorage.Content.Style.Daichi

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Sazuroku",
    ["OldDisplayName"] = "Sagafura",
    ["Rarity"] = v1.Rarity.Type.Legendary,
    ["Description"] = "An opposite hitter with great receiving abilities.",
    ["Number"] = 11,
    ["Multipliers"] = {
        ["Speed"] = 1.2,
        ["SpikePower"] = 0.75,
        ["JumpPower"] = 1,
        ["BumpPower"] = 1.6,
        ["DiveSpeed"] = 1.3,
        ["ServePower"] = 0.8,
        ["SetPower"] = 1.2,
        ["BlockPower"] = 1.2
    }
}
return v2(v3)