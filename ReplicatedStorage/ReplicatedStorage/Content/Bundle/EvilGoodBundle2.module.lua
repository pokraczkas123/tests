-- Decompiled game.ReplicatedStorage.Content.Bundle.EvilGoodBundle2

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Reward)
local v4 = v2.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "GOOD + EVIL BUNDLES",
    ["Group"] = "EvilGoodBundleSeason7",
    ["Image"] = "rbxassetid://95028996387540",
    ["Color"] = Color3.fromRGB(255, 5, 5),
    ["Timestamp"] = {
        ["Start"] = DateTime.fromUniversalTime(2025, 3, 23, 18, 0, 0).UnixTimestamp,
        ["End"] = DateTime.fromUniversalTime(2025, 9, 6, 15, 30, 0).UnixTimestamp
    },
    ["Rewards"] = {
        v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "AngelHeadBall"
        }),
        v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "TrampolineScoreEffect"
        }),
        v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "AngelTitle"
        }),
        v3.new({
            ["Type"] = v3.Type.SeasonalCurrency,
            ["Value"] = 500
        })
    }
}
return v4(v5)