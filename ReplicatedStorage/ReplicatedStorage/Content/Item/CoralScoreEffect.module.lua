-- Decompiled game.ReplicatedStorage.Content.Item.CoralScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Coral Crash",
    ["Rarity"] = v1.Rarity.Type.Rare,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained by opening a Crate in Season 4",
    ["Icon"] = "rbxassetid://87028193015184",
    ["Group"] = v1.Group.Season4
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://134783076350989"
    }
}
v3.Metadata = v4
return v2(v3)