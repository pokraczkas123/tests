-- Decompiled game.ReplicatedStorage.Content.Style.Hajime

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Imaezi",
    ["OldDisplayName"] = "Iwaezeni",
    ["Rarity"] = v1.Rarity.Type.Rare,
    ["Description"] = "An outside hitter with a good spike.",
    ["Number"] = 4,
    ["Multipliers"] = {
        ["Speed"] = 0.93,
        ["SpikePower"] = 1.2,
        ["JumpPower"] = 1.05,
        ["BumpPower"] = 0.85,
        ["DiveSpeed"] = 0.95,
        ["ServePower"] = 1,
        ["SetPower"] = 1,
        ["BlockPower"] = 0.8
    }
}
return v2(v3)