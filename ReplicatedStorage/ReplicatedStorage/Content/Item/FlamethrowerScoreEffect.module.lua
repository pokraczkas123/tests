-- Decompiled game.ReplicatedStorage.Content.Item.FlamethrowerScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Flamethrower Score Effect",
    ["Rarity"] = v1.Rarity.Type.Epic,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained by opening a Crate in Season 5",
    ["Icon"] = "rbxassetid://112943693073004",
    ["Group"] = v1.Group.Season5
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://81727233669959",
        ["PlaybackSpeed"] = NumberRange.new(0.8, 1)
    }
}
v3.Metadata = v4
return v2(v3)