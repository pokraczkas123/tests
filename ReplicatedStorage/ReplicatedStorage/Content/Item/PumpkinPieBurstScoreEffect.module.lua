-- Decompiled game.ReplicatedStorage.Content.Item.PumpkinPieBurstScoreEffect

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Pumpkin Pie Burst Score Effect",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Type"] = v1.Type.ScoreEffect,
    ["Description"] = "Obtained in the Season 9 Premium Pass",
    ["Group"] = v1.Group.Season9,
    ["Icon"] = "rbxassetid://100324944895428"
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://93376887079032"
    }
}
v3.Metadata = v4
return v2(v3)