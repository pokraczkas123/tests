-- Decompiled game.ReplicatedStorage.Content.Update.26

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "26",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 7, 5, 15, 30, 0).UnixTimestamp,
    ["DisplayName"] = "New Secret Style",
    ["Color"] = ColorSequence.new(Color3.fromHex("#0004e8"), Color3.fromHex("#bf00ff")),
    ["Header"] = ("KAZANA"):upper(),
    ["SplashImage"] = "rbxassetid://121364461173771",
    ["Content"] = {
        {
            ["Type"] = "Short",
            ["Body"] = "NEW SECRET: KAZANA!"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "NIGHT MODE IMPROVEMENTS!"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "CUSTOM MVP CINEMATICS FOR KAZANA!"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "DIVING & FPS IMPROVEMENTS!"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "2X SECRET PITY WEEKEND!"
        }
    }
}
return v1(v2)