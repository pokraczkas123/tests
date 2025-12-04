-- Decompiled game.ReplicatedStorage.Content.Pack.Medium

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Medium",
    ["Cost"] = 600,
    ["Description"] = "This is a pack.",
    ["Distribution"] = {
        [v1.Rarity.Type.Common] = 0.48,
        [v1.Rarity.Type.Rare] = 0.32,
        [v1.Rarity.Type.Epic] = 0.15,
        [v1.Rarity.Type.Legendary] = 0.045,
        [v1.Rarity.Type.Godly] = 0.005
    },
    ["LuckyDistribution"] = {
        [v1.Rarity.Type.Common] = 0.48,
        [v1.Rarity.Type.Rare] = 0.32,
        [v1.Rarity.Type.Epic] = 0.15,
        [v1.Rarity.Type.Legendary] = 0.045,
        [v1.Rarity.Type.Godly] = 0.005
    },
    ["Content"] = {
        "BlackBall",
        "PinkBall",
        "TigerBall",
        "PaintSplatterBall",
        "KarasunoBall"
    },
    ["Palette"] = {
        ["Primary"] = Color3.fromRGB(0, 255, 30),
        ["Background"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new()), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 30)), ColorSequenceKeypoint.new(1, Color3.new()) }),
        ["Stroke"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 30)), ColorSequenceKeypoint.new(0.5, Color3.new()), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 30)) })
    }
}
return v2(v3)