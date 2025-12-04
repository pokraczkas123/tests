-- Decompiled game.ReplicatedStorage.Content.Update.30

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "30",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 8, 2, 14, 30, 0).UnixTimestamp,
    ["DisplayName"] = "TIMESKIP HINTO RETURNS",
    ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(1, 0, 0.8)), ColorSequenceKeypoint.new(1, Color3.new(0.290196, 0.011764, 1)) }),
    ["Header"] = ("TIMESKIP HINTO RETURNS"):upper(),
    ["SplashImage"] = "rbxassetid://116692014520051",
    ["Content"] = {
        {
            ["Type"] = "Short",
            ["Body"] = "TIMESKIP HINTO RETURNS!"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "+1 FREE STYLE SLOT!"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "BUG FIXES & UX IMPROVEMENTS!"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "2X SECRET PITY WEEKEND!"
        }
    }
}
return v1(v2)