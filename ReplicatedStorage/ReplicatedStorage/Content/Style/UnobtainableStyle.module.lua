-- Decompiled game.ReplicatedStorage.Content.Style.UnobtainableStyle

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Unobtainable",
    ["Rarity"] = v1.Rarity.Type.Common,
    ["Description"] = "An exceptional setter with great serving abilities.",
    ["Number"] = 9,
    ["Multipliers"] = {
        ["BlockPower"] = 1.5
    },
    ["Metadata"] = {
        ["Timestamp"] = DateTime.fromUniversalTime(2025, 1, 19, 15, 30, 0).UnixTimestamp
    }
}
return v2(v3)