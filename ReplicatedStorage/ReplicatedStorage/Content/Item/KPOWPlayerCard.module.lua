-- Decompiled game.ReplicatedStorage.Content.Item.KPOWPlayerCard

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Common.Objective)
local v4 = v2.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "KPOW",
    ["Rarity"] = v2.Rarity.Type.Common,
    ["Type"] = v2.Type.PlayerCard,
    ["Description"] = "empty",
    ["Asset"] = "rbxassetid://83046258483873"
}
local v6 = {
    ["Stat"] = "Spikes",
    ["Objective"] = v3.new({
        ["Type"] = v3.Type.Spikes,
        ["Value"] = 2500
    }),
    ["Color"] = Color3.fromRGB(41, 31, 94)
}
v5.Metadata = v6
return v4(v5)