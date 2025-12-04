-- Decompiled game.ReplicatedStorage.Content.Style.Yogan.Special

local v1 = game:GetService("RunService"):IsStudio()
local v2 = game:GetService("ReplicatedStorage")
return require(v2.Content.Special).get("Yogan", {
    ["Requirement"] = v1 and 30 or 100,
    ["PointMap"] = {
        ["Bump"] = 18,
        ["Set"] = 18,
        ["Dive"] = 25
    },
    ["IgnoreActions"] = {
        "Serves",
        "Bump",
        "Set",
        "JumpSet",
        "Dive"
    },
    ["MaxActions"] = 8,
    ["UseSpecialButton"] = true,
    ["ActionText"] = "Rage",
    ["ActionImage"] = {
        ["Image"] = "rbxassetid://115129546751932"
    },
    ["ActionGradient"] = {
        ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#ff5233")), ColorSequenceKeypoint.new(0.5, Color3.fromHex("#b73527")), ColorSequenceKeypoint.new(1, Color3.fromHex("#7f1f1b")) }),
        ["Offset"] = Vector2.new(0, 0),
        ["Rotation"] = 0
    },
    ["ActionChargeBar"] = {
        ["ActiveColor"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#b73527")), ColorSequenceKeypoint.new(1, Color3.fromHex("#ff0000")) })
    }
})