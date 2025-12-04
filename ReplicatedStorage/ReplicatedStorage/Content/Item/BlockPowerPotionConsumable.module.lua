-- Decompiled game.ReplicatedStorage.Content.Item.BlockPowerPotionConsumable

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Consumable)
local v4 = require(v1.Content.Reward)
local v5 = v2.new
local v6 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Block Power Potion",
    ["Rarity"] = v2.Rarity.Type.Rare,
    ["Type"] = v2.Type.Consumable,
    ["Description"] = "Get Block Power!",
    ["Subtitle"] = "WIZARDS GAMEMODE"
}
local v7 = {
    ["Color"] = Color3.fromHex("df192e")
}
local v8 = {
    ["BoostIds"] = { "BlockPower" },
    ["BoostMetadata"] = {
        ["Value"] = 1.3,
        ["Duration"] = 420
    },
    ["IsWizardsOnly"] = true
}
v7.Consumable = v3.get("Potion", v8)
v7.CauldronLevel = 7
v7.Ingredients = { v4.new({
        ["Type"] = v4.Type.Item,
        ["Value"] = "InkIngredient",
        ["Quantity"] = 1
    }), v4.new({
        ["Type"] = v4.Type.Item,
        ["Value"] = "CoalIngredient",
        ["Quantity"] = 1
    }), v4.new({
        ["Type"] = v4.Type.Currency,
        ["Value"] = 750
    }) }
v6.Metadata = v7
return v5(v6)