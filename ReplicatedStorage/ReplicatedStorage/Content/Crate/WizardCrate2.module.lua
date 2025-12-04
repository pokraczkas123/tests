-- Decompiled game.ReplicatedStorage.Content.Crate.WizardCrate2

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Lottery)
local v4 = require(v1.Content.Reward)
local v5 = v2.new
local v6 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Ingredient Crate",
    ["Cost"] = 100,
    ["SeasonId"] = "3",
    ["Image"] = "",
    ["Description"] = "",
    ["Content"] = v3.new({
        {
            ["Type"] = v4.Type.Item,
            ["Value"] = "PineConeIngredient",
            ["Chance"] = 0.14
        },
        {
            ["Type"] = v4.Type.Item,
            ["Value"] = "CoalIngredient",
            ["Chance"] = 0.14
        },
        {
            ["Type"] = v4.Type.Item,
            ["Value"] = "FeatherIngredient",
            ["Chance"] = 0.14
        },
        {
            ["Type"] = v4.Type.Item,
            ["Value"] = "MushroomIngredient",
            ["Chance"] = 0.14
        },
        {
            ["Type"] = v4.Type.Item,
            ["Value"] = "GlassShardIngredient",
            ["Chance"] = 0.1
        },
        {
            ["Type"] = v4.Type.Item,
            ["Value"] = "HoneycombIngredient",
            ["Chance"] = 0.1
        },
        {
            ["Type"] = v4.Type.Item,
            ["Value"] = "VenomIngredient",
            ["Chance"] = 0.01
        },
        {
            ["Type"] = v4.Type.Item,
            ["Value"] = "GemIngredient",
            ["Chance"] = 0.01
        },
        {
            ["Type"] = v4.Type.Item,
            ["Value"] = "LuckyCloverIngredient",
            ["Chance"] = 0.03
        },
        {
            ["Type"] = v4.Type.Item,
            ["Value"] = "CandleWaxIngredient",
            ["Chance"] = 0.04
        },
        {
            ["Type"] = v4.Type.Item,
            ["Value"] = "CoinIngredient",
            ["Chance"] = 0.05
        },
        {
            ["Type"] = v4.Type.Item,
            ["Value"] = "InkIngredient",
            ["Chance"] = 0.1
        }
    })
}
return v5(v6)