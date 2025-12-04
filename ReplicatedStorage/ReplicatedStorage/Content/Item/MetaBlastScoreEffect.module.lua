-- Decompiled game.ReplicatedStorage.Content.Item.MetaBlastScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Ground Smash Score Effect",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Type"] = v1.Type.ScoreEffect,
    ["Icon"] = "rbxassetid://133445826183309",
    ["Description"] = "Obtained by Rebirthing 5 times in Season 3",
    ["Group"] = v1.Group.Season3
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://109095345830844"
    }
}
v3.Metadata = v4
return v2(v3)