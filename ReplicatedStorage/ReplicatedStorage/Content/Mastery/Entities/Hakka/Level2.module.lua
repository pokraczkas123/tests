-- Decompiled game.ReplicatedStorage.Content.Mastery.Entities.Hakka.Level2

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent.Parent.Parent.MasteryLevel)
local v3 = require(v1.Content.Reward)
local v4 = v2.new
local v5 = {
    ["Quests"] = require(script.Quests),
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.Custom,
        ["Value"] = "Clones get MAX Block",
        ["Icon"] = "rbxassetid://134764357067915"
    })
}
return v4(v5)