-- Decompiled game.ReplicatedStorage.Content.Item.NukeScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Tactical Nuke",
    ["Rarity"] = v1.Rarity.Type.Rare,
    ["Type"] = v1.Type.ScoreEffect,
    ["Icon"] = "rbxassetid://74386662979836",
    ["Description"] = "Obtained by opening Basic Score Effect Packs",
    ["Group"] = v1.Group.ScoreEffectPack
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://96326210689204"
    }
}
v3.Metadata = v4
return v2(v3)