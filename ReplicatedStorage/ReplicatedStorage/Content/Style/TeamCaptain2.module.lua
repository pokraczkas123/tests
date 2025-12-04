-- Decompiled game.ReplicatedStorage.Content.Style.TeamCaptain2

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Taichou",
    ["Rarity"] = v1.Rarity.Type.Secret,
    ["Description"] = "",
    ["Number"] = 7,
    ["Multipliers"] = require(script.Parent.TeamCaptain.Multipliers),
    ["Metadata"] = {
        ["MasteryId"] = "TeamCaptain",
        ["Special"] = require(script.Parent.TeamCaptain.Special),
        ["Statistics"] = require(script.Parent.TeamCaptain.Statistics),
        ["Animations"] = require(script.Parent.TeamCaptain.Animations),
        ["Nametag"] = require(script.Parent.TeamCaptain.Nametag),
        ["Timestamp"] = DateTime.fromUniversalTime(2025, 11, 8, 15, 25, 0).UnixTimestamp
    }
}
return v2(v3)