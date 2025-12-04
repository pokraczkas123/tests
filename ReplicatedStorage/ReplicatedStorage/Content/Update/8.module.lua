-- Decompiled game.ReplicatedStorage.Content.Update.8

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "8",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 3, 1, 18, 0, 0).UnixTimestamp,
    ["DisplayName"] = "Update 8",
    ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(0, 1, 0)), ColorSequenceKeypoint.new(1, Color3.new(0, 1, 0.5)) }),
    ["Header"] = ("Season 1"):upper(),
    ["SplashImage"] = "",
    ["Content"] = {
        {
            ["Type"] = "Short",
            ["Body"] = "SEASON 1"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "SEASON PASS"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "LUCKY BUNDLE"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "PLACEMENT MATCHES"
        }
    }
}
return v1(v2)