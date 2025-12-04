-- Decompiled game.ReplicatedStorage.Content.Item.SupernovaScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Supernova",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Type"] = v1.Type.ScoreEffect,
    ["Icon"] = "rbxassetid://128314477203907",
    ["Description"] = "Obtained by rebirthing 5 times in Season 2",
    ["Group"] = v1.Group.Season2
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://139989415767587"
    }
}
v3.Metadata = v4
return v2(v3)