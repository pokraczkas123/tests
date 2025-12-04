-- Decompiled game.ReplicatedStorage.Content.Mastery.Entities.TeamCaptain.Level4

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent.Parent.Parent.MasteryLevel)
local v3 = require(v1.Content.Reward)
local v4 = v2.new
local v5 = {
    ["Quests"] = require(script.Quests),
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.Item,
        ["Value"] = "TaichouPlayerCard"
    })
}
return v4(v5)