-- Decompiled game.ReplicatedStorage.Content.Season.1

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Content.Reward)
local v3 = require(v1.Content.Crate)
local v4 = require(script.Parent)
local v5 = require(script.Quests)
local v6 = require(script.Rewards)
local v7 = v4.new
local v8 = {
    ["Id"] = "1",
    ["DisplayName"] = "Season 1",
    ["Currency"] = {
        ["DisplayName"] = "Clovers",
        ["Icon"] = "rbxassetid://134746186501381"
    },
    ["Timestamp"] = {
        ["Start"] = DateTime.fromUniversalTime(2025, 2, 24, 18, 0, 0).UnixTimestamp,
        ["End"] = DateTime.fromUniversalTime(2025, 3, 24, 18, 0, 0).UnixTimestamp
    },
    ["Rewards"] = v6
}
local v9 = {
    [v4.Ranks.Type.Bronze1] = v2.new({
        ["Type"] = "Item",
        ["Value"] = "HeartAttackEmote"
    }),
    [v4.Ranks.Type.Silver1] = v2.new({
        ["Type"] = "Item",
        ["Value"] = "SoccerBall"
    }),
    [v4.Ranks.Type.Gold1] = v2.new({
        ["Type"] = "Item",
        ["Value"] = "GoldenStarBall"
    }),
    [v4.Ranks.Type.Diamond1] = v2.new({
        ["Type"] = "Item",
        ["Value"] = "DiamondScoreEffect"
    }),
    [v4.Ranks.Type.Pro] = v2.new({
        ["Type"] = "Item",
        ["Value"] = "Season1ProScoreEffect"
    })
}
v8.RankedRewards = v9
local v10 = {
    ["Reward"] = v2.new({
        ["Type"] = v2.Type.Item,
        ["Value"] = "LightShowScoreEffect"
    }),
    ["Requirement"] = 5,
    ["MaximumAllowedWithCurrency"] = 3,
    ["CurrencyCost"] = 25000
}
v8.Rebirth = v10
v8.Crate = { v3:Get("LuckyCrate") }
v8.ExperiencePerTier = 100
v8.Quests = v5
return v7(v8)