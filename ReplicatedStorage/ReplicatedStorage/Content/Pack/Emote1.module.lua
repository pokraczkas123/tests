-- Decompiled game.ReplicatedStorage.Content.Pack.Emote1

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Emote",
    ["Cost"] = 850,
    ["Description"] = "This is a pack.",
    ["Distribution"] = {
        [v1.Rarity.Type.Common] = 0.45,
        [v1.Rarity.Type.Rare] = 0.36,
        [v1.Rarity.Type.Epic] = 0.12,
        [v1.Rarity.Type.Legendary] = 0.06,
        [v1.Rarity.Type.Godly] = 0.01
    },
    ["LuckyDistribution"] = {
        [v1.Rarity.Type.Common] = 0.45,
        [v1.Rarity.Type.Rare] = 0.36,
        [v1.Rarity.Type.Epic] = 0.12,
        [v1.Rarity.Type.Legendary] = 0.06,
        [v1.Rarity.Type.Godly] = 0.01
    },
    ["Content"] = {
        "BoomEmote",
        "GangnamEmote",
        "FlossEmote",
        "WormEmote",
        "LEmote",
        "DefaultDanceEmote"
    },
    ["Palette"] = {
        ["Primary"] = Color3.new(0.1, 0.2, 1),
        ["Background"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new()), ColorSequenceKeypoint.new(0.5, Color3.new(0.1, 0.2, 1)), ColorSequenceKeypoint.new(1, Color3.new()) }),
        ["Stroke"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(0.1, 0.2, 1)), ColorSequenceKeypoint.new(0.5, Color3.new()), ColorSequenceKeypoint.new(1, Color3.new(0.1, 0.2, 1)) })
    }
}
return v2(v3)