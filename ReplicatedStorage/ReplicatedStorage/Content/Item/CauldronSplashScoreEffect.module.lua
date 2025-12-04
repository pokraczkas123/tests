-- Decompiled game.ReplicatedStorage.Content.Item.CauldronSplashScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Cauldron Score Effect",
    ["Rarity"] = v1.Rarity.Type.Rare,
    ["Type"] = v1.Type.ScoreEffect,
    ["Icon"] = "rbxassetid://117025223584108",
    ["Description"] = "Obtained by opening a Crate in Season 3",
    ["Group"] = v1.Group.Season3
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://89842135861884"
    }
}
v3.Metadata = v4
return v2(v3)