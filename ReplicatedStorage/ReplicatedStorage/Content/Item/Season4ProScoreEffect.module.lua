-- Decompiled game.ReplicatedStorage.Content.Item.Season4ProScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Bombshell",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained by reaching PRO RANK in Season 4",
    ["Icon"] = "rbxassetid://140173232174404",
    ["Group"] = v1.Group.Season4
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://112810632871502"
    }
}
v3.Metadata = v4
return v2(v3)