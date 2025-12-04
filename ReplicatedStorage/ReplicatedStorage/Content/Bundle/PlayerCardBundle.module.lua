-- Decompiled game.ReplicatedStorage.Content.Bundle.PlayerCardBundle

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Reward)
local v4 = v2.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "PLAYERCARD BUNDLE",
    ["Group"] = "PlayerCardBundleSeason8",
    ["Image"] = "rbxassetid://86926872298527",
    ["Color"] = Color3.fromRGB(255, 5, 5),
    ["Timestamp"] = {
        ["Start"] = DateTime.fromUniversalTime(2025, 3, 23, 18, 0, 0).UnixTimestamp,
        ["End"] = DateTime.fromUniversalTime(2025, 10, 26, 15, 30, 0).UnixTimestamp
    },
    ["Rewards"] = { v3.new({
            ["Type"] = v3.Type.Item,
            ["Value"] = "YoganPlayerCard"
        }), v3.new({
            ["Type"] = v3.Type.LuckyStyleSpins,
            ["Value"] = 10
        }) }
}
return v4(v5)