-- Decompiled game.ReplicatedStorage.Content.ShopBundle.MasteriesBundle

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Reward)
local v4 = v2.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Masteries Bundle",
    ["Rewards"] = { v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "MasteryChallengeSkipIngredient",
            ["Quantity"] = 3
        }), v3.new({
            ["Type"] = v3.Type.Currency,
            ["Value"] = 3000
        }) },
    ["Cost"] = 2000,
    ["MaxPurchases"] = 1,
    ["Priority"] = 3,
    ["isPlayerEligible"] = require(script.IsPlayerEligible)
}
local v6 = {
    ["TextColor"] = Color3.fromRGB(255, 239, 58),
    ["ColorGradient"] = {
        ["Speed"] = 0.7,
        ["Color"] = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 128, 0)),
            ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 255, 0)),
            ColorSequenceKeypoint.new(0.66, Color3.fromRGB(255, 171, 3)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 128, 0))
        })
    }
}
v5.Metadata = v6
return v4(v5)