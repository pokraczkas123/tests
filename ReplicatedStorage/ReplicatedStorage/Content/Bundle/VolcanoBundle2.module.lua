-- Decompiled game.ReplicatedStorage.Content.Bundle.VolcanoBundle2

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Reward)
local v4 = v2.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Volcano Bundle",
    ["Group"] = "VolcanoBundleSeason5",
    ["Image"] = "rbxassetid://124930974231332",
    ["Color"] = Color3.fromRGB(255, 155, 5),
    ["Timestamp"] = {
        ["Start"] = DateTime.fromUniversalTime(2025, 3, 23, 18, 0, 0).UnixTimestamp,
        ["End"] = DateTime.fromUniversalTime(2025, 7, 12, 15, 30, 0).UnixTimestamp
    },
    ["Rewards"] = {
        v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "RubberDuckyBall"
        }),
        v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "FireTitle"
        }),
        v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "WhirlpoolScoreEffect"
        }),
        v3.new({
            ["Type"] = v3.Type.SeasonalCurrency,
            ["Value"] = 500
        })
    }
}
return v4(v5)