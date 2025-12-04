-- Decompiled game.ReplicatedStorage.Content.Style.Asahi

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Azmei",
    ["OldDisplayName"] = "Azamena",
    ["Rarity"] = v1.Rarity.Type.Legendary,
    ["Description"] = "An outside hitter with an exceptional serve.",
    ["Number"] = 10,
    ["Multipliers"] = {
        ["Speed"] = 0.93,
        ["SpikePower"] = 1.4,
        ["JumpPower"] = 1.05,
        ["BumpPower"] = 1,
        ["DiveSpeed"] = 0.95,
        ["ServePower"] = 1.2,
        ["SetPower"] = 0.8,
        ["BlockPower"] = 0.8
    }
}
return v2(v3)