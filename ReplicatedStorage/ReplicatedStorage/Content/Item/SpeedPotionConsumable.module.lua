-- Decompiled game.ReplicatedStorage.Content.Item.SpeedPotionConsumable

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Consumable)
local v4 = require(v1.Content.Reward)
local v5 = v2.new
local v6 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Speed Potion",
    ["Rarity"] = v2.Rarity.Type.Rare,
    ["Type"] = v2.Type.Consumable,
    ["Description"] = "Get a speed boost!",
    ["Subtitle"] = "WIZARDS GAMEMODE"
}
local v7 = {
    ["Color"] = Color3.fromHex("22a5e3")
}
local v8 = {
    ["BoostIds"] = { "Speed" },
    ["BoostMetadata"] = {
        ["Value"] = 1.3,
        ["Duration"] = 420
    },
    ["IsWizardsOnly"] = true
}
v7.Consumable = v3.get("Potion", v8)
v7.CauldronLevel = 1
v7.Ingredients = { v4.new({
        ["Type"] = v4.Type.Item,
        ["Value"] = "FeatherIngredient",
        ["Quantity"] = 1
    }), v4.new({
        ["Type"] = v4.Type.Item,
        ["Value"] = "MushroomIngredient",
        ["Quantity"] = 2
    }), v4.new({
        ["Type"] = v4.Type.Currency,
        ["Value"] = 500
    }) }
v6.Metadata = v7
return v5(v6)