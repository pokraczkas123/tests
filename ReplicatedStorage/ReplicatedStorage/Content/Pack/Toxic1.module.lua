-- Decompiled game.ReplicatedStorage.Content.Pack.Toxic1

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["IsInShop"] = true,
    ["Id"] = script.Name,
    ["DisplayName"] = "Toxic",
    ["Description"] = "Show off how much better you are with these unique emotes.",
    ["Image"] = "rbxassetid://80464455490258",
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
        "SlowClapEmote",
        "SleepingEmote",
        "LaughEmote",
        "TenOutOfTenEmote",
        "IWinEmote",
        "HelicopterEmote"
    },
    ["Preview"] = "LaughEmote",
    ["Palette"] = {
        ["Primary"] = Color3.new(0, 1, 0),
        ["Background"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(0, 0.7, 0.5)), ColorSequenceKeypoint.new(0.5, Color3.new(0, 1, 0)), ColorSequenceKeypoint.new(1, Color3.new(0, 0.7, 0.5)) }),
        ["Stroke"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(0, 1, 0)), ColorSequenceKeypoint.new(0.5, Color3.new(0, 0.7, 0.5)), ColorSequenceKeypoint.new(1, Color3.new(0, 1, 0)) })
    }
}
return v2(v3)