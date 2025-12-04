-- Decompiled game.ReplicatedStorage.Content.Season.0

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Reward)
local v4 = v2.new
local v5 = {
    ["Id"] = "0",
    ["DisplayName"] = "Season 0",
    ["Currency"] = {
        ["DisplayName"] = "DNE",
        ["Icon"] = ""
    },
    ["Timestamp"] = {
        ["Start"] = DateTime.fromUniversalTime(2025, 1, 7, 0, 0, 0).UnixTimestamp,
        ["End"] = DateTime.fromUniversalTime(2025, 2, 21, 18, 0, 0).UnixTimestamp
    },
    ["Rewards"] = {
        ["Regular"] = {},
        ["Premium"] = {}
    }
}
local v6 = {
    [v2.Ranks.Type.Bronze1] = v3.new({
        ["Type"] = "Item",
        ["Value"] = "SadTromboneEmote"
    }),
    [v2.Ranks.Type.Silver1] = v3.new({
        ["Type"] = "Item",
        ["Value"] = "SubspaceBall"
    }),
    [v2.Ranks.Type.Gold1] = v3.new({
        ["Type"] = "Item",
        ["Value"] = "GoldScoreEffect"
    }),
    [v2.Ranks.Type.Diamond1] = v3.new({
        ["Type"] = "Item",
        ["Value"] = "DiamondBall"
    }),
    [v2.Ranks.Type.Pro] = v3.new({
        ["Type"] = "Item",
        ["Value"] = "Season0ProScoreEffect"
    })
}
v5.RankedRewards = v6
v5.Crate = {}
v5.ExperiencePerTier = 100
v5.Quests = {}
return v4(v5)