-- Decompiled game.ReplicatedStorage.Content.Bundle.EasterBundle1

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Reward)
local v4 = v2.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Easter Bundle",
    ["Group"] = "EasterBundleSeason2",
    ["Image"] = "rbxassetid://87582802772468",
    ["Color"] = Color3.fromRGB(38, 255, 5),
    ["Timestamp"] = {
        ["Start"] = DateTime.fromUniversalTime(2025, 3, 23, 18, 0, 0).UnixTimestamp,
        ["End"] = DateTime.fromUniversalTime(2025, 4, 12, 15, 30, 0).UnixTimestamp
    },
    ["Rewards"] = { v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "PastelSwirlEggBall"
        }), v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "PastelSwirlScoreEffect"
        }) }
}
return v4(v5)