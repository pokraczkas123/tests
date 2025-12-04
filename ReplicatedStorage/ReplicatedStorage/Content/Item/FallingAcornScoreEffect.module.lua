-- Decompiled game.ReplicatedStorage.Content.Item.FallingAcornScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Falling Acorns Score Effect",
    ["Rarity"] = v1.Rarity.Type.Common,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained by opening a Crate in Season 9",
    ["Group"] = v1.Group.Season9,
    ["Icon"] = "rbxassetid://105492186896039"
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://140587508992986"
    }
}
v3.Metadata = v4
return v2(v3)