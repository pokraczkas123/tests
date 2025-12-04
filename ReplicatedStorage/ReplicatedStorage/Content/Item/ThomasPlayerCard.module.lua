-- Decompiled game.ReplicatedStorage.Content.Item.ThomasPlayerCard

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Thomas Player Card",
    ["Rarity"] = v1.Rarity.Type.Secret,
    ["Type"] = v1.Type.PlayerCard,
    ["Description"] = "*chat disabled for 3 seconds.*",
    ["Asset"] = "rbxassetid://98859731283241",
    ["Metadata"] = {
        ["IsHiddenFromInventory"] = true,
        ["Color"] = Color3.new(1, 1, 1)
    }
}
return v2(v3)