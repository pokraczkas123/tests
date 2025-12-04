-- Decompiled game.ReplicatedStorage.Content.Item.Level100ScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Level 100",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Type"] = v1.Type.ScoreEffect,
    ["Icon"] = "rbxassetid://109505746700360",
    ["Description"] = "Obtained by reaching level 100",
    ["Group"] = v1.Group.LevelRewards
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://124749180451499"
    }
}
v3.Metadata = v4
return v2(v3)