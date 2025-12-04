-- Decompiled game.ReplicatedStorage.Content.Style.TimeskipToru2

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Timeskip Okazu",
    ["OldDisplayName"] = "Timeskip Oigawa",
    ["Rarity"] = v1.Rarity.Type.Secret,
    ["Description"] = "A well rounded middle blocking player.",
    ["Number"] = 1,
    ["Multipliers"] = require(script.Parent.TimeskipToru.Multipliers),
    ["Metadata"] = {
        ["MasteryId"] = "TimeskipToru",
        ["Special"] = require(script.Parent.TimeskipToru.Special),
        ["Statistics"] = require(script.Parent.TimeskipToru.Statistics),
        ["Nametag"] = require(script.Parent.TimeskipToru.Nametag),
        ["Timestamp"] = DateTime.fromUniversalTime(2025, 11, 15, 15, 30, 0).UnixTimestamp
    }
}
return v2(v3)