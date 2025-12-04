-- Decompiled game.ReplicatedStorage.Content.Item.HeightPotionConsumable

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Consumable)
local v4 = require(v1.Content.Reward)
local v5 = v2.new
local v6 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Height Potion",
    ["Rarity"] = v2.Rarity.Type.Legendary,
    ["Type"] = v2.Type.Consumable,
    ["Description"] = "Double your height!",
    ["Subtitle"] = "WIZARDS GAMEMODE"
}
local v7 = {
    ["Color"] = Color3.fromHex("082661")
}
local v8 = {
    ["BoostIds"] = { "Height" },
    ["BoostMetadata"] = {
        ["Duration"] = 600,
        ["Value"] = 2
    },
    ["IsWizardsOnly"] = true
}
v7.Consumable = v3.get("Potion", v8)
v7.CauldronLevel = 5
v7.Ingredients = { v4.new({
        ["Type"] = v4.Type.Item,
        ["Value"] = "CandleWaxIngredient",
        ["Quantity"] = 1
    }), v4.new({
        ["Type"] = v4.Type.Currency,
        ["Value"] = 750
    }) }
v6.Metadata = v7
return v5(v6)