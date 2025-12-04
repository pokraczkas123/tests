-- Decompiled game.ReplicatedStorage.Content.Item.Season1ProScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Fireworks Season 1",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Type"] = v1.Type.ScoreEffect,
    ["Icon"] = "rbxassetid://102386819813413",
    ["Description"] = "Obtained by reaching PRO RANK in Season 1",
    ["Group"] = v1.Group.Season1
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://138235055955269"
    }
}
v3.Metadata = v4
return v2(v3)