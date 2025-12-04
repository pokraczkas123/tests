-- Decompiled game.ReplicatedStorage.Content.Item.PlacePlayerCard

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "PlaceReboot Player Card",
    ["Rarity"] = v1.Rarity.Type.Secret,
    ["Type"] = v1.Type.PlayerCard,
    ["Description"] = "You are PlaceReboot!",
    ["Asset"] = "rbxassetid://138302083935647",
    ["Metadata"] = {
        ["IsDeveloperExclusive"] = true,
        ["IsHiddenFromInventory"] = true,
        ["Color"] = Color3.new(0, 0, 0.2)
    }
}
return v2(v3)