-- Decompiled game.ReplicatedStorage.Content.Item.IceScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Ice Explosion",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Type"] = v1.Type.ScoreEffect,
    ["Icon"] = "rbxassetid://82623236943661",
    ["Description"] = "Obtained by opening Basic Score Effect Packs",
    ["Group"] = v1.Group.ScoreEffectPack
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://82751202514194"
    }
}
v3.Metadata = v4
return v2(v3)