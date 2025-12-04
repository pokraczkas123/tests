-- Decompiled game.ReplicatedStorage.Content.Item.LightShowScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Light Show",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Type"] = v1.Type.ScoreEffect,
    ["Icon"] = "rbxassetid://128473543492557",
    ["Description"] = "Obtained by rebirthing 5 times in Season 1",
    ["Group"] = v1.Group.Season1
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://99022678104387"
    }
}
v3.Metadata = v4
return v2(v3)