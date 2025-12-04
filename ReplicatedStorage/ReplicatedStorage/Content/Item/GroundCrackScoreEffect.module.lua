-- Decompiled game.ReplicatedStorage.Content.Item.GroundCrackScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Ground Crack",
    ["Rarity"] = v1.Rarity.Type.Legendary,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained by reaching Mastery Level 1 for Timeskip Ozaku",
    ["Icon"] = "rbxassetid://84139654888522",
    ["Group"] = v1.Group.Mastery
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://109095345830844"
    }
}
v3.Metadata = v4
return v2(v3)