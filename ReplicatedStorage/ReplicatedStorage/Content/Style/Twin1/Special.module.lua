-- Decompiled game.ReplicatedStorage.Content.Style.Twin1.Special

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Content.Special).get
local v3 = {
    ["Spring"] = {
        ["Speed"] = 100,
        ["Damping"] = 1
    },
    ["Style"] = "Twin2",
    ["Debounce"] = 5,
    ["ActionText"] = "Swap",
    ["ActionImage"] = {
        ["Image"] = "rbxassetid://115129546751932"
    },
    ["ActionGradient"] = {
        ["Color"] = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(254, 38, 0)),
            ColorSequenceKeypoint.new(0.484, Color3.fromRGB(255, 211, 0)),
            ColorSequenceKeypoint.new(0.498, Color3.fromRGB(76, 103, 116)),
            ColorSequenceKeypoint.new(0.571, Color3.fromRGB(154, 193, 214)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 33, 244))
        }),
        ["Offset"] = Vector2.new(-0.01, 0),
        ["Rotation"] = 19
    }
}
return v2("TheTwins", v3)