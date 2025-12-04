-- Decompiled game.ReplicatedStorage.Content.Item.AbilityPotionConsumable

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Consumable)
local v4 = require(v1.Content.Reward)
local v5 = v2.new
local v6 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Ability Potion",
    ["Rarity"] = v2.Rarity.Type.Legendary,
    ["Type"] = v2.Type.Consumable,
    ["Description"] = "3x charge speed!",
    ["Subtitle"] = "WIZARDS GAMEMODE"
}
local v7 = {
    ["Color"] = Color3.fromHex("b708a8")
}
local v8 = {
    ["BoostIds"] = { "ChargeSpeed" },
    ["BoostMetadata"] = {
        ["Duration"] = 600,
        ["Value"] = 3
    },
    ["IsWizardsOnly"] = true
}
v7.Consumable = v3.get("Potion", v8)
v7.CauldronLevel = 6
v7.Ingredients = { v4.new({
        ["Type"] = v4.Type.Item,
        ["Value"] = "FeatherIngredient",
        ["Quantity"] = 1
    }), v4.new({
        ["Type"] = v4.Type.Item,
        ["Value"] = "GemIngredient",
        ["Quantity"] = 1
    }), v4.new({
        ["Type"] = v4.Type.Currency,
        ["Value"] = 1000
    }) }
v6.Metadata = v7
return v5(v6)