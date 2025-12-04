-- Decompiled game.ReplicatedStorage.Content.Item.ConfettiBurstScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Confetti Burst",
    ["Rarity"] = v1.Rarity.Type.Rare,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained in the Season 6 Premium Pass",
    ["Icon"] = "rbxassetid://121762897006603",
    ["Group"] = v1.Group.Season6
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://80081626830247"
    }
}
v3.Metadata = v4
return v2(v3)