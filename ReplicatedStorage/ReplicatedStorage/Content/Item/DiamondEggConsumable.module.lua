-- Decompiled game.ReplicatedStorage.Content.Item.DiamondEggConsumable

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Consumable)
local v4 = require(v1.Content.Reward)
local v5 = require(v1.Content.Lottery)
local v6 = v2.new
local v7 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Diamond Egg",
    ["Rarity"] = v2.Rarity.Type.Legendary,
    ["Type"] = v2.Type.Consumable,
    ["Description"] = "Win ranked games for a chance to earn!"
}
local v8 = {}
local v9 = v3.get
local v10 = {
    ["Id"] = script.Name,
    ["Content"] = v5.new({
        v4.new({
            ["Type"] = v4.Type.LuckyStyleSpins,
            ["Value"] = 2,
            ["Chance"] = 0.1
        }),
        v4.new({
            ["Type"] = v4.Type.LuckyAbilitySpins,
            ["Value"] = 3,
            ["Chance"] = 0.2
        }),
        v4.new({
            ["Type"] = v4.Type.SeasonalCurrency,
            ["Value"] = 500,
            ["Chance"] = 0.2
        }),
        v4.new({
            ["Type"] = v4.Type.Currency,
            ["Value"] = 2500,
            ["Chance"] = 0.2
        }),
        v4.new({
            ["Type"] = v4.Type.Item,
            ["Value"] = "RankedWinsScoreEffect",
            ["Chance"] = 0.15
        }),
        v4.new({
            ["Type"] = v4.Type.Item,
            ["Value"] = "ChocolateEggHatchingScoreEffect",
            ["Chance"] = 0.15
        })
    })
}
v8.Consumable = v9("EasterEgg", v10)
v7.Metadata = v8
return v6(v7)