-- Decompiled game.ReplicatedStorage.Content.Item.SpiderInfestationScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Spider Infestation Score Effect",
    ["Rarity"] = v1.Rarity.Type.Legendary,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained by opening a Crate in Season 8",
    ["Icon"] = "rbxassetid://119262758500333",
    ["Group"] = v1.Group.Season8
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://104532262869456",
        ["PlaybackSpeed"] = NumberRange.new(1, 1.05)
    }
}
v3.Metadata = v4
return v2(v3)