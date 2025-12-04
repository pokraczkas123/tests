-- Decompiled game.ReplicatedStorage.Content.Style.Hakka.Special

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Content.Special).get
local v3 = {
    ["Requirement"] = 100,
    ["MaxActions"] = 1,
    ["PointMap"] = {
        ["Bump"] = 18,
        ["Set"] = 18,
        ["JumpSet"] = 18,
        ["Dive"] = 25,
        ["Rally"] = 10
    },
    ["ServeMaxZ"] = 0.35,
    ["Speed"] = NumberRange.new(35, 70),
    ["Distance"] = NumberRange.new(20, 45),
    ["VerticalVelocity"] = NumberRange.new(2, 5),
    ["Jerk"] = -2,
    ["InitialGravity"] = 0.1,
    ["FinalGravity"] = 1,
    ["GravityDelay"] = 0,
    ["DurationFactor"] = 0.85,
    ["MaxHeight"] = 25,
    ["ShowExtraBarAtMasteryLevel"] = 5,
    ["ClonePowerBackTilt"] = 35
}
local v4 = {
    ["Spike"] = {
        [4] = 1.5
    },
    ["Block"] = {
        [2] = 1.5
    }
}
v3.ClonePowerMasteryMap = v4
v3.UseSpecialButton = true
v3.ActionText = {
    ["Text"] = "Clone",
    ["ActiveText"] = "On",
    ["ActiveColor"] = Color3.fromRGB(102, 255, 0),
    ["ActiveGlow"] = Color3.fromRGB(47, 255, 0)
}
v3.ActionImage = {
    ["Image"] = "rbxassetid://128689519226132",
    ["OverloadImage"] = "rbxassetid://101198727655769"
}
v3.ActionGradient = {
    ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)), ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1)) }),
    ["Offset"] = Vector2.new(0, 0),
    ["Rotation"] = 0
}
v3.ActionChargeBar = {
    ["ActiveColor"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#005d55")), ColorSequenceKeypoint.new(0.508, Color3.fromHex("#00ff48")), ColorSequenceKeypoint.new(1, Color3.fromHex("#4dff00")) })
}
v3.ActionButton = {
    ["Color"] = Color3.fromRGB(255, 0, 123),
    ["ActiveColor"] = Color3.fromRGB(89, 255, 0)
}
return v2("Hakka", v3)