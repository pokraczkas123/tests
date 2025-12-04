-- Decompiled game.ReplicatedStorage.Content.Style.Koshi

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Sagumi",
    ["OldDisplayName"] = "Saguwuru",
    ["Rarity"] = v1.Rarity.Type.Common,
    ["Description"] = "A great setter with decent offensive abilities.",
    ["Number"] = 12,
    ["Multipliers"] = {
        ["Speed"] = 0.94,
        ["SpikePower"] = 1.1,
        ["JumpPower"] = 1,
        ["BumpPower"] = 0.9,
        ["DiveSpeed"] = 0.95,
        ["ServePower"] = 1,
        ["SetPower"] = 1.15,
        ["BlockPower"] = 1.1
    }
}
return v2(v3)