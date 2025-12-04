-- Decompiled game.ReplicatedStorage.Content.Item.EggHatchScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Egg Hatch Score Effect",
    ["Rarity"] = v1.Rarity.Type.Epic,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained by opening an Easter Egg",
    ["Icon"] = "rbxassetid://130606971075231",
    ["Group"] = v1.Group.Season2
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://73712175155184"
    }
}
v3.Metadata = v4
return v2(v3)