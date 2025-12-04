-- Decompiled game.ReplicatedStorage.Content.Item.LaughingScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Laughing Emoji",
    ["Rarity"] = v1.Rarity.Type.Legendary,
    ["Type"] = v1.Type.ScoreEffect,
    ["Icon"] = "rbxassetid://91958552459692",
    ["Description"] = "Obtained by opening Basic Score Effect Packs",
    ["Group"] = v1.Group.ScoreEffectPack
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://133752235482238"
    }
}
v3.Metadata = v4
return v2(v3)