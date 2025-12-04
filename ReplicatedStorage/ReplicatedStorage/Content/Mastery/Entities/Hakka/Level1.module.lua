-- Decompiled game.ReplicatedStorage.Content.Mastery.Entities.Hakka.Level1

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent.Parent.Parent.MasteryLevel)
local v3 = require(v1.Content.Reward)
local v4 = v2.new
local v5 = {
    ["Quests"] = require(script.Quests),
    ["Reward"] = v3.new({
        ["Type"] = v3.Type.Custom,
        ["Value"] = "+10% Clone Charge Speed",
        ["Icon"] = "rbxassetid://128689519226132"
    })
}
return v4(v5)