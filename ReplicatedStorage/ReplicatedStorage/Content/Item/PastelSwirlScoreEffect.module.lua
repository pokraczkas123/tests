-- Decompiled game.ReplicatedStorage.Content.Item.PastelSwirlScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Pastel Swirl",
    ["Rarity"] = v1.Rarity.Type.Legendary,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained in the Easter Bundle",
    ["Icon"] = "rbxassetid://122775633476569",
    ["Group"] = v1.Group.Season2
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://102704786738008"
    }
}
v3.Metadata = v4
return v2(v3)