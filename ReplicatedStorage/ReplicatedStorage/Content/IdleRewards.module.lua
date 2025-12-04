-- Decompiled game.ReplicatedStorage.Content.IdleRewards

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Content.Reward)
return {
    v2.new({
        ["Type"] = v2.Type.Currency,
        ["Value"] = 20,
        ["Chance"] = 0.7
    }),
    v2.new({
        ["Type"] = v2.Type.Currency,
        ["Value"] = 40,
        ["Chance"] = 0.18
    }),
    v2.new({
        ["Type"] = v2.Type.Currency,
        ["Value"] = 60,
        ["Chance"] = 0.105
    }),
    v2.new({
        ["Type"] = v2.Type.SeasonalCurrency,
        ["Value"] = 100,
        ["Chance"] = 0.005
    }),
    v2.new({
        ["Type"] = v2.Type.Currency,
        ["Value"] = 200,
        ["Chance"] = 0.005
    }),
    v2.new({
        ["Type"] = v2.Type.Item,
        ["Value"] = "GriddyEmote",
        ["Chance"] = 0.004
    }),
    v2.new({
        ["Type"] = v2.Type.Item,
        ["Value"] = "WaterBall",
        ["Chance"] = 0.0008
    }),
    v2.new({
        ["Type"] = v2.Type.Currency,
        ["Value"] = 1000,
        ["Chance"] = 0.0002
    })
}