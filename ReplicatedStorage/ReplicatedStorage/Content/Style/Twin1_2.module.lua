-- Decompiled game.ReplicatedStorage.Content.Style.Twin1_2

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
    ["Multipliers"] = require(script.Parent.Twin1.Multipliers),
    ["Metadata"] = {
        ["Special"] = require(script.Parent.Twin1.Special),
        ["Statistics"] = require(script.Parent.Twin1.Statistics),
        ["Animations"] = require(script.Parent.Twin1.Animations),
        ["Timestamp"] = DateTime.fromUniversalTime(2025, 10, 18, 15, 30, 0).UnixTimestamp
    }
}
return v2(v3)