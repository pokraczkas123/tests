-- Decompiled game.ReplicatedStorage.Content.Style.TimeskipShoyo2

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Timeskip Hinto",
    ["OldDisplayName"] = "Timeskip Hinoto",
    ["Rarity"] = v1.Rarity.Type.Secret,
    ["Description"] = "A well rounded middle blocking player.",
    ["Number"] = 10,
    ["Multipliers"] = require(script.Parent.TimeskipShoyo.Multipliers),
    ["Metadata"] = {
        ["Special"] = require(script.Parent.TimeskipShoyo.Special),
        ["Statistics"] = require(script.Parent.TimeskipShoyo.Statistics),
        ["Animations"] = require(script.Parent.TimeskipShoyo.Animations),
        ["Nametag"] = require(script.Parent.TimeskipShoyo.Nametag),
        ["Timestamp"] = DateTime.fromUniversalTime(2025, 8, 16, 15, 30, 0).UnixTimestamp
    }
}
return v2(v3)