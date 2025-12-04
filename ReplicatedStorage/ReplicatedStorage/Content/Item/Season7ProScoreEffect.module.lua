-- Decompiled game.ReplicatedStorage.Content.Item.Season7ProScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Season 7 Pro Score Effect",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Type"] = v1.Type.ScoreEffect,
    ["Group"] = v1.Group.Season7,
    ["Icon"] = "rbxassetid://134053428900549",
    ["Description"] = "Obtained by reaching PRO RANK in Season 7"
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://82751202514194"
    }
}
v3.Metadata = v4
return v2(v3)