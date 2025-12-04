-- Decompiled game.ReplicatedStorage.Content.Item.SpiritExplosionScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Spirit Explosion",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained by Rebirthing 5 times in Season 7",
    ["Icon"] = "rbxassetid://91837262515659",
    ["Group"] = v1.Group.Season7
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://139538547027168"
    }
}
v3.Metadata = v4
return v2(v3)