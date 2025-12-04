-- Decompiled game.ReplicatedStorage.Content.Pack.Robux

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["IsInShop"] = true,
    ["Id"] = script.Name,
    ["DisplayName"] = "Robux",
    ["Description"] = "Chances of the best Volleyball Skins in game!",
    ["Image"] = "rbxassetid://107947793618777",
    ["Distribution"] = {
        [v1.Rarity.Type.Common] = 0.48,
        [v1.Rarity.Type.Rare] = 0.3,
        [v1.Rarity.Type.Epic] = 0.18,
        [v1.Rarity.Type.Legendary] = 0.06,
        [v1.Rarity.Type.Godly] = 0.01
    },
    ["LuckyDistribution"] = {
        [v1.Rarity.Type.Common] = 0.48,
        [v1.Rarity.Type.Rare] = 0.3,
        [v1.Rarity.Type.Epic] = 0.18,
        [v1.Rarity.Type.Legendary] = 0.06,
        [v1.Rarity.Type.Godly] = 0.01
    },
    ["Content"] = {
        "MoonBall",
        "PhoenixBall",
        "PixelBall",
        "HackerBall",
        "HamburgerBall"
    },
    ["Palette"] = {
        ["Primary"] = Color3.fromRGB(255, 0, 251),
        ["Background"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 251)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 183, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(238, 0, 255)) }),
        ["Stroke"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(106, 0, 255)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(251, 255, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(106, 0, 255)) })
    }
}
return v2(v3)