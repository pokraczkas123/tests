-- Decompiled game.ReplicatedStorage.Content.Mastery.Entities.Hidari.Level3

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent.Parent.Parent.MasteryLevel)
local v3 = require(v1.Content.Reward)
local v4 = v2.new
local v5 = {
    ["Quests"] = require(script.Quests),
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.LuckyStyleSpins,
        ["Value"] = 7
    })
}
return v4(v5)