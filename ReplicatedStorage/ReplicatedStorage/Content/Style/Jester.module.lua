-- Decompiled game.ReplicatedStorage.Content.Style.Jester

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Special)
local v4 = v2.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Jinko",
    ["Rarity"] = v2.Rarity.Type.Secret,
    ["Description"] = "",
    ["Number"] = 10,
    ["Multipliers"] = {
        ["Speed"] = 0.93,
        ["SpikePower"] = 1.5,
        ["JumpPower"] = 1.1,
        ["BumpPower"] = 1,
        ["DiveSpeed"] = 1,
        ["ServePower"] = 0.9,
        ["SetPower"] = 0.95,
        ["TiltPower"] = 1.3,
        ["BlockPower"] = 1
    }
}
local v6 = {
    ["Special"] = v3.get("Jester", {
        ["CurveAcceleration"] = NumberRange.new(10, 100)
    }),
    ["Statistics"] = require(script.Statistics),
    ["Animations"] = require(script.Animations),
    ["Nametag"] = require(script.Nametag),
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 8, 30, 15, 30, 0).UnixTimestamp
}
v5.Metadata = v6
return v4(v5)