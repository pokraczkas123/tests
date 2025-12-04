-- Decompiled game.ReplicatedStorage.Content.Item.AceCardsPlayerCard

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Common.Objective)
local v4 = v2.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Ace Cards",
    ["Rarity"] = v2.Rarity.Type.Common,
    ["Type"] = v2.Type.PlayerCard,
    ["Description"] = "empty",
    ["Asset"] = "rbxassetid://105035232991666"
}
local v6 = {
    ["Stat"] = "Aces",
    ["Objective"] = v3.new({
        ["Type"] = v3.Type.Aces,
        ["Value"] = 1000
    }),
    ["Color"] = Color3.fromRGB(242, 151, 5)
}
v5.Metadata = v6
return v4(v5)