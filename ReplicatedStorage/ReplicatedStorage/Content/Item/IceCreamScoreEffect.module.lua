-- Decompiled game.ReplicatedStorage.Content.Item.IceCreamScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Ice Cream Splat",
    ["Rarity"] = v1.Rarity.Type.Epic,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained by opening a Crate in Season 4",
    ["Icon"] = "rbxassetid://93577143877427",
    ["Group"] = v1.Group.Season4
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://130421250358739",
        ["PlaybackSpeed"] = NumberRange.new(1.3, 1.4)
    },
    ["StockShop"] = {
        ["TotalStock"] = 1,
        ["Weight"] = 1,
        ["Cost"] = NumberRange.new(200, 400)
    }
}
v3.Metadata = v4
return v2(v3)