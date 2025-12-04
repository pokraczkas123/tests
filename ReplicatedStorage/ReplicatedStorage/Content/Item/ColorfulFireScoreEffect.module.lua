-- Decompiled game.ReplicatedStorage.Content.Item.ColorfulFireScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Rainbow Fire",
    ["Rarity"] = v1.Rarity.Type.Legendary,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained by buying the upgraded Festival Bundle in Season 6",
    ["Icon"] = "rbxassetid://77992454060605",
    ["Group"] = v1.Group.Season6
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://101066206713879"
    }
}
v3.Metadata = v4
return v2(v3)