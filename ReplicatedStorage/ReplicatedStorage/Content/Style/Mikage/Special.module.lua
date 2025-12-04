-- Decompiled game.ReplicatedStorage.Content.Style.Mikage.Special

local v1 = game:GetService("RunService"):IsStudio()
local v2 = game:GetService("ReplicatedStorage")
return require(v2.Content.Special).get("Mikage", {
    ["Requirement"] = v1 and 1 or 100,
    ["PointMap"] = {
        ["Bump"] = 18,
        ["Set"] = 18,
        ["Dive"] = 25
    },
    ["MaxActions"] = 3,
    ["HitboxSize"] = Vector3.new(10, 12, 8),
    ["HitboxOffset"] = Vector3.new(0, 2, -0.9),
    ["SpecialEffect"] = "GhostArms",
    ["BlockPower"] = 2,
    ["BlockGravityFactor"] = 0.5,
    ["BlockTiltInfluence"] = 10,
    ["TiltHitboxFactor"] = 3,
    ["SpecialIcon"] = {
        ["Id"] = "rbxassetid://129940155839255",
        ["Gradient"] = ColorSequence.new(Color3.fromRGB(255, 255, 255))
    },
    ["BarGradient"] = {
        ["Offset"] = Vector2.new(0, 0),
        ["Rotation"] = 0,
        ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(169, 206, 222)), ColorSequenceKeypoint.new(0.508, Color3.fromRGB(126, 35, 253)), ColorSequenceKeypoint.new(1, Color3.fromRGB(74, 3, 255)) }),
        ["ChargedColor"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(33, 15, 135)), ColorSequenceKeypoint.new(0.508, Color3.fromRGB(129, 2, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(212, 0, 255)) })
    }
})