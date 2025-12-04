-- Decompiled game.ReplicatedStorage.Content.Item.GoldenSunEggConsumable

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Consumable)
local v4 = require(v1.Content.Reward)
local v5 = require(v1.Content.Lottery)
local v6 = v2.new
local v7 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Golden Sun Egg",
    ["Rarity"] = v2.Rarity.Type.Godly,
    ["Type"] = v2.Type.Consumable,
    ["Description"] = "Requires combining 1 of all other eggs to obtain! (Excluding Easter Egg)"
}
local v8 = {}
local v9 = v3.get
local v10 = {
    ["Id"] = script.Name,
    ["Content"] = v5.new({
        v4.new({
            ["Type"] = v4.Type.LuckyStyleSpins,
            ["Value"] = 3,
            ["Chance"] = 0.25
        }),
        v4.new({
            ["Type"] = v4.Type.Item,
            ["Value"] = "HeadBall",
            ["Chance"] = 0.25
        }),
        v4.new({
            ["Type"] = v4.Type.Item,
            ["Value"] = "BirdEmote",
            ["Chance"] = 0.25
        }),
        v4.new({
            ["Type"] = v4.Type.Item,
            ["Value"] = "SpringSunScoreEffect",
            ["Chance"] = 0.25
        })
    })
}
v8.Consumable = v9("EasterEgg", v10)
v8.MergeRequirements = {
    "DiamondEggConsumable",
    "ShinyChocolateEggConsumable",
    "ChocolateEggConsumable",
    "ShinyBunnyEggConsumable",
    "BunnyEggConsumable"
}
v7.Metadata = v8
return v6(v7)