-- Decompiled game.ReplicatedStorage.Content.Style.TimeskipToru

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Timeskip Okazu",
    ["OldDisplayName"] = "Timeskip Oigawa",
    ["Rarity"] = v1.Rarity.Type.Secret,
    ["Description"] = "A well rounded middle blocking player.",
    ["Number"] = 1,
    ["Multipliers"] = require(script.Multipliers),
    ["Metadata"] = {
        ["MasteryId"] = "TimeskipToru",
        ["Special"] = require(script.Special),
        ["Statistics"] = require(script.Statistics),
        ["Nametag"] = require(script.Nametag),
        ["Timestamp"] = DateTime.fromUniversalTime(2025, 5, 31, 15, 30, 0).UnixTimestamp,
        ["IsOriginal"] = true
    }
}
return v2(v3)