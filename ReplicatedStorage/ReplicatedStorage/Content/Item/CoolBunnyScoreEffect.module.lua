-- Decompiled game.ReplicatedStorage.Content.Item.CoolBunnyScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Cool Bunny",
    ["Rarity"] = v1.Rarity.Type.Legendary,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained in the Easter Crate",
    ["Icon"] = "rbxassetid://133452925271860",
    ["Group"] = v1.Group.Season2
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://114014324188542"
    }
}
v3.Metadata = v4
return v2(v3)