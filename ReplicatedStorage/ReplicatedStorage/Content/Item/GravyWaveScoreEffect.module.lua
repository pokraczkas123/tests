-- Decompiled game.ReplicatedStorage.Content.Item.GravyWaveScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Gravy Wave Score Effect",
    ["Rarity"] = v1.Rarity.Type.Epic,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained by opening a Crate in Season 9",
    ["Group"] = v1.Group.Season9,
    ["Icon"] = "rbxassetid://86030471297505"
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://130033380366091"
    },
    ["StockShop"] = {
        ["TotalStock"] = 1,
        ["Weight"] = 1,
        ["Cost"] = NumberRange.new(300, 500)
    }
}
v3.Metadata = v4
return v2(v3)