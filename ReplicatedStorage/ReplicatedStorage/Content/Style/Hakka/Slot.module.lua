-- Decompiled game.ReplicatedStorage.Content.Style.Hakka.Slot

local v1 = {
    ["Icon"] = {
        ["Id"] = "rbxassetid://136310590688007",
        ["Size"] = UDim2.fromScale(0.85, 0.85)
    }
}
local v2 = {
    ["Image"] = "rbxassetid://96379792403183",
    ["Gradient"] = {
        ["Enabled"] = true,
        ["Color"] = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 54, 247)),
            ColorSequenceKeypoint.new(0.123, Color3.fromRGB(0, 221, 255)),
            ColorSequenceKeypoint.new(0.254, Color3.fromRGB(122, 225, 131)),
            ColorSequenceKeypoint.new(0.454, Color3.fromRGB(250, 229, 0)),
            ColorSequenceKeypoint.new(0.632, Color3.fromRGB(255, 102, 0)),
            ColorSequenceKeypoint.new(0.931, Color3.fromRGB(210, 0, 252)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(253, 84, 0))
        })
    }
}
v1.Background = v2
local v3 = {
    ["Enabled"] = true,
    ["Gradient"] = {
        ["Color"] = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 107, 247)),
            ColorSequenceKeypoint.new(0.24, Color3.fromRGB(0, 221, 255)),
            ColorSequenceKeypoint.new(0.473, Color3.fromRGB(250, 229, 0)),
            ColorSequenceKeypoint.new(0.77, Color3.fromRGB(233, 23, 252)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(253, 0, 110))
        })
    }
}
v1.UIStroke = v3
local v4 = {
    ["FontFace"] = Font.fromId(12187360881),
    ["Gradient"] = {
        ["Color"] = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 107, 247)),
            ColorSequenceKeypoint.new(0.24, Color3.fromRGB(0, 221, 255)),
            ColorSequenceKeypoint.new(0.473, Color3.fromRGB(250, 229, 0)),
            ColorSequenceKeypoint.new(0.77, Color3.fromRGB(233, 23, 252)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(253, 0, 110))
        })
    }
}
local v5 = {
    ["Enabled"] = true,
    ["Gradient"] = {
        ["Color"] = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 107, 247)),
            ColorSequenceKeypoint.new(0.24, Color3.fromRGB(0, 221, 255)),
            ColorSequenceKeypoint.new(0.473, Color3.fromRGB(250, 229, 0)),
            ColorSequenceKeypoint.new(0.77, Color3.fromRGB(233, 23, 252)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(253, 0, 110))
        }),
        ["Rotation"] = 180
    }
}
v4.Stroke = v5
v1.Title = v4
return v1