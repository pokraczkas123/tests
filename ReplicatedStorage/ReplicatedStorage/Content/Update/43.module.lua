-- Decompiled game.ReplicatedStorage.Content.Update.43

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "43",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 11, 1, 15, 25, 0).UnixTimestamp,
    ["DisplayName"] = "TSO + SEASON 9 + 1V1 MODE",
    ["Color"] = ColorSequence.new(Color3.fromHex("#0004e8"), Color3.fromHex("#bf00ff")),
    ["Header"] = ("SEASON 9 + 1V1 MODE + TSO"):upper(),
    ["SplashImage"] = "rbxassetid://111651584362492",
    ["Content"] = {
        {
            ["Type"] = "Short",
            ["Body"] = "SEASON 9!"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "NEW 1V1 MODE!"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "UPDATED LOBBY & MAP!"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "TIMESKIP OKAZU RETURNS!"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "2X SECRET PITY WEEKEND!"
        }
    }
}
return v1(v2)