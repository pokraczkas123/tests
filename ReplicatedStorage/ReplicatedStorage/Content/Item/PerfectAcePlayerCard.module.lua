-- Decompiled game.ReplicatedStorage.Content.Item.PerfectAcePlayerCard

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Common.Objective)
local v4 = v2.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Perfect Ace",
    ["Rarity"] = v2.Rarity.Type.Common,
    ["Type"] = v2.Type.PlayerCard,
    ["Description"] = "Obtained by reaching Mastery Level 4 for Timeskip Ozaku",
    ["Asset"] = "rbxassetid://93460255526743"
}
local v6 = {
    ["Objective"] = v3.new({
        ["Type"] = v3.Type.None,
        ["Value"] = 1,
        ["IsHidden"] = true
    }),
    ["Color"] = Color3.fromRGB(123, 17, 209)
}
v5.Metadata = v6
return v4(v5)