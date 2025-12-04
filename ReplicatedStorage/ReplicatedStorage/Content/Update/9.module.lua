-- Decompiled game.ReplicatedStorage.Content.Update.9

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "9",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 3, 8, 16, 30, 0).UnixTimestamp,
    ["DisplayName"] = "Timeskip Hinto",
    ["Color"] = ColorSequence.new(Color3.fromHex("#0004e8"), Color3.fromHex("#bf00ff")),
    ["Header"] = ("Timeskip Hinto"):upper(),
    ["SplashImage"] = "",
    ["Content"] = {
        {
            ["Type"] = "Short",
            ["Body"] = "NEW SECRET: Timeskip Hinto!"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "Secret Pity"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "Toxic Emote Pack"
        }
    }
}
return v1(v2)