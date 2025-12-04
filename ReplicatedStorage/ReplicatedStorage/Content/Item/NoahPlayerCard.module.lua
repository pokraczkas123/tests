-- Decompiled game.ReplicatedStorage.Content.Item.NoahPlayerCard

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Noah Player Card",
    ["Rarity"] = v1.Rarity.Type.Secret,
    ["Type"] = v1.Type.PlayerCard,
    ["Description"] = "You are Noah!",
    ["Asset"] = "rbxassetid://109426488118081",
    ["Metadata"] = {
        ["IsHiddenFromInventory"] = true,
        ["Color"] = Color3.new(0, 0, 0.2)
    }
}
return v2(v3)