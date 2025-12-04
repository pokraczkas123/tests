-- Decompiled game.ReplicatedStorage.Content.Item.EvilLaughEmote

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Evil Laugh",
    ["Rarity"] = v1.Rarity.Type.Common,
    ["Type"] = v1.Type.Emote,
    ["Description"] = "Obtained by opening a Crate in Season 7",
    ["Asset"] = "rbxassetid://99440464833577"
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://89233640155520",
        ["Volume"] = 0.9
    }
}
v3.Metadata = v4
return v2(v3)