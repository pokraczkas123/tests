-- Decompiled game.ReplicatedStorage.Content.ShopBundle.ProRankBundle

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Reward)
local v4 = v2.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Pro Rank Bundle",
    ["Rewards"] = {
        v3.new({
            ["Type"] = v3.Type.LuckyStyleSpins,
            ["Value"] = 10
        }),
        v3.new({
            ["Type"] = v3.Type.LuckyAbilitySpins,
            ["Value"] = 10
        }),
        v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "MasteryChallengeSkipIngredient"
        }),
        v3.new({
            ["Type"] = v3.Type.Currency,
            ["Value"] = 3500
        })
    },
    ["Cost"] = 2500,
    ["MaxPurchases"] = 1,
    ["Priority"] = 1,
    ["isPlayerEligible"] = require(script.IsPlayerEligible)
}
local v6 = {
    ["TextColor"] = Color3.fromRGB(255, 0, 0),
    ["ColorGradient"] = {
        ["Speed"] = 0.7,
        ["Color"] = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 44, 44)),
            ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255, 44, 44)),
            ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.7, Color3.fromRGB(140, 0, 0)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 44, 44))
        })
    }
}
v5.Metadata = v6
return v4(v5)