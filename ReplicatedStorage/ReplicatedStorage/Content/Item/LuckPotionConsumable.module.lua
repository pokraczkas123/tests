-- Decompiled game.ReplicatedStorage.Content.Item.LuckPotionConsumable

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Consumable)
local v4 = require(v1.Content.Reward)
local v5 = v2.new
local v6 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Luck Potion",
    ["Rarity"] = v2.Rarity.Type.Godly,
    ["Type"] = v2.Type.Consumable,
    ["Description"] = "1.5x secret luck!"
}
local v7 = {
    ["Color"] = Color3.fromHex("42d7be")
}
local v8 = {
    ["BoostIds"] = { "SecretLuck" },
    ["BoostMetadata"] = {
        ["Duration"] = 1800,
        ["Value"] = 1.5
    },
    ["IsWizardsOnly"] = false
}
v7.Consumable = v3.get("Potion", v8)
v7.CauldronLevel = 11
v7.Ingredients = { v4.new({
        ["Type"] = v4.Type.Item,
        ["Value"] = "LuckyCloverIngredient",
        ["Quantity"] = 2
    }), v4.new({
        ["Type"] = v4.Type.Item,
        ["Value"] = "CandleWaxIngredient",
        ["Quantity"] = 1
    }), v4.new({
        ["Type"] = v4.Type.Currency,
        ["Value"] = 2000
    }) }
v6.Metadata = v7
return v5(v6)