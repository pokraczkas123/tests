-- Decompiled game.ReplicatedStorage.Content.Update.27

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "27",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 7, 12, 15, 30, 0).UnixTimestamp,
    ["DisplayName"] = "Matchmaking Overhaul",
    ["Color"] = ColorSequence.new(Color3.fromHex("#ff7300"), Color3.fromHex("#e700fc")),
    ["Header"] = ("MATCHMAKING OVERHAUL"):upper(),
    ["SplashImage"] = "rbxassetid://84016784530218",
    ["Content"] = {
        {
            ["Type"] = "Short",
            ["Body"] = "MATCHMAKING OVERHAUL!"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "PERFORMANCE IMPROVEMENTS!"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "PERFORMANCE BASED ELO!"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "LAG DECREASED!"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "2X SECRET PITY WEEKEND!"
        }
    }
}
return v1(v2)