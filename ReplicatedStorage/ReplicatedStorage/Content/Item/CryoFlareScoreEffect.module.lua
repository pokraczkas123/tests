-- Decompiled game.ReplicatedStorage.Content.Item.CryoFlareScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Cyro Flare Score Effect",
    ["Rarity"] = v1.Rarity.Type.Epic,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained by opening a Crate in Season 5",
    ["Icon"] = "rbxassetid://77527858125775",
    ["Group"] = v1.Group.Season5
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://92910665913971"
    }
}
v3.Metadata = v4
return v2(v3)