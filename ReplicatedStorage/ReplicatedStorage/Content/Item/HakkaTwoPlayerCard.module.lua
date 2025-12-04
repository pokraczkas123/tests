-- Decompiled game.ReplicatedStorage.Content.Item.HakkaTwoPlayerCard

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Common.Objective)
local v4 = require(v1.Tools.Sprite)
local v5 = v2.new
local v6 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Hacker Player Card",
    ["Rarity"] = v2.Rarity.Type.Common,
    ["Type"] = v2.Type.PlayerCard,
    ["Description"] = "Obtained by reaching Mastery Level 3 for Hakka",
    ["Asset"] = v4.new({
        ["FrameRate"] = 3,
        ["Frames"] = { "rbxassetid://73541337621384", "rbxassetid://108051092575167" }
    })
}
local v7 = {
    ["Objective"] = v3.new({
        ["Type"] = v3.Type.None,
        ["Value"] = 1,
        ["IsHidden"] = true
    }),
    ["Color"] = Color3.fromRGB(0, 255, 0)
}
v6.Metadata = v7
return v5(v6)