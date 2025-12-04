-- Decompiled game.ReplicatedStorage.Content.Item.BouncyPotionConsumable

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Consumable)
local v4 = require(v1.Content.Reward)
local v5 = v2.new
local v6 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Bouncy Potion",
    ["Rarity"] = v2.Rarity.Type.Rare,
    ["Type"] = v2.Type.Consumable,
    ["Description"] = "Get bunny physics!",
    ["Subtitle"] = "WIZARDS GAMEMODE"
}
local v7 = {
    ["Color"] = Color3.fromHex("3c7bb7")
}
local v8 = {
    ["BoostIds"] = { "BunnyPhysics" },
    ["BoostMetadata"] = {
        ["Duration"] = 360
    },
    ["IsWizardsOnly"] = true
}
v7.Consumable = v3.get("Potion", v8)
v7.CauldronLevel = 3
v7.Ingredients = { v4.new({
        ["Type"] = v4.Type.Item,
        ["Value"] = "PineConeIngredient",
        ["Quantity"] = 1
    }), v4.new({
        ["Type"] = v4.Type.Item,
        ["Value"] = "HoneycombIngredient",
        ["Quantity"] = 1
    }), v4.new({
        ["Type"] = v4.Type.Currency,
        ["Value"] = 500
    }) }
v6.Metadata = v7
return v5(v6)