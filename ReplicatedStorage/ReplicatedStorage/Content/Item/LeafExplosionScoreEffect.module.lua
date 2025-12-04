-- Decompiled game.ReplicatedStorage.Content.Item.LeafExplosionScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Leaf Explosion Score Effect",
    ["Rarity"] = v1.Rarity.Type.Legendary,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained in the Season 9 Premium Pass",
    ["Group"] = v1.Group.Season9,
    ["Icon"] = "rbxassetid://103447902954665"
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://134730674533522"
    }
}
v3.Metadata = v4
return v2(v3)