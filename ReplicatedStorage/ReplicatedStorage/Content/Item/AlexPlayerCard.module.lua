-- Decompiled game.ReplicatedStorage.Content.Item.AlexPlayerCard

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Alex Player Card",
    ["Rarity"] = v1.Rarity.Type.Secret,
    ["Type"] = v1.Type.PlayerCard,
    ["Description"] = "You are my favorite developer -Kareem",
    ["Asset"] = "rbxassetid://132875444287209",
    ["Metadata"] = {
        ["IsDeveloperExclusive"] = true,
        ["IsHiddenFromInventory"] = true,
        ["Color"] = Color3.new(0, 0, 0.4)
    }
}
return v2(v3)