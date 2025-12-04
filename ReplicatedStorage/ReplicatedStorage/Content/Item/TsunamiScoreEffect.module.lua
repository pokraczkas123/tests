-- Decompiled game.ReplicatedStorage.Content.Item.TsunamiScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Tsunami",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained by Rebirthing 5 times in Season 4",
    ["Icon"] = "rbxassetid://108701738123774",
    ["Group"] = v1.Group.Season4
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://115642011366811"
    }
}
v3.Metadata = v4
return v2(v3)