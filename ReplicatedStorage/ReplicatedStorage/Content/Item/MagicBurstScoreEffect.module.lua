-- Decompiled game.ReplicatedStorage.Content.Item.MagicBurstScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Magic Burst",
    ["Rarity"] = v1.Rarity.Type.Epic,
    ["Type"] = v1.Type.ScoreEffect,
    ["Icon"] = "rbxassetid://126872189711771",
    ["Description"] = "Obtained by opening a Crate in Season 3",
    ["Group"] = v1.Group.Season3
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://80072610824151"
    }
}
v3.Metadata = v4
return v2(v3)