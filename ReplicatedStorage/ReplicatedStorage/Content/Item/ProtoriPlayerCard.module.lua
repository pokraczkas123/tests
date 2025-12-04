-- Decompiled game.ReplicatedStorage.Content.Item.ProtoriPlayerCard

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Protori Player Card",
    ["Rarity"] = v1.Rarity.Type.Secret,
    ["Type"] = v1.Type.PlayerCard,
    ["Description"] = "absolutely cursed",
    ["Asset"] = "rbxassetid://86516097487088",
    ["Metadata"] = {
        ["IsHiddenFromInventory"] = true,
        ["IsDeveloperExclusive"] = true,
        ["Color"] = Color3.new(1, 1, 1)
    }
}
return v2(v3)