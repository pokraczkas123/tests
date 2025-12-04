-- Decompiled game.ReplicatedStorage.Content.Item.CloudburstScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Cloudburst Score Effect",
    ["Rarity"] = v1.Rarity.Type.Epic,
    ["Type"] = v1.Type.ScoreEffect,
    ["Group"] = v1.Group.Season7,
    ["Icon"] = "rbxassetid://88707009965363",
    ["Description"] = "Obtained in the Season 7 Pass"
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://95152176015336"
    }
}
v3.Metadata = v4
return v2(v3)