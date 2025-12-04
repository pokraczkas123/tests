-- Decompiled game.ReplicatedStorage.Content.Bundle.ThanksgivingBundle2

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Reward)
local v4 = v2.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Turkey Bundle",
    ["Group"] = "ThanksgivingBundleSeason9",
    ["Image"] = "rbxassetid://119246574733410",
    ["Color"] = Color3.fromRGB(255, 5, 5),
    ["Timestamp"] = {
        ["Start"] = DateTime.fromUniversalTime(2025, 3, 23, 18, 0, 0).UnixTimestamp,
        ["End"] = DateTime.fromUniversalTime(2025, 11, 15, 15, 30, 0).UnixTimestamp
    },
    ["Rewards"] = {
        v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "TranslucentTurkeyBall"
        }),
        v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "TurkeyTitle"
        }),
        v3.new({
            ["Type"] = v3.Type.SeasonalCurrency,
            ["Value"] = 1000
        }),
        v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "GobbleGobbleEmote"
        }),
        v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "FallPlayerCard"
        })
    }
}
return v4(v5)