-- Decompiled game.ReplicatedStorage.Content.Season.6

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Content.Reward)
local v3 = require(v1.Content.Crate)
local v4 = require(script.Parent)
local v5 = require(script.Quests)
local v6 = require(script.Rewards)
local v7 = v4.new
local v8 = {
    ["Id"] = "6",
    ["DisplayName"] = "Season 6",
    ["Currency"] = {
        ["DisplayName"] = "Colorful Feathers",
        ["Icon"] = "rbxassetid://130801516616949"
    },
    ["Timestamp"] = {
        ["Start"] = DateTime.fromUniversalTime(2025, 6, 23, 15, 30, 0).UnixTimestamp,
        ["End"] = DateTime.fromUniversalTime(2025, 8, 18, 15, 30, 0).UnixTimestamp
    },
    ["Rewards"] = v6
}
local v9 = {
    [v4.Ranks.Type.Bronze1] = v2.new({
        ["Type"] = "Item",
        ["Value"] = "GiftBall"
    }),
    [v4.Ranks.Type.Silver1] = v2.new({
        ["Type"] = "Item",
        ["Value"] = "PinataBall"
    }),
    [v4.Ranks.Type.Gold1] = v2.new({
        ["Type"] = "Item",
        ["Value"] = "CandleBall"
    }),
    [v4.Ranks.Type.Diamond1] = v2.new({
        ["Type"] = "Item",
        ["Value"] = "VomitEmote"
    }),
    [v4.Ranks.Type.Pro] = v2.new({
        ["Type"] = "Item",
        ["Value"] = "Season6ProScoreEffect"
    })
}
v8.RankedRewards = v9
local v10 = {
    ["Reward"] = v2.new({
        ["Type"] = v2.Type.Item,
        ["Value"] = "DivineStrikeScoreEffect"
    }),
    ["Requirement"] = 5,
    ["MaximumAllowedWithCurrency"] = 3,
    ["CurrencyCost"] = 25000
}
v8.Rebirth = v10
v8.Crate = { v3:Get("FestivalCrate") }
v8.ExperiencePerTier = 125
v8.Quests = v5
return v7(v8)