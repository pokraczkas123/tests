-- Decompiled game.ReplicatedStorage.Content.Item.SpikePowerPotionConsumable

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Consumable)
local v4 = require(v1.Content.Reward)
local v5 = v2.new
local v6 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Spike Power Potion",
    ["Rarity"] = v2.Rarity.Type.Legendary,
    ["Type"] = v2.Type.Consumable,
    ["Description"] = "Get Spike Power!",
    ["Subtitle"] = "WIZARDS GAMEMODE"
}
local v7 = {
    ["Color"] = Color3.fromHex("2ed25e")
}
local v8 = {
    ["BoostIds"] = { "SpikePower" },
    ["BoostMetadata"] = {
        ["Value"] = 1.3,
        ["Duration"] = 600
    },
    ["IsWizardsOnly"] = true
}
v7.Consumable = v3.get("Potion", v8)
v7.CauldronLevel = 8
v7.Ingredients = { v4.new({
        ["Type"] = v4.Type.Item,
        ["Value"] = "CoinIngredient",
        ["Quantity"] = 1
    }), v4.new({
        ["Type"] = v4.Type.Item,
        ["Value"] = "FeatherIngredient",
        ["Quantity"] = 2
    }), v4.new({
        ["Type"] = v4.Type.Currency,
        ["Value"] = 1250
    }) }
v6.Metadata = v7
return v5(v6)