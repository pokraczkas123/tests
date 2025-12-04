-- Decompiled game.ReplicatedStorage.Content.Item.MeteorScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Meteor Crash",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained by Rebirthing 5 times in Season 5",
    ["Icon"] = "rbxassetid://126212157026656",
    ["Group"] = v1.Group.Season5
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://111611096744157"
    }
}
v3.Metadata = v4
return v2(v3)