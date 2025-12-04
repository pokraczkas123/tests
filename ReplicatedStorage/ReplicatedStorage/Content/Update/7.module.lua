-- Decompiled game.ReplicatedStorage.Content.Update.7

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "7",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 2, 22, 18, 0, 0).UnixTimestamp,
    ["DisplayName"] = "Update 7",
    ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.new(0, 1, 0)), ColorSequenceKeypoint.new(1, Color3.new(0, 1, 0.5)) }),
    ["Header"] = ("PARTIES & PRACTICE!"):upper(),
    ["SplashImage"] = "rbxassetid://104775833165934",
    ["Content"] = {
        {
            ["Type"] = "Long",
            ["Body"] = "Create a new <font color=\"rgb(0,255,0)\">PARTY</font> and invite friends & players to queue together!"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "Switch <font color=\"rgb(255,25,156)\">GAMEMODES</font> easily with the new mode selector menu!"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "Train your talent in <font color=\"rgb(255,0,0)\">PRACTICE</font> servers with no stakes!"
        }
    }
}
return v1(v2)