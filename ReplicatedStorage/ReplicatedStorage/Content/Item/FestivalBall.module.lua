-- Decompiled game.ReplicatedStorage.Content.Item.FestivalBall

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Festival Ball",
    ["Rarity"] = v1.Rarity.Type.Legendary,
    ["Type"] = v1.Type.Ball,
    ["Description"] = "Obtained in the Season 6 Pass"
}
local v4 = {
    ["StockShop"] = {
        ["TotalStock"] = 1,
        ["Weight"] = 1,
        ["Cost"] = NumberRange.new(30, 70)
    }
}
v3.Metadata = v4
return v2(v3)