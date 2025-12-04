-- Decompiled game.ReplicatedStorage.Content.Item.YenPotionConsumable

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Consumable)
local v4 = require(v1.Content.Reward)
local v5 = v2.new
local v6 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Yen Potion",
    ["Rarity"] = v2.Rarity.Type.Legendary,
    ["Type"] = v2.Type.Consumable,
    ["Description"] = "2x Yen Gain!"
}
local v7 = {
    ["Color"] = Color3.fromHex("e2d25e")
}
local v8 = {
    ["BoostIds"] = { "YenGain" },
    ["BoostMetadata"] = {
        ["Duration"] = 1800,
        ["Value"] = 2
    },
    ["IsWizardsOnly"] = false
}
v7.Consumable = v3.get("Potion", v8)
v7.CauldronLevel = 10
v7.Ingredients = { v4.new({
        ["Type"] = v4.Type.Item,
        ["Value"] = "CoinIngredient",
        ["Quantity"] = 1
    }), v4.new({
        ["Type"] = v4.Type.Item,
        ["Value"] = "GlassShardIngredient",
        ["Quantity"] = 2
    }), v4.new({
        ["Type"] = v4.Type.Currency,
        ["Value"] = 1
    }) }
v6.Metadata = v7
return v5(v6)