-- Decompiled game.ReplicatedStorage.Content.Style.Twin1

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Akuto",
    ["OldDisplayName"] = "Atasumi",
    ["DisplayNameOverride"] = "The Twins",
    ["Rarity"] = v1.Rarity.Type.Secret,
    ["Description"] = "",
    ["Number"] = 1,
    ["Multipliers"] = require(script.Multipliers),
    ["Metadata"] = {
        ["Special"] = require(script.Special),
        ["Statistics"] = require(script.Statistics),
        ["Animations"] = require(script.Animations),
        ["Timestamp"] = DateTime.fromUniversalTime(2025, 6, 7, 15, 30, 0).UnixTimestamp,
        ["IsOriginal"] = true
    }
}
return v2(v3)