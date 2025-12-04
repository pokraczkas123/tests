-- Decompiled game.ReplicatedStorage.Content.Item.LoadBarPlayerCard

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Common.Objective)
local v4 = v2.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Load Bar",
    ["Rarity"] = v2.Rarity.Type.Common,
    ["Type"] = v2.Type.PlayerCard,
    ["Description"] = "empty",
    ["Asset"] = "rbxassetid://136584068976232"
}
local v6 = {
    ["Objective"] = v3.new({
        ["Type"] = v3.Type.Wins,
        ["Value"] = 50
    }),
    ["Color"] = Color3.fromRGB(26, 143, 0)
}
v5.Metadata = v6
return v4(v5)