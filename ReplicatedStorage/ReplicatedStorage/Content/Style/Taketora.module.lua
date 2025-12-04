-- Decompiled game.ReplicatedStorage.Content.Style.Taketora

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Yomosuke",
    ["OldDisplayName"] = "Yomomute",
    ["Rarity"] = v1.Rarity.Type.Legendary,
    ["Description"] = "A great outside hitter with excellent diving speed and bumping power.",
    ["Number"] = 10,
    ["Multipliers"] = {
        ["Speed"] = 1,
        ["SpikePower"] = 1.2,
        ["JumpPower"] = 1.05,
        ["BumpPower"] = 1.45,
        ["DiveSpeed"] = 1.35,
        ["ServePower"] = 0.85,
        ["SetPower"] = 0.85,
        ["BlockPower"] = 0.7
    }
}
return v2(v3)