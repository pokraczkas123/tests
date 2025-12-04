-- Decompiled game.ReplicatedStorage.Content.Update.36

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "36",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 9, 13, 15, 25, 0).UnixTimestamp,
    ["DisplayName"] = "YOGAN",
    ["Color"] = ColorSequence.new(Color3.fromHex("#0004e8"), Color3.fromHex("#bf00ff")),
    ["Header"] = ("YOGAN"):upper(),
    ["SplashImage"] = "rbxassetid://86892855503011",
    ["Content"] = {
        {
            ["Type"] = "Long",
            ["Body"] = "NEW SECRET STYLE: YOGAN!"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "LUCKY SPIN HANDOUT!"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "2X SECRET PITY WEEKEND!"
        }
    }
}
return v1(v2)