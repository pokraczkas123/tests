-- Decompiled game.ReplicatedStorage.Content.Season.3

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Content.Reward)
local v3 = require(v1.Content.Crate)
local v4 = require(script.Parent)
local v5 = require(script.Quests)
local v6 = require(script.Rewards)
local v7 = v4.new
local v8 = {
    ["Id"] = "3",
    ["DisplayName"] = "Season 3",
    ["Currency"] = {
        ["DisplayName"] = "Crystals",
        ["Icon"] = "rbxassetid://136906980077841"
    },
    ["Timestamp"] = {
        ["Start"] = DateTime.fromUniversalTime(2025, 4, 21, 15, 30, 0).UnixTimestamp,
        ["End"] = DateTime.fromUniversalTime(2025, 5, 20, 15, 30, 0).UnixTimestamp
    },
    ["Rewards"] = v6
}
local v9 = {
    [v4.Ranks.Type.Bronze1] = v2.new({
        ["Type"] = "Item",
        ["Value"] = "SadViolinEmote"
    }),
    [v4.Ranks.Type.Silver1] = v2.new({
        ["Type"] = "Item",
        ["Value"] = "SilverBall"
    }),
    [v4.Ranks.Type.Gold1] = v2.new({
        ["Type"] = "Item",
        ["Value"] = "GoldCoinBall"
    }),
    [v4.Ranks.Type.Diamond1] = v2.new({
        ["Type"] = "Item",
        ["Value"] = "OvergrownCrystalBall"
    }),
    [v4.Ranks.Type.Pro] = v2.new({
        ["Type"] = "Item",
        ["Value"] = "Season3ProScoreEffect"
    })
}
v8.RankedRewards = v9
local v10 = {
    ["Reward"] = v2.new({
        ["Type"] = v2.Type.Item,
        ["Value"] = "MetaBlastScoreEffect"
    }),
    ["Requirement"] = 5,
    ["MaximumAllowedWithCurrency"] = 3,
    ["CurrencyCost"] = 25000
}
v8.Rebirth = v10
v8.Crate = { v3:Get("WizardCrate1"), v3:Get("WizardCrate2") }
v8.ExperiencePerTier = 100
v8.Quests = v5
return v7(v8)