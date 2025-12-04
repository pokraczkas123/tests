-- Decompiled game.ReplicatedStorage.Content.Item.FallPlayerCard

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Common.Objective)
local v4 = require(v1.Tools.Sprite)
local v5 = v2.new
local v6 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Fall PlayerCard",
    ["Rarity"] = v2.Rarity.Type.Common,
    ["Type"] = v2.Type.PlayerCard,
    ["Description"] = "empty",
    ["Asset"] = v4.new({
        ["FrameRate"] = 1,
        ["Frames"] = { "rbxassetid://97633388410348", "rbxassetid://127107134564766" }
    })
}
local v7 = {
    ["Objective"] = v3.new({
        ["Type"] = v3.Type.None,
        ["Value"] = 1,
        ["IsHidden"] = true
    }),
    ["Color"] = Color3.new(1, 0.6, 0)
}
v6.Metadata = v7
return v5(v6)