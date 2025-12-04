-- Decompiled game.ReplicatedStorage.Content.Bundle.FestivalBundle2

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Reward)
local v4 = v2.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Festival Bundle",
    ["Group"] = "FestivalBundleSeason6",
    ["Image"] = "rbxassetid://90758942159015",
    ["Color"] = Color3.fromRGB(255, 155, 5),
    ["Timestamp"] = {
        ["Start"] = DateTime.fromUniversalTime(2025, 3, 23, 18, 0, 0).UnixTimestamp,
        ["End"] = DateTime.fromUniversalTime(2025, 8, 9, 15, 30, 0).UnixTimestamp
    },
    ["Rewards"] = {
        v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "CakeBall"
        }),
        v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "ConfettiTitle"
        }),
        v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "ColorfulFireScoreEffect"
        }),
        v3.new({
            ["Type"] = v3.Type.SeasonalCurrency,
            ["Value"] = 500
        })
    }
}
return v4(v5)