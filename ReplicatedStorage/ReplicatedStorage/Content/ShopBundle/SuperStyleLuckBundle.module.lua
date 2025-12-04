-- Decompiled game.ReplicatedStorage.Content.ShopBundle.SuperStyleLuckBundle

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Reward)
local v4 = v2.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Super Style Luck Bundle",
    ["Rewards"] = { v3.new({
            ["Type"] = v3.Type.LuckyStyleSpins,
            ["Value"] = 60
        }), v3.new({
            ["Type"] = v3.Type.Currency,
            ["Value"] = 3000
        }), v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "MasteryChallengeSkipIngredient"
        }) },
    ["Cost"] = 12000,
    ["MaxPurchases"] = 1,
    ["Priority"] = 2,
    ["isPlayerEligible"] = require(script.IsPlayerEligible)
}
local v6 = {
    ["TextColor"] = Color3.fromRGB(255, 255, 0),
    ["ColorGradient"] = {
        ["Speed"] = 1.3,
        ["Color"] = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 99, 99)),
            ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 255, 0)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 0)),
            ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 191, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 99, 99))
        })
    }
}
v5.Metadata = v6
return v4(v5)