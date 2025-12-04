-- Decompiled game.ReplicatedStorage.Content.Item.PotExplosionScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Gold Pot Explosion",
    ["Rarity"] = v1.Rarity.Type.Legendary,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained in Season 1 Pass",
    ["Icon"] = "rbxassetid://114309208387480",
    ["Group"] = v1.Group.Season1
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://102615958282816"
    }
}
v3.Metadata = v4
return v2(v3)