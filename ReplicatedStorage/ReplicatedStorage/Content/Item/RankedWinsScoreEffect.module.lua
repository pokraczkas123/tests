-- Decompiled game.ReplicatedStorage.Content.Item.RankedWinsScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Ranked Wins",
    ["Rarity"] = v1.Rarity.Type.Legendary,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained by opening a Diamond Egg",
    ["Icon"] = "rbxassetid://82013210317827",
    ["Group"] = v1.Group.Season2
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://74337214950834"
    }
}
v3.Metadata = v4
return v2(v3)