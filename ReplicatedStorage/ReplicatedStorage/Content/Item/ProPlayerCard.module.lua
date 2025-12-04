-- Decompiled game.ReplicatedStorage.Content.Item.ProPlayerCard

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Common.Objective)
local v4 = v2.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Pro",
    ["Rarity"] = v2.Rarity.Type.Common,
    ["Type"] = v2.Type.PlayerCard,
    ["Description"] = "empty",
    ["Asset"] = "rbxassetid://78124611496029"
}
local v6 = {
    ["Objective"] = v3.new({
        ["Type"] = v3.Type.RankedStreak,
        ["Key"] = "Pro",
        ["DisplayName"] = "Pro Seasons in a Row",
        ["Value"] = 3
    }),
    ["Color"] = Color3.fromRGB(35, 0, 48)
}
v5.Metadata = v6
return v4(v5)