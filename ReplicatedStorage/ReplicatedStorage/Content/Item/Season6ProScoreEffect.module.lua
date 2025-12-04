-- Decompiled game.ReplicatedStorage.Content.Item.Season6ProScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Fireworks Season 6",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained by reaching PRO RANK in Season 6",
    ["Icon"] = "rbxassetid://95356022486454",
    ["Group"] = v1.Group.Season6
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://134544780850049"
    }
}
v3.Metadata = v4
return v2(v3)