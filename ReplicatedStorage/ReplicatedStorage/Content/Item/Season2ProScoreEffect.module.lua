-- Decompiled game.ReplicatedStorage.Content.Item.Season2ProScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Fireworks Season 2",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Type"] = v1.Type.ScoreEffect,
    ["Icon"] = "rbxassetid://134032018695833",
    ["Description"] = "Obtained by reaching PRO RANK in Season 2",
    ["Group"] = v1.Group.Season2
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://134662374397216"
    }
}
v3.Metadata = v4
return v2(v3)