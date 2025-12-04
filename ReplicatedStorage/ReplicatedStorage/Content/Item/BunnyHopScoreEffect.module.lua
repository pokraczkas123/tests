-- Decompiled game.ReplicatedStorage.Content.Item.BunnyHopScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Bunny Hop Explosion",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained in Season 2 Pass",
    ["Icon"] = "rbxassetid://122708067375289",
    ["Group"] = v1.Group.Season2
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://86786520818634"
    }
}
v3.Metadata = v4
return v2(v3)