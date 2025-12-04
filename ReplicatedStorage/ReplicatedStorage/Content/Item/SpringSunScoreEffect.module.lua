-- Decompiled game.ReplicatedStorage.Content.Item.SpringSunScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Spring Sunshine",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained by opening a Golden Sun Egg",
    ["Icon"] = "rbxassetid://76637029989845",
    ["Group"] = v1.Group.Season2
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://138330179669214"
    }
}
v3.Metadata = v4
return v2(v3)