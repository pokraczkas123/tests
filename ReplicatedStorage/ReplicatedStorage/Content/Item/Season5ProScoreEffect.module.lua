-- Decompiled game.ReplicatedStorage.Content.Item.Season5ProScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Volcanic Eruption",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained by reaching PRO RANK in Season 5",
    ["Icon"] = "rbxassetid://108429001741130",
    ["Group"] = v1.Group.Season5
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://123210840135878"
    }
}
v3.Metadata = v4
return v2(v3)