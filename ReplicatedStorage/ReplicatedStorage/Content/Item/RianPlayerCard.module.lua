-- Decompiled game.ReplicatedStorage.Content.Item.RianPlayerCard

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Rian Player Card",
    ["Rarity"] = v1.Rarity.Type.Secret,
    ["Type"] = v1.Type.PlayerCard,
    ["Description"] = "2 elixer",
    ["Asset"] = "rbxassetid://115480263361863",
    ["Metadata"] = {
        ["IsHiddenFromInventory"] = true,
        ["IsDeveloperExclusive"] = true,
        ["Color"] = Color3.new(1, 1, 1)
    }
}
return v2(v3)