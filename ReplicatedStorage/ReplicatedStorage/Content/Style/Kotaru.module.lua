-- Decompiled game.ReplicatedStorage.Content.Style.Kotaru

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Bakuri",
    ["OldDisplayName"] = "Butoku",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Description"] = "An outside hitter with a phenomenal spike.",
    ["Number"] = 12,
    ["Multipliers"] = {
        ["Speed"] = 0.88,
        ["SpikePower"] = 1.5,
        ["JumpPower"] = 1.1,
        ["BumpPower"] = 1,
        ["DiveSpeed"] = 0.93,
        ["ServePower"] = 1.2,
        ["SetPower"] = 0.8,
        ["BlockPower"] = 1.15
    }
}
return v2(v3)