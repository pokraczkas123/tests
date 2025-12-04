-- Decompiled game.ReplicatedStorage.Content.Bundle.HalloweenBundle2

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Reward)
local v4 = v2.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "The Cursed Bundle",
    ["Group"] = "SpookyBundleSeason8",
    ["Image"] = "rbxassetid://91044791000349",
    ["Color"] = Color3.fromRGB(38, 255, 5),
    ["Timestamp"] = {
        ["Start"] = DateTime.fromUniversalTime(2025, 3, 23, 18, 0, 0).UnixTimestamp,
        ["End"] = DateTime.fromUniversalTime(2025, 10, 11, 15, 30, 0).UnixTimestamp
    },
    ["Rewards"] = {
        v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "SpiritBall"
        }),
        v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "HeadlessEmote"
        }),
        v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "CursedTitle"
        }),
        v3.new({
            ["Type"] = v3.Type.SeasonalCurrency,
            ["Value"] = 1000
        })
    }
}
return v4(v5)