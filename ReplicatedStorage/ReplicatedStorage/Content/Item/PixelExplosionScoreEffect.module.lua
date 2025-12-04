-- Decompiled game.ReplicatedStorage.Content.Item.PixelExplosionScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Pixel Explosion",
    ["Rarity"] = v1.Rarity.Type.Epic,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained by opening a Crate in Season 6",
    ["Icon"] = "rbxassetid://119310374004831",
    ["Group"] = v1.Group.Season6
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://96089533865065"
    }
}
v3.Metadata = v4
return v2(v3)