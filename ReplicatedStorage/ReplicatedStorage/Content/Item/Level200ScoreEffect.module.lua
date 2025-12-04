-- Decompiled game.ReplicatedStorage.Content.Item.Level200ScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Level 200",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Type"] = v1.Type.ScoreEffect,
    ["Icon"] = "rbxassetid://73263773123067",
    ["Description"] = "Obtained by reaching level 200",
    ["Group"] = v1.Group.LevelRewards
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://79582263764593"
    }
}
v3.Metadata = v4
return v2(v3)