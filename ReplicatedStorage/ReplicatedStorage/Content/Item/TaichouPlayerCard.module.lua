-- Decompiled game.ReplicatedStorage.Content.Item.TaichouPlayerCard

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Tools.Sprite)
local v4 = require(v1.Common.Objective)
local v5 = v2.new
local v6 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Taichou Chilling",
    ["Rarity"] = v2.Rarity.Type.Common,
    ["Type"] = v2.Type.PlayerCard,
    ["Description"] = "Obtained by reaching Mastery Level 4 for Taichou",
    ["Asset"] = v3.new({
        ["FrameRate"] = 4,
        ["Frames"] = {
            "rbxassetid://104278992258071",
            "rbxassetid://126431735234896",
            "rbxassetid://130174544363111",
            "rbxassetid://126431735234896"
        }
    })
}
local v7 = {
    ["Objective"] = v4.new({
        ["Type"] = v4.Type.None,
        ["Value"] = 1,
        ["IsHidden"] = true
    }),
    ["Color"] = Color3.new(1, 0.6, 0)
}
v6.Metadata = v7
return v5(v6)