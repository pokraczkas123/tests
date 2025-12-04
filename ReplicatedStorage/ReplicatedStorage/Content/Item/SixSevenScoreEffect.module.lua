-- Decompiled game.ReplicatedStorage.Content.Item.SixSevenScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Six Seven... \240\159\152\169",
    ["Rarity"] = v1.Rarity.Type.Epic,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained by watching the Noah + Kareem Stream in 11/22/2025!",
    ["Icon"] = "rbxassetid://95068879306955"
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://125166859715647",
        ["PlaybackSpeed"] = NumberRange.new(0.95, 1)
    }
}
v3.Metadata = v4
return v2(v3)