-- Decompiled game.ReplicatedStorage.Content.Item.PumpkinSmashScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Pumpkin Smash Score Effect",
    ["Group"] = v1.Group.Season8,
    ["Rarity"] = v1.Rarity.Type.Rare,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained in the Season 8 Premium Pass",
    ["Icon"] = "rbxassetid://112686123124275"
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://83942921567389"
    }
}
v3.Metadata = v4
return v2(v3)