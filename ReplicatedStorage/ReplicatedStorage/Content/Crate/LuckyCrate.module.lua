-- Decompiled game.ReplicatedStorage.Content.Crate.LuckyCrate

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Lottery)
local v4 = require(v1.Content.Reward)
local v5 = v2.new
local v6 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Lucky Crate",
    ["Cost"] = 100,
    ["SeasonId"] = "1",
    ["Image"] = "",
    ["Description"] = "",
    ["Content"] = v3.new({
        {
            ["Type"] = v4.Type.Item,
            ["Value"] = "CloverBall",
            ["Chance"] = 0.4
        },
        {
            ["Type"] = v4.Type.Item,
            ["Value"] = "TapDancerEmote",
            ["Chance"] = 0.3
        },
        {
            ["Type"] = v4.Type.Item,
            ["Value"] = "LuckyCloverScoreEffect",
            ["Chance"] = 0.2
        },
        {
            ["Type"] = v4.Type.Item,
            ["Value"] = "TapDancerScoreEffect",
            ["Chance"] = 0.01
        },
        {
            ["Type"] = v4.Type.Item,
            ["Value"] = "PotExplosionScoreEffect",
            ["Chance"] = 0.03
        },
        {
            ["Type"] = v4.Type.Item,
            ["Value"] = "PotOfGoldBall",
            ["Chance"] = 0.06
        }
    })
}
return v5(v6)