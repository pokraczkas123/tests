-- Decompiled game.ReplicatedStorage.Content.Item.TrampolineScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Trampoline Score Effect",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Type"] = v1.Type.ScoreEffect,
    ["Group"] = v1.Group.Season7,
    ["Icon"] = "rbxassetid://75863092786021",
    ["Description"] = "Obtained in the Season 7 Pass"
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://137529668359097"
    },
    ["StockShop"] = {
        ["TotalStock"] = 1,
        ["Weight"] = 1,
        ["Cost"] = NumberRange.new(1000, 2000)
    }
}
v3.Metadata = v4
return v2(v3)