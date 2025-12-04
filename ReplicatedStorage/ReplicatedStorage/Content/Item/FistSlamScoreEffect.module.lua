-- Decompiled game.ReplicatedStorage.Content.Item.FistSlamScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Demonic Fist Slam Score Effect",
    ["Rarity"] = v1.Rarity.Type.Legendary,
    ["Type"] = v1.Type.ScoreEffect,
    ["Group"] = v1.Group.Season7,
    ["Icon"] = "rbxassetid://72751649231999",
    ["Description"] = "Obtained by opening a Crate in Season 7"
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://87701083311197"
    }
}
v3.Metadata = v4
return v2(v3)