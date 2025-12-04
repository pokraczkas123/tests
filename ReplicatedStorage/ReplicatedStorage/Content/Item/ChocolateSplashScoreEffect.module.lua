-- Decompiled game.ReplicatedStorage.Content.Item.ChocolateSplashScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Chocolate Splash",
    ["Rarity"] = v1.Rarity.Type.Epic,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained in the Easter Crate",
    ["Icon"] = "rbxassetid://111558331118231",
    ["Group"] = v1.Group.Season2
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://70475636910674"
    }
}
v3.Metadata = v4
return v2(v3)