-- Decompiled game.ReplicatedStorage.Content.Style.TeamCaptain

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Taichou",
    ["Rarity"] = v1.Rarity.Type.Secret,
    ["Description"] = "",
    ["Number"] = 7,
    ["Multipliers"] = require(script.Multipliers),
    ["Metadata"] = {
        ["MasteryId"] = "TeamCaptain",
        ["Special"] = require(script.Special),
        ["Statistics"] = require(script.Statistics),
        ["Animations"] = require(script.Animations),
        ["Nametag"] = require(script.Nametag),
        ["Timestamp"] = DateTime.fromUniversalTime(2025, 6, 28, 15, 30, 0).UnixTimestamp,
        ["IsOriginal"] = true
    }
}
return v2(v3)