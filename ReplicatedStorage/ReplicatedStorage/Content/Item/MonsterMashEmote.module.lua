-- Decompiled game.ReplicatedStorage.Content.Item.MonsterMashEmote

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Monster Mash",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Type"] = v1.Type.Emote,
    ["Description"] = "Obtained by buying the upgraded Bundle in Season 8",
    ["Asset"] = "rbxassetid://74010158851616"
}
local v4 = {
    ["Sound"] = {
        ["Id"] = "rbxassetid://35930009",
        ["Volume"] = 0.6,
        ["RollOffMaxDistance"] = 50
    },
    ["IsWalkable"] = true,
    ["Looped"] = true,
    ["SpeedMultiplier"] = 0.6
}
v3.Metadata = v4
return v2(v3)