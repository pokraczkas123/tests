-- Decompiled game.ReplicatedStorage.Content.Item.GreatWallPlayerCard

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Common.Objective)
local v4 = v2.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Great Wall",
    ["Rarity"] = v2.Rarity.Type.Common,
    ["Type"] = v2.Type.PlayerCard,
    ["Description"] = "empty",
    ["Asset"] = "rbxassetid://82834254780175"
}
local v6 = {
    ["Objective"] = v3.new({
        ["Type"] = v3.Type.Blocks,
        ["Value"] = 800
    }),
    ["Color"] = Color3.fromRGB(138, 204, 202)
}
v5.Metadata = v6
return v4(v5)