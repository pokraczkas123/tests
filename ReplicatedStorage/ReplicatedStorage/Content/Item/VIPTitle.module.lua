-- Decompiled game.ReplicatedStorage.Content.Item.VIPTitle

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "\240\159\145\145 VIP",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Type"] = v1.Type.Title,
    ["Description"] = "Obtained by unlocking VIP",
    ["Metadata"] = {
        ["Color"] = Color3.fromRGB(240, 247, 25)
    }
}
return v2(v3)