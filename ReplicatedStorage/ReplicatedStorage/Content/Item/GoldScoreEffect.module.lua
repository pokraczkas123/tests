-- Decompiled game.ReplicatedStorage.Content.Item.GoldScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Gold Explosion",
    ["Rarity"] = v1.Rarity.Type.Common,
    ["Type"] = v1.Type.ScoreEffect,
    ["Icon"] = "rbxassetid://119754800329648",
    ["Description"] = "Obtained by reaching Gold I in Season 0",
    ["Group"] = v1.Group.Season0
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://91515524176769"
    }
}
v3.Metadata = v4
return v2(v3)