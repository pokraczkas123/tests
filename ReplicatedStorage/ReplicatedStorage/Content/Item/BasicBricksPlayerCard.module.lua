-- Decompiled game.ReplicatedStorage.Content.Item.BasicBricksPlayerCard

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Common.Objective)
local v4 = v2.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Basic Bricks",
    ["Rarity"] = v2.Rarity.Type.Common,
    ["Type"] = v2.Type.PlayerCard,
    ["Description"] = "empty",
    ["Asset"] = "rbxassetid://83392564858382"
}
local v6 = {
    ["Objective"] = v3.new({
        ["Type"] = v3.Type.Aces,
        ["Value"] = 50
    }),
    ["RenderId"] = "DefaultWithTeamColor",
    ["Color"] = Color3.new(1, 1, 1),
    ["BaseColor"] = Color3.fromRGB(255, 162, 0)
}
v5.Metadata = v6
return v4(v5)