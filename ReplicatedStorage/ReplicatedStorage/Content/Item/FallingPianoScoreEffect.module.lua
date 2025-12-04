-- Decompiled game.ReplicatedStorage.Content.Item.FallingPianoScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Falling Piano Score Effect",
    ["Group"] = v1.Group.Season8,
    ["Rarity"] = v1.Rarity.Type.Epic,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained in the Season 8 Premium Pass",
    ["Icon"] = "rbxassetid://97624913798073"
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://79842232209713"
    }
}
v3.Metadata = v4
return v2(v3)