-- Decompiled game.ReplicatedStorage.Content.Update.22

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "22",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 6, 7, 15, 30, 0).UnixTimestamp,
    ["DisplayName"] = "New Secret Ability",
    ["Color"] = ColorSequence.new(Color3.fromHex("#0004e8"), Color3.fromHex("#bf00ff")),
    ["Header"] = ("MAGNETIC PULL"):upper(),
    ["SplashImage"] = "rbxassetid://97879943902176",
    ["Content"] = {
        {
            ["Type"] = "Short",
            ["Body"] = "NEW SECRET ABILITY!"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "MATCHMAKING IMPROVEMENTS!"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "BALL OPTIMIZATIONS!"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "2X SECRET PITY WEEKEND!"
        }
    }
}
return v1(v2)