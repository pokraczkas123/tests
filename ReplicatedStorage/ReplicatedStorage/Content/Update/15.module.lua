-- Decompiled game.ReplicatedStorage.Content.Update.15

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "15",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 4, 19, 15, 30, 0).UnixTimestamp,
    ["DisplayName"] = "The Twins",
    ["Color"] = ColorSequence.new(Color3.fromHex("#0004e8"), Color3.fromHex("#bf00ff")),
    ["Header"] = ("MAIA TWINS"):upper(),
    ["SplashImage"] = "rbxassetid://74214808652355",
    ["Content"] = {
        {
            ["Type"] = "Short",
            ["Body"] = "NEW SECRET STYLE!"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "STYLE LOCKING!"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "2X SECRET CHANCE WEEKEND!"
        }
    }
}
return v1(v2)