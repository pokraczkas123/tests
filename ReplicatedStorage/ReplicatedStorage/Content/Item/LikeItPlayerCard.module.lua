-- Decompiled game.ReplicatedStorage.Content.Item.LikeItPlayerCard

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Like It",
    ["Rarity"] = v1.Rarity.Type.Common,
    ["Type"] = v1.Type.PlayerCard,
    ["Description"] = "Like and Favorite the game!",
    ["Asset"] = "rbxassetid://84433987148923",
    ["Metadata"] = {
        ["Color"] = Color3.fromRGB(106, 229, 13)
    }
}
return v2(v3)