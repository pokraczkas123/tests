-- Decompiled game.ReplicatedStorage.Content.Style.Hakka

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Hakka",
    ["Rarity"] = v1.Rarity.Type.Ultra,
    ["Description"] = "An opposite hitter with great receiving abilities.",
    ["Number"] = 11,
    ["Multipliers"] = {
        ["Speed"] = 1.125,
        ["SpikePower"] = 1.18,
        ["JumpPower"] = 1.1,
        ["BumpPower"] = 0.7,
        ["DiveSpeed"] = 1.088,
        ["ServePower"] = 1.085,
        ["SetPower"] = 1.4,
        ["BlockPower"] = 0.7
    },
    ["Metadata"] = {
        ["MasteryId"] = "Hakka",
        ["Special"] = require(script.Special),
        ["Statistics"] = require(script.Statistics),
        ["Animations"] = require(script.Animations),
        ["Slot"] = require(script.Slot),
        ["Timestamp"] = DateTime.fromUniversalTime(2025, 11, 29, 15, 30, 0).UnixTimestamp
    }
}
return v2(v3)