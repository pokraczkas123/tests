-- Decompiled game.ReplicatedStorage.Content.Style.Tadashi

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Yachikusai",
    ["OldDisplayName"] = "Yamegushi",
    ["Rarity"] = v1.Rarity.Type.Common,
    ["Description"] = "A decent server with moderate blocking abilities.",
    ["Number"] = 12,
    ["Multipliers"] = {
        ["Speed"] = 1,
        ["SpikePower"] = 0.8,
        ["JumpPower"] = 1.03,
        ["BumpPower"] = 1.1,
        ["DiveSpeed"] = 1,
        ["ServePower"] = 1.1,
        ["SetPower"] = 0.8,
        ["BlockPower"] = 1.2
    }
}
return v2(v3)