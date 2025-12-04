-- Decompiled game.ReplicatedStorage.Content.Season.4

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Content.Reward)
local v3 = require(v1.Content.Crate)
local v4 = require(script.Parent)
local v5 = require(script.Quests)
local v6 = require(script.Rewards)
local v7 = v4.new
local v8 = {
    ["Id"] = "4",
    ["DisplayName"] = "Season 4",
    ["Currency"] = {
        ["DisplayName"] = "Shells",
        ["Icon"] = "rbxassetid://89072668823533"
    },
    ["Timestamp"] = {
        ["Start"] = DateTime.fromUniversalTime(2025, 5, 20, 15, 30, 0).UnixTimestamp,
        ["End"] = DateTime.fromUniversalTime(2025, 6, 28, 15, 30, 0).UnixTimestamp
    },
    ["Rewards"] = v6
}
local v9 = {
    [v4.Ranks.Type.Bronze1] = v2.new({
        ["Type"] = "Item",
        ["Value"] = "TongueEmote"
    }),
    [v4.Ranks.Type.Silver1] = v2.new({
        ["Type"] = "Item",
        ["Value"] = "SpikyBall"
    }),
    [v4.Ranks.Type.Gold1] = v2.new({
        ["Type"] = "Item",
        ["Value"] = "ShellBall"
    }),
    [v4.Ranks.Type.Diamond1] = v2.new({
        ["Type"] = "Item",
        ["Value"] = "GoldenDiamondBall"
    }),
    [v4.Ranks.Type.Pro] = v2.new({
        ["Type"] = "Item",
        ["Value"] = "Season4ProScoreEffect"
    })
}
v8.RankedRewards = v9
local v10 = {
    ["Reward"] = v2.new({
        ["Type"] = v2.Type.Item,
        ["Value"] = "TsunamiScoreEffect"
    }),
    ["Requirement"] = 5,
    ["MaximumAllowedWithCurrency"] = 3,
    ["CurrencyCost"] = 25000
}
v8.Rebirth = v10
v8.Crate = { v3:Get("BeachCrate") }
v8.ExperiencePerTier = 100
v8.Quests = v5
return v7(v8)