-- Decompiled game.ReplicatedStorage.Content.Item.DiamondScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Diamond Explosion",
    ["Rarity"] = v1.Rarity.Type.Legendary,
    ["Type"] = v1.Type.ScoreEffect,
    ["Icon"] = "rbxassetid://89438709237452",
    ["Description"] = "Obtained by reaching Diamond I in Season 1",
    ["Group"] = v1.Group.Season1
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://127835570161573"
    }
}
v3.Metadata = v4
return v2(v3)