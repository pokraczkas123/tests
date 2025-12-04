-- Decompiled game.ReplicatedStorage.Content.Item.LavaSplashScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Lava Splash",
    ["Rarity"] = v1.Rarity.Type.Rare,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained in the Season 5 Premium Pass",
    ["Icon"] = "rbxassetid://71805180948989",
    ["Group"] = v1.Group.Season5
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://81727233669959"
    }
}
v3.Metadata = v4
return v2(v3)