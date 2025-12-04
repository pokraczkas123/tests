-- Decompiled game.ReplicatedStorage.Content.Update.40

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "40",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 10, 11, 15, 25, 0).UnixTimestamp,
    ["DisplayName"] = "HIDARI",
    ["Color"] = ColorSequence.new(Color3.fromHex("#0004e8"), Color3.fromHex("#bf00ff")),
    ["Header"] = ("HIDARI"):upper(),
    ["SplashImage"] = "rbxassetid://124640157304911",
    ["Content"] = {
        {
            ["Type"] = "Short",
            ["Body"] = "NEW SECRET: HIDARI!"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "NEW STYLE SLOT!"
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