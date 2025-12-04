-- Decompiled game.ReplicatedStorage.Content.Style.Lev

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Hakochi",
    ["OldDisplayName"] = "Haibo",
    ["Rarity"] = v1.Rarity.Type.Common,
    ["Description"] = "A middle blocker with decent jumping abilities.",
    ["Number"] = 11,
    ["Multipliers"] = {
        ["Speed"] = 0.88,
        ["SpikePower"] = 0.9,
        ["JumpPower"] = 1.05,
        ["BumpPower"] = 1,
        ["DiveSpeed"] = 0.95,
        ["ServePower"] = 0.8,
        ["SetPower"] = 1,
        ["BlockPower"] = 1.3
    }
}
return v2(v3)