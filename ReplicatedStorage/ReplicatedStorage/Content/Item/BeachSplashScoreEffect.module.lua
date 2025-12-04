-- Decompiled game.ReplicatedStorage.Content.Item.BeachSplashScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Beach Splash",
    ["Rarity"] = v1.Rarity.Type.Rare,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained in the Season 4 Premium Pass",
    ["Icon"] = "rbxassetid://104462508379476",
    ["Group"] = v1.Group.Season4
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://102551657771075"
    }
}
v3.Metadata = v4
return v2(v3)