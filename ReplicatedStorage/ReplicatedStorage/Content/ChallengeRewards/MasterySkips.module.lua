-- Decompiled game.ReplicatedStorage.Content.ChallengeRewards.MasterySkips

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Tools.ValueCurve)
local v3 = require(script.Parent)
local v4 = v3.new
local v5 = {
    ["Id"] = script.Name,
    ["Type"] = v3.Type.Item,
    ["Value"] = "MasteryChallengeSkipIngredient"
}
local v6 = v2.new
local v7 = {
    ["Values"] = {
        [1] = NumberRange.new(0),
        [20] = NumberRange.new(10)
    },
    ["Lerp"] = true
}
v5.Weight = v6(v7)
v5.Quantity = 1
return v4(v5)