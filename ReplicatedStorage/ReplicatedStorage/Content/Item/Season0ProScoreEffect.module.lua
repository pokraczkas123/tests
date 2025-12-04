-- Decompiled game.ReplicatedStorage.Content.Item.Season0ProScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Fireworks Season 0",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Type"] = v1.Type.ScoreEffect,
    ["Icon"] = "rbxassetid://88205528887540",
    ["Description"] = "Obtained by reaching PRO RANK in Season 0",
    ["Group"] = v1.Group.Season0
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://138235055955269"
    }
}
v3.Metadata = v4
return v2(v3)