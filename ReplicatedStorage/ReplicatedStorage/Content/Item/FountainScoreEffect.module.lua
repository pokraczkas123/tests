-- Decompiled game.ReplicatedStorage.Content.Item.FountainScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Blessing Fountain Score Effect",
    ["Rarity"] = v1.Rarity.Type.Epic,
    ["Type"] = v1.Type.ScoreEffect,
    ["Group"] = v1.Group.Season7,
    ["Icon"] = "rbxassetid://102375148670786",
    ["Description"] = "Obtained in the Season 7 Pass"
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://70376205968444"
    }
}
v3.Metadata = v4
return v2(v3)