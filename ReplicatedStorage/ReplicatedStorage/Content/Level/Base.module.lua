-- Decompiled game.ReplicatedStorage.Content.Level.Base

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Content.Reward)
return {
    v2.new({
        ["Type"] = v2.Type.AbilitySpins,
        ["Value"] = 1
    }),
    v2.new({
        ["Type"] = v2.Type.Currency,
        ["Value"] = 150
    }),
    v2.new({
        ["Type"] = v2.Type.StyleSpins,
        ["Value"] = 2
    }),
    v2.new({
        ["Type"] = v2.Type.Currency,
        ["Value"] = 150
    }),
    v2.new({
        ["Type"] = v2.Type.LuckyStyleSpins,
        ["Value"] = 1
    })
}