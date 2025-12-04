-- Decompiled game.ReplicatedStorage.Content.Style.Hidari

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Special)
local v4 = v2.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Hidari",
    ["Rarity"] = v2.Rarity.Type.Secret,
    ["Description"] = "",
    ["Number"] = 4,
    ["Multipliers"] = {
        ["Speed"] = 0.93,
        ["SpikePower"] = 1,
        ["JumpPower"] = 1.1,
        ["BumpPower"] = 1,
        ["DiveSpeed"] = 1,
        ["ServePower"] = 0.7,
        ["SetPower"] = 0.95,
        ["BlockPower"] = 1
    }
}
local v6 = {
    ["MasteryId"] = "Hidari",
    ["Special"] = v3.get("Hidari", {
        ["SpikePower"] = 0.6,
        ["ServeSpikePower"] = 0.55,
        ["SpikeGravityMultiplier"] = 3
    }),
    ["Statistics"] = require(script.Statistics),
    ["Animations"] = require(script.Animations),
    ["Nametag"] = require(script.Nametag),
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 10, 25, 15, 30, 0).UnixTimestamp
}
v5.Metadata = v6
return v4(v5)