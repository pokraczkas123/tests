-- Decompiled game.ReplicatedStorage.Content.ChallengeRewards.Yen

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Tools.ValueCurve)
local v3 = require(script.Parent)
local v4 = v3.new
local v5 = {
    ["Id"] = script.Name,
    ["Type"] = v3.Type.Currency,
    ["Weight"] = 50
}
local v6 = v2.new
local v7 = {
    ["Values"] = {
        [0] = NumberRange.new(100),
        [10] = NumberRange.new(1000),
        [20] = NumberRange.new(2000)
    },
    ["Lerp"] = true
}
v5.Quantity = v6(v7)
return v4(v5)