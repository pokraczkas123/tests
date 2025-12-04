-- Decompiled game.ReplicatedStorage.Content.Item.SkullScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Skull Score Effect",
    ["Rarity"] = v1.Rarity.Type.Epic,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained by opening a Crate in Season 5",
    ["Icon"] = "rbxassetid://113587016807598",
    ["Group"] = v1.Group.Season5
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://82448486674391",
        ["PlaybackSpeed"] = NumberRange.new(0.8, 0.9)
    },
    ["StockShop"] = {
        ["TotalStock"] = 1,
        ["Weight"] = 1,
        ["Cost"] = NumberRange.new(200, 400)
    }
}
v3.Metadata = v4
return v2(v3)