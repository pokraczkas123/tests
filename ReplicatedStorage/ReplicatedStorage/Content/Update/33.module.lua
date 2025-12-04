-- Decompiled game.ReplicatedStorage.Content.Update.33

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "33",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 8, 23, 15, 30, 0).UnixTimestamp,
    ["DisplayName"] = "SEASON 7",
    ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(0, 1, 0.5019607843137255)), ColorSequenceKeypoint.new(1, Color3.new(0.290196, 0.011764, 1)) }),
    ["Header"] = ("SEASON 7"):upper(),
    ["SplashImage"] = "rbxassetid://79945793241635",
    ["Content"] = {
        {
            ["Type"] = "Short",
            ["Body"] = "SEASON 7!"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "NEW CONTENT!"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "UPDATED LOBBY & MAP!"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "2X SECRET PITY WEEKEND!"
        }
    }
}
return v1(v2)