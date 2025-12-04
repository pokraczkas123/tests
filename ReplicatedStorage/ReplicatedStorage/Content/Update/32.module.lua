-- Decompiled game.ReplicatedStorage.Content.Update.32

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "32",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 8, 16, 15, 30, 0).UnixTimestamp,
    ["DisplayName"] = "NEW SECRET STYLE",
    ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(1, 0, 0.8)), ColorSequenceKeypoint.new(1, Color3.new(0.290196, 0.011764, 1)) }),
    ["Header"] = ("JINKO"):upper(),
    ["SplashImage"] = "rbxassetid://130724130413573",
    ["Content"] = {
        {
            ["Type"] = "Short",
            ["Body"] = "NEW SECRET: JINKO!"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "NINTH STYLE SLOT!"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "BUG FIXES!"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "2X SECRET PITY WEEKEND!"
        }
    }
}
return v1(v2)