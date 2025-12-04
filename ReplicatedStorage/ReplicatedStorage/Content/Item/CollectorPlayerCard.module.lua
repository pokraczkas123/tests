-- Decompiled game.ReplicatedStorage.Content.Item.CollectorPlayerCard

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Common.Objective)
local v4 = v2.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Collector",
    ["Rarity"] = v2.Rarity.Type.Common,
    ["Type"] = v2.Type.PlayerCard,
    ["Description"] = "empty",
    ["Asset"] = "rbxassetid://127784653293710"
}
local v6 = {
    ["Objective"] = v3.new({
        ["Type"] = v3.Type.UniqueItems,
        ["Key"] = "Ball",
        ["DisplayName"] = "Unique Balls Collected",
        ["Value"] = 50
    }),
    ["Color"] = Color3.fromRGB(36, 105, 166)
}
v5.Metadata = v6
return v4(v5)