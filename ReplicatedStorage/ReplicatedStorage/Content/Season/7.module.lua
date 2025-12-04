-- Decompiled game.ReplicatedStorage.Content.Season.7

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Content.Reward)
local v3 = require(v1.Content.Crate)
local v4 = require(script.Parent)
local v5 = require(script.Quests)
local v6 = require(script.Rewards)
local v7 = v4.new
local v8 = {
    ["Id"] = "7",
    ["DisplayName"] = "Season 7",
    ["Currency"] = {
        ["DisplayName"] = "Two-Faced Coin",
        ["Icon"] = "rbxassetid://130678565978292"
    },
    ["Timestamp"] = {
        ["Start"] = DateTime.fromUniversalTime(2025, 6, 23, 15, 30, 0).UnixTimestamp,
        ["End"] = DateTime.fromUniversalTime(2025, 9, 26, 15, 30, 0).UnixTimestamp
    },
    ["Rewards"] = v6
}
local v9 = {
    [v4.Ranks.Type.Bronze1] = v2.new({
        ["Type"] = v2.Type.Item,
        ["Value"] = "ArrowBall"
    }),
    [v4.Ranks.Type.Bronze2] = v2.new({
        ["Type"] = v2.Type.LuckyStyleSpins,
        ["Value"] = 3
    }),
    [v4.Ranks.Type.Bronze3] = v2.new({
        ["Type"] = v2.Type.Currency,
        ["Value"] = 2500
    }),
    [v4.Ranks.Type.Silver1] = v2.new({
        ["Type"] = v2.Type.Item,
        ["Value"] = "SilverMikageHeadBall"
    }),
    [v4.Ranks.Type.Silver2] = v2.new({
        ["Type"] = v2.Type.LuckyAbilitySpins,
        ["Value"] = 5
    }),
    [v4.Ranks.Type.Silver3] = v2.new({
        ["Type"] = v2.Type.StyleSpins,
        ["Value"] = 15
    }),
    [v4.Ranks.Type.Gold1] = v2.new({
        ["Type"] = v2.Type.Item,
        ["Value"] = "WitchesBrewEmote"
    }),
    [v4.Ranks.Type.Gold2] = v2.new({
        ["Type"] = v2.Type.LuckyStyleSpins,
        ["Value"] = 7
    }),
    [v4.Ranks.Type.Gold3] = v2.new({
        ["Type"] = v2.Type.LuckyAbilitySpins,
        ["Value"] = 8
    }),
    [v4.Ranks.Type.Diamond1] = v2.new({
        ["Type"] = v2.Type.Item,
        ["Value"] = "DiamondSnowGlobeBall"
    }),
    [v4.Ranks.Type.Diamond2] = v2.new({
        ["Type"] = v2.Type.Currency,
        ["Value"] = 5000
    }),
    [v4.Ranks.Type.Diamond3] = v2.new({
        ["Type"] = v2.Type.LuckyStyleSpins,
        ["Value"] = 10
    }),
    [v4.Ranks.Type.Pro] = v2.new({
        ["Type"] = v2.Type.Item,
        ["Value"] = "Season7ProScoreEffect"
    })
}
v8.RankedRewards = v9
local v10 = {
    ["Reward"] = v2.new({
        ["Type"] = v2.Type.Item,
        ["Value"] = "SpiritExplosionScoreEffect"
    }),
    ["Requirement"] = 5,
    ["MaximumAllowedWithCurrency"] = 3,
    ["CurrencyCost"] = 25000
}
v8.Rebirth = v10
v8.Crate = { v3:Get("EternalCrate") }
v8.ExperiencePerTier = 125
v8.Quests = v5
return v7(v8)