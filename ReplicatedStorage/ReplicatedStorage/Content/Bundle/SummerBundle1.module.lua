-- Decompiled game.ReplicatedStorage.Content.Bundle.SummerBundle1

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Reward)
local v4 = v2.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Summer Bundle",
    ["Group"] = "SummerBundleSeason4",
    ["Image"] = "rbxassetid://81413680197601",
    ["Color"] = Color3.fromRGB(56, 221, 255),
    ["Timestamp"] = {
        ["Start"] = DateTime.fromUniversalTime(2025, 3, 23, 18, 0, 0).UnixTimestamp,
        ["End"] = DateTime.fromUniversalTime(2025, 6, 14, 15, 30, 0).UnixTimestamp
    },
    ["Rewards"] = { v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "PineappleBall"
        }), v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "TikiDrumEmote"
        }) }
}
return v4(v5)