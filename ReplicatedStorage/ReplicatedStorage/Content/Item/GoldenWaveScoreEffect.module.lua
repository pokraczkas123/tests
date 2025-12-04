-- Decompiled game.ReplicatedStorage.Content.Item.GoldenWaveScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Golden Wave Score Effect",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Type"] = v1.Type.ScoreEffect,
    ["Group"] = v1.Group.Season7,
    ["Icon"] = "rbxassetid://80205292621204",
    ["Description"] = "Obtained by opening a Crate in Season 7"
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://103298688535759"
    },
    ["StockShop"] = {
        ["TotalStock"] = 1,
        ["Weight"] = 1,
        ["Cost"] = NumberRange.new(300, 500)
    }
}
v3.Metadata = v4
return v2(v3)