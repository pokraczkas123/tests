-- Decompiled game.ReplicatedStorage.Content.Item.SpellCasterScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Spell Caster Score Effect",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained by opening a Crate in Season 3",
    ["Icon"] = "rbxassetid://114408080174522",
    ["Group"] = v1.Group.Season3
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://89842135861884",
        ["PlaybackSpeed"] = NumberRange.new(0.7, 0.8)
    }
}
v3.Metadata = v4
return v2(v3)