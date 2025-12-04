-- Decompiled game.ReplicatedStorage.Content.Update.6

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "6",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 2, 15, 18, 0, 0).UnixTimestamp,
    ["DisplayName"] = "Update 6",
    ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(0, 1, 0)), ColorSequenceKeypoint.new(1, Color3.new(0, 1, 0.5)) }),
    ["Header"] = ("RANKED MODE!"):upper(),
    ["SplashImage"] = "rbxassetid://119844025365803",
    ["Content"] = {
        {
            ["Type"] = "Long",
            ["Body"] = "EARN ELO BY WINNING RANKED MATCHES"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "GET RANKED AND RECEIVE EXCLUSIVE REWARDS"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "NEW ADVANCED CONTROLS"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "NEW AFK LOBBIES"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "NEW SCORE EFFECTS"
        }
    }
}
return v1(v2)