-- Decompiled game.ReplicatedStorage.Content.Item.OwnerTitle

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Owner",
    ["Rarity"] = v1.Rarity.Type.Secret,
    ["Type"] = v1.Type.Title,
    ["Description"] = "You own Volleyball Legends!",
    ["Metadata"] = {
        ["Color"] = Color3.fromRGB(233, 17, 240)
    }
}
return v2(v3)