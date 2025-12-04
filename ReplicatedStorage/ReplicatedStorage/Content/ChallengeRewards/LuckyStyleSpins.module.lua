-- Decompiled game.ReplicatedStorage.Content.ChallengeRewards.LuckyStyleSpins

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Tools.ValueCurve)
local v3 = require(script.Parent)
local v4 = v3.new
local v5 = {
    ["Id"] = script.Name,
    ["Type"] = v3.Type.LuckyStyleSpins,
    ["Weight"] = 100
}
local v6 = v2.new
local v7 = {
    ["Values"] = {
        [0] = NumberRange.new(1),
        [10] = NumberRange.new(1, 2)
    }
}
v5.Quantity = v6(v7)
return v4(v5)