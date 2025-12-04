-- Decompiled game.ReplicatedStorage.Content.Style.TimeskipShoyo

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Timeskip Hinto",
    ["OldDisplayName"] = "Timeskip Hinoto",
    ["Rarity"] = v1.Rarity.Type.Secret,
    ["Description"] = "A well rounded middle blocking player.",
    ["Number"] = 10,
    ["Multipliers"] = require(script.Multipliers),
    ["Metadata"] = {
        ["Special"] = require(script.Special),
        ["Statistics"] = require(script.Statistics),
        ["Animations"] = require(script.Animations),
        ["Nametag"] = require(script.Nametag),
        ["Timestamp"] = DateTime.fromUniversalTime(2025, 3, 22, 15, 30, 0).UnixTimestamp,
        ["IsOriginal"] = true
    }
}
return v2(v3)