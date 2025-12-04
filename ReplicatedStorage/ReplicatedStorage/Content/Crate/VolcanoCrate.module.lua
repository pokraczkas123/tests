-- Decompiled game.ReplicatedStorage.Content.Crate.VolcanoCrate

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Lottery)
local v4 = require(v1.Content.Reward)
local v5 = v2.new
local v6 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Volcano Crate",
    ["Cost"] = 200,
    ["SeasonId"] = "5",
    ["Image"] = "",
    ["Description"] = "",
    ["Content"] = v3.new({
        {
            ["Type"] = v4.Type.Item,
            ["Value"] = "LifebuoyBall",
            ["Chance"] = 0.3
        },
        {
            ["Type"] = v4.Type.Item,
            ["Value"] = "SummerHatBall",
            ["Chance"] = 0.25
        },
        {
            ["Type"] = v4.Type.SeasonalCurrency,
            ["Value"] = 200,
            ["Chance"] = 0.18
        },
        {
            ["Type"] = v4.Type.Item,
            ["Value"] = "CryoFlareScoreEffect",
            ["Chance"] = 0.1
        },
        {
            ["Type"] = v4.Type.Item,
            ["Value"] = "FlamethrowerScoreEffect",
            ["Chance"] = 0.01
        },
        {
            ["Type"] = v4.Type.Item,
            ["Value"] = "SkullScoreEffect",
            ["Chance"] = 0.04
        },
        {
            ["Type"] = v4.Type.Item,
            ["Value"] = "PinkSummerHatBall",
            ["Chance"] = 0.05
        },
        {
            ["Type"] = v4.Type.SeasonalCurrency,
            ["Value"] = 400,
            ["Chance"] = 0.07
        }
    })
}
return v5(v6)