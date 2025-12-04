-- Decompiled game.ReplicatedStorage.Content.Item.WhiteEggBall

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "White Egg Ball",
    ["Rarity"] = v1.Rarity.Type.Common,
    ["Type"] = v1.Type.Ball,
    ["Description"] = "Obtained by opening an Easter Crate"
}
local v4 = {
    ["StockShop"] = {
        ["TotalStock"] = 1,
        ["Weight"] = 1,
        ["Cost"] = NumberRange.new(50, 100)
    }
}
v3.Metadata = v4
return v2(v3)