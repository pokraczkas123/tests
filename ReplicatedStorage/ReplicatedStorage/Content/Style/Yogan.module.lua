-- Decompiled game.ReplicatedStorage.Content.Style.Yogan

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Yogan",
    ["Rarity"] = v1.Rarity.Type.Secret,
    ["Description"] = "An outside hitter with a phenomenal spike.",
    ["Number"] = 9,
    ["Multipliers"] = {
        ["Speed"] = 0.99,
        ["SpikePower"] = 1.34,
        ["JumpPower"] = 1.1,
        ["BumpPower"] = 0.97,
        ["DiveSpeed"] = 1.09,
        ["ServePower"] = 1.1,
        ["SetPower"] = 1.04,
        ["BlockPower"] = 1.02
    },
    ["Metadata"] = {
        ["MasteryId"] = "Yogan",
        ["Special"] = require(script.Special),
        ["Statistics"] = require(script.Statistics),
        ["Animations"] = require(script.Animations),
        ["Nametag"] = require(script.Nametag),
        ["Timestamp"] = DateTime.fromUniversalTime(2025, 9, 27, 15, 30, 0).UnixTimestamp,
        ["BacktiltInfluence"] = 35
    }
}
return v2(v3)