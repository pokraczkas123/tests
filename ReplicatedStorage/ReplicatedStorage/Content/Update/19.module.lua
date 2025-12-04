-- Decompiled game.ReplicatedStorage.Content.Update.19

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "19",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 5, 17, 15, 30, 0).UnixTimestamp,
    ["DisplayName"] = "Timeskip Okazu",
    ["Color"] = ColorSequence.new(Color3.fromHex("#0004e8"), Color3.fromHex("#bf00ff")),
    ["Header"] = ("TIMESKIP OKAZU"):upper(),
    ["SplashImage"] = "rbxassetid://114125697794679",
    ["Content"] = {
        {
            ["Type"] = "Long",
            ["Body"] = "NEW TIMESKIP STYLE: TIMESKIP OKAZU!"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "NEW VIP SERVER COMMANDS!"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "/SANDBOX COMMAND FOR TOURNAMENTS!"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "2X SECRET CHANCE WEEKEND!"
        }
    }
}
return v1(v2)