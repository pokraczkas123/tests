-- Decompiled game.ReplicatedStorage.Content.Pack.ScoreEffect1

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Score Effect",
    ["Cost"] = 1250,
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
        "FlameScoreEffect",
        "HeartScoreEffect",
        "IceScoreEffect",
        "LaughingScoreEffect",
        "ElectricScoreEffect",
        "NukeScoreEffect"
    },
    ["Palette"] = {
        ["Primary"] = Color3.fromRGB(255, 0, 0),
        ["Background"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new()), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1, Color3.new()) }),
        ["Stroke"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.5, Color3.new()), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0)) })
    }
}
return v2(v3)