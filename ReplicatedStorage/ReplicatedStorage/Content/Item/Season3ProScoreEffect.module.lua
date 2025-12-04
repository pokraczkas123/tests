-- Decompiled game.ReplicatedStorage.Content.Item.Season3ProScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Lightning Strike Score Effect",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained by reaching PRO RANK in Season 3",
    ["Icon"] = "rbxassetid://108892956643001",
    ["Group"] = v1.Group.Season3
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://78474768169068",
        ["PlaybackSpeed"] = NumberRange.new(0.7, 0.8)
    }
}
v3.Metadata = v4
return v2(v3)