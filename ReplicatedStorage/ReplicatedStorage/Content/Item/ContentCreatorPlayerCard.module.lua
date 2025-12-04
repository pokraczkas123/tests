-- Decompiled game.ReplicatedStorage.Content.Item.ContentCreatorPlayerCard

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Content Creator Player Card",
    ["Rarity"] = v1.Rarity.Type.Legendary,
    ["Type"] = v1.Type.PlayerCard,
    ["Description"] = "Obtained by being a Content Creator!",
    ["Asset"] = "rbxassetid://137660180844782",
    ["Metadata"] = {
        ["IsHiddenFromInventory"] = true,
        ["Color"] = Color3.fromRGB(30, 0, 48)
    }
}
return v2(v3)