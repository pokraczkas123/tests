-- Decompiled game.ReplicatedStorage.Content.Item.WaterSplashScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Water Splash",
    ["Rarity"] = v1.Rarity.Type.Legendary,
    ["Type"] = v1.Type.ScoreEffect,
    ["Icon"] = "rbxassetid://80775178263026",
    ["Description"] = "Obtained in Season 1 Pass",
    ["Group"] = v1.Group.Season1
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://110361986934376"
    }
}
v3.Metadata = v4
return v2(v3)