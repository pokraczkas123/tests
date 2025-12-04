-- Decompiled game.ReplicatedStorage.Content.Item.WhirlpoolScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Whirlpool Score Effect",
    ["Rarity"] = v1.Rarity.Type.Legendary,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained by buying the upgraded Summer Bundle in Season 5",
    ["Icon"] = "rbxassetid://134703216388664",
    ["Group"] = v1.Group.Season5
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://95751425971730"
    }
}
v3.Metadata = v4
return v2(v3)