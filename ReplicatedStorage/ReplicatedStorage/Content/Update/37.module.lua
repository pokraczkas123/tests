-- Decompiled game.ReplicatedStorage.Content.Update.37

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "37",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 9, 20, 15, 25, 0).UnixTimestamp,
    ["DisplayName"] = "QOL + YOGAN BUFF",
    ["Color"] = ColorSequence.new(Color3.fromHex("#0004e8"), Color3.fromHex("#bf00ff")),
    ["Header"] = ("QOL + YOGAN BUFF"):upper(),
    ["SplashImage"] = "rbxassetid://103382230371308",
    ["Content"] = {
        {
            ["Type"] = "Long",
            ["Body"] = "HUGE YOGAN BUFFS!"
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