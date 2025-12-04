-- Decompiled game.ReplicatedStorage.Content.Item.WizardHatBall

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Wizard Hat Ball",
    ["Rarity"] = v1.Rarity.Type.Epic,
    ["Type"] = v1.Type.Ball,
    ["Description"] = "Obtained by opening a Crate in Season 3"
}
local v4 = {
    ["StockShop"] = {
        ["TotalStock"] = 1,
        ["Weight"] = 1,
        ["Cost"] = NumberRange.new(50, 90)
    }
}
v3.Metadata = v4
return v2(v3)