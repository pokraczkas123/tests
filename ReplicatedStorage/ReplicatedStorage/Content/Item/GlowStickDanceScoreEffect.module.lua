-- Decompiled game.ReplicatedStorage.Content.Item.GlowStickDanceScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Glow Stick Dance Score Effect",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained by opening a Crate in Season 6",
    ["Icon"] = "rbxassetid://98370717778961",
    ["Group"] = v1.Group.Season6
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://80081626830247"
    }
}
v3.Metadata = v4
return v2(v3)