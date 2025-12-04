-- Decompiled game.ReplicatedStorage.Content.Item.IHelpOutPlayerCard

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Common.Objective)
local v4 = v2.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "I Help Out",
    ["Rarity"] = v2.Rarity.Type.Common,
    ["Type"] = v2.Type.PlayerCard,
    ["Description"] = "empty",
    ["Asset"] = "rbxassetid://114476131535710"
}
local v6 = {
    ["Stat"] = "Assists",
    ["Objective"] = v3.new({
        ["Type"] = v3.Type.Assists,
        ["Value"] = 888
    }),
    ["Color"] = Color3.fromRGB(242, 242, 242)
}
v5.Metadata = v6
return v4(v5)