-- Decompiled game.ReplicatedStorage.Content.Item.BlueFlamethrowerPlayerCard

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Common.Objective)
local v4 = require(v1.Tools.Sprite)
local v5 = v2.new
local v6 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Blue Fire Yogan Player Card",
    ["Rarity"] = v2.Rarity.Type.Common,
    ["Type"] = v2.Type.PlayerCard,
    ["Description"] = "Obtained by reaching Mastery Level 4 for Yogan",
    ["Asset"] = v4.new({
        ["FrameRate"] = 8,
        ["Frames"] = {
            "rbxassetid://81119382760066",
            "rbxassetid://113547864220379",
            "rbxassetid://102151475283946",
            "rbxassetid://124340214723489"
        }
    })
}
local v7 = {
    ["Objective"] = v3.new({
        ["Type"] = v3.Type.None,
        ["Value"] = 1,
        ["IsHidden"] = true
    }),
    ["Color"] = Color3.fromRGB(0, 10, 102)
}
v6.Metadata = v7
return v5(v6)