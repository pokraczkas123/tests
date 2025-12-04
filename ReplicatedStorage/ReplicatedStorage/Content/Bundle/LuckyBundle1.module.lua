-- Decompiled game.ReplicatedStorage.Content.Bundle.LuckyBundle1

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Reward)
local v4 = v2.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Lucky Bundle",
    ["Group"] = "LuckyBundleSeason1",
    ["Image"] = "rbxassetid://112918929749600",
    ["Color"] = Color3.fromRGB(38, 255, 5),
    ["Timestamp"] = {
        ["Start"] = DateTime.fromUniversalTime(2025, 2, 23, 18, 0, 0).UnixTimestamp,
        ["End"] = DateTime.fromUniversalTime(2025, 3, 8, 1, 52, 12).UnixTimestamp
    },
    ["Rewards"] = { v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "MoneyBall"
        }), v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "MoneyExplosionScoreEffect"
        }) }
}
return v4(v5)