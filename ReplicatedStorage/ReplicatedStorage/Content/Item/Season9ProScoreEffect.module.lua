-- Decompiled game.ReplicatedStorage.Content.Item.Season9ProScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Season 9 Pro Score Effect",
    ["Group"] = v1.Group.Season9,
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained by reaching PRO RANK in Season 9",
    ["Icon"] = "rbxassetid://139400779910684"
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://73455157502510"
    }
}
v3.Metadata = v4
return v2(v3)