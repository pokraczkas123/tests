-- Decompiled game.ReplicatedStorage.Content.Item.AuraPotionConsumable

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Consumable)
local v4 = require(v1.Content.Reward)
local v5 = v2.new
local v6 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Aura Potion",
    ["Rarity"] = v2.Rarity.Type.Godly,
    ["Type"] = v2.Type.Consumable,
    ["Description"] = "Get aura!",
    ["Subtitle"] = "WIZARDS GAMEMODE"
}
local v7 = {
    ["Color"] = Color3.fromHex("a6226f")
}
local v8 = {
    ["BoostIds"] = { "Aura" },
    ["BoostMetadata"] = {
        ["Value"] = 1.3,
        ["Duration"] = 900
    },
    ["IsWizardsOnly"] = true
}
v7.Consumable = v3.get("Potion", v8)
v7.CauldronLevel = 9
v7.Ingredients = { v4.new({
        ["Type"] = v4.Type.Item,
        ["Value"] = "GemIngredient",
        ["Quantity"] = 2
    }), v4.new({
        ["Type"] = v4.Type.Item,
        ["Value"] = "VenomIngredient",
        ["Quantity"] = 1
    }), v4.new({
        ["Type"] = v4.Type.Currency,
        ["Value"] = 3000
    }) }
v6.Metadata = v7
return v5(v6)