-- Decompiled game.ReplicatedStorage.Content.Item.AtmPlayerCard

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Common.Objective)
local v4 = v2.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "ATM",
    ["Rarity"] = v2.Rarity.Type.Common,
    ["Type"] = v2.Type.PlayerCard,
    ["Description"] = "empty",
    ["Asset"] = "rbxassetid://105329340839684"
}
local v6 = {
    ["Objective"] = v3.new({
        ["Type"] = v3.Type.Currency,
        ["DisplayName"] = "Yen",
        ["Value"] = 50000
    }),
    ["Color"] = Color3.fromRGB(102, 255, 0)
}
v5.Metadata = v6
return v4(v5)