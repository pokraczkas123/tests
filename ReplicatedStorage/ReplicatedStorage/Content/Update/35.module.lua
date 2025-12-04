-- Decompiled game.ReplicatedStorage.Content.Update.35

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "35",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 9, 6, 15, 25, 0).UnixTimestamp,
    ["DisplayName"] = "TIMESKIP KYAMO RETURNS",
    ["Color"] = ColorSequence.new(Color3.fromHex("#0004e8"), Color3.fromHex("#bf00ff")),
    ["Header"] = ("TIMESKIP KYAMO RETURNS"):upper(),
    ["SplashImage"] = "rbxassetid://87328594108891",
    ["Content"] = {
        {
            ["Type"] = "Short",
            ["Body"] = "TIMESKIP KYAMO RETURNS!"
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