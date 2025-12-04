-- Decompiled game.ReplicatedStorage.Content.Item.ElectricScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Electric Shock",
    ["Rarity"] = v1.Rarity.Type.Epic,
    ["Type"] = v1.Type.ScoreEffect,
    ["Icon"] = "rbxassetid://112224416615011",
    ["Description"] = "Obtained by opening Basic Score Effect Packs",
    ["Group"] = v1.Group.ScoreEffectPack
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://93064922405005"
    }
}
v3.Metadata = v4
return v2(v3)