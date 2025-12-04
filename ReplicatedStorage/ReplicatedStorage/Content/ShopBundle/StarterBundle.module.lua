-- Decompiled game.ReplicatedStorage.Content.ShopBundle.StarterBundle

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Reward)
local v4 = v2.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Starter Bundle",
    ["Rewards"] = { v3.new({
            ["Type"] = v3.Type.LuckyStyleSpins,
            ["Value"] = 5
        }), v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "MasteryChallengeSkipIngredient"
        }) },
    ["Cost"] = 235,
    ["MaxPurchases"] = 1,
    ["Priority"] = 1,
    ["isPlayerEligible"] = require(script.IsPlayerEligible)
}
local v6 = {
    ["TextColor"] = Color3.fromRGB(255, 122, 255),
    ["ColorGradient"] = {
        ["Speed"] = 0.5,
        ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(226, 84, 255)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(115, 0, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(226, 84, 255)) })
    }
}
v5.Metadata = v6
return v4(v5)