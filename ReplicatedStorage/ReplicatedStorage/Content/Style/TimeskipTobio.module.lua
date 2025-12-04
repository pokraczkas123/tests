-- Decompiled game.ReplicatedStorage.Content.Style.TimeskipTobio

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Timeskip Kyamo",
    ["OldDisplayName"] = "Timeskip Kagayomo",
    ["Rarity"] = v1.Rarity.Type.Secret,
    ["Description"] = "An exceptional setter with great serving abilities.",
    ["Number"] = 9,
    ["Multipliers"] = require(script.Multipliers),
    ["Metadata"] = {
        ["Special"] = require(script.Special),
        ["Statistics"] = require(script.Statistics),
        ["Animations"] = require(script.Animations),
        ["Nametag"] = require(script.Nametag),
        ["Timestamp"] = DateTime.fromUniversalTime(2025, 4, 13, 15, 30, 0).UnixTimestamp,
        ["IsOriginal"] = true
    }
}
return v2(v3)