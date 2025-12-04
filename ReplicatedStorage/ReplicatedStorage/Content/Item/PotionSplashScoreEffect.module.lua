-- Decompiled game.ReplicatedStorage.Content.Item.PotionSplashScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Potion Splash",
    ["Rarity"] = v1.Rarity.Type.Epic,
    ["Type"] = v1.Type.ScoreEffect,
    ["Icon"] = "rbxassetid://133291953378717",
    ["Description"] = "Obtained in the Season 3 Premium Pass",
    ["Group"] = v1.Group.Season3
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://115472435634365"
    }
}
v3.Metadata = v4
return v2(v3)