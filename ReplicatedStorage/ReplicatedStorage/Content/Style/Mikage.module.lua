-- Decompiled game.ReplicatedStorage.Content.Style.Mikage

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Mikage",
    ["Rarity"] = v1.Rarity.Type.Secret,
    ["Description"] = "An outside hitter with a phenomenal spike.",
    ["Number"] = 9,
    ["Multipliers"] = {
        ["Speed"] = 0.93,
        ["SpikePower"] = 1.35,
        ["JumpPower"] = 1.1,
        ["BumpPower"] = 0.7,
        ["DiveSpeed"] = 0.93,
        ["ServePower"] = 1.1,
        ["SetPower"] = 0.8,
        ["BlockPower"] = 1.5
    },
    ["Metadata"] = {
        ["Special"] = require(script.Special),
        ["Statistics"] = require(script.Statistics),
        ["Animations"] = require(script.Animations),
        ["Nametag"] = require(script.Nametag),
        ["Timestamp"] = DateTime.fromUniversalTime(2025, 8, 9, 15, 30, 0).UnixTimestamp
    }
}
return v2(v3)