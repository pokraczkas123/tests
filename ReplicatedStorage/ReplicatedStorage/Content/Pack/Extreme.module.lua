-- Decompiled game.ReplicatedStorage.Content.Pack.Extreme

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Extreme",
    ["Cost"] = 900,
    ["Description"] = "This is a pack.",
    ["Distribution"] = {
        [v1.Rarity.Type.Rare] = 0.595,
        [v1.Rarity.Type.Epic] = 0.365,
        [v1.Rarity.Type.Legendary] = 0.039,
        [v1.Rarity.Type.Godly] = 0.001
    },
    ["LuckyDistribution"] = {
        [v1.Rarity.Type.Rare] = 0.595,
        [v1.Rarity.Type.Epic] = 0.365,
        [v1.Rarity.Type.Legendary] = 0.039,
        [v1.Rarity.Type.Godly] = 0.001
    },
    ["Content"] = {
        "Basketball",
        "RippedBall",
        "CuteKittyBall",
        "RainbowBall",
        "BananaBall"
    },
    ["Palette"] = {
        ["Primary"] = Color3.new(1, 1, 1),
        ["Background"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new()), ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)), ColorSequenceKeypoint.new(1, Color3.new()) }),
        ["Stroke"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)), ColorSequenceKeypoint.new(0.5, Color3.new()), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1)) })
    }
}
return v2(v3)