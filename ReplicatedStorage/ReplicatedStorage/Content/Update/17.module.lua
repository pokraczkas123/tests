-- Decompiled game.ReplicatedStorage.Content.Update.17

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "17",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 5, 3, 15, 30, 0).UnixTimestamp,
    ["DisplayName"] = "Kisuki",
    ["Color"] = ColorSequence.new(Color3.fromHex("#0004e8"), Color3.fromHex("#bf00ff")),
    ["Header"] = ("KISUKI"):upper(),
    ["SplashImage"] = "rbxassetid://103879662130509",
    ["Content"] = {
        {
            ["Type"] = "Short",
            ["Body"] = "NEW SECRET STYLE"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "FAST MODE IMPROVEMENTS"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "2X SECRET CHANCE WEEKEND!"
        }
    }
}
return v1(v2)