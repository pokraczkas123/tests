-- Decompiled game.ReplicatedStorage.Content.Item.KareemPlayerCard

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Kareem Player Card",
    ["Rarity"] = v1.Rarity.Type.Secret,
    ["Type"] = v1.Type.PlayerCard,
    ["Description"] = "You are Kareem!",
    ["Asset"] = "rbxassetid://123081807790867",
    ["Metadata"] = {
        ["IsDeveloperExclusive"] = true,
        ["IsHiddenFromInventory"] = true,
        ["Color"] = Color3.new()
    }
}
return v2(v3)