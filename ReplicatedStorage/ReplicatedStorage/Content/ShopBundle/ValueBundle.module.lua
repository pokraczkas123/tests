-- Decompiled game.ReplicatedStorage.Content.ShopBundle.ValueBundle

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Reward)
local v4 = v2.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Value Bundle",
    ["Rewards"] = {
        v3.new({
            ["Type"] = v3.Type.LuckyStyleSpins,
            ["Value"] = 15
        }),
        v3.new({
            ["Type"] = v3.Type.LuckyAbilitySpins,
            ["Value"] = 15
        }),
        v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "MasteryChallengeSkipIngredient"
        }),
        v3.new({
            ["Type"] = v3.Type.Currency,
            ["Value"] = 5000
        })
    },
    ["Cost"] = 4500,
    ["MaxPurchases"] = 2,
    ["Priority"] = 3,
    ["isPlayerEligible"] = function(_)
        return true
    end
}
local v6 = {
    ["TextColor"] = Color3.fromRGB(77, 252, 255),
    ["ColorGradient"] = {
        ["Speed"] = 0.5,
        ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(99, 252, 255)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 110, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(99, 252, 255)) })
    }
}
v5.Metadata = v6
return v4(v5)