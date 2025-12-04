-- Decompiled game.ReplicatedStorage.Content.Style.Ryunosuke

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Tonkura",
    ["OldDisplayName"] = "Tonoko",
    ["Rarity"] = v1.Rarity.Type.Common,
    ["Description"] = "An outside hitter with a decent spike.",
    ["Number"] = 9,
    ["Multipliers"] = {
        ["Speed"] = 0.92,
        ["SpikePower"] = 1.3,
        ["JumpPower"] = 1.03,
        ["BumpPower"] = 1,
        ["DiveSpeed"] = 0.95,
        ["ServePower"] = 0.85,
        ["SetPower"] = 0.8,
        ["BlockPower"] = 0.8
    }
}
return v2(v3)