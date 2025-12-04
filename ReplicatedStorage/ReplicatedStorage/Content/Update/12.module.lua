-- Decompiled game.ReplicatedStorage.Content.Update.12

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "12",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 3, 29, 15, 30, 0).UnixTimestamp,
    ["DisplayName"] = "Season 2",
    ["Color"] = ColorSequence.new(Color3.fromHex("#82fc00"), Color3.fromHex("#0011fc")),
    ["Header"] = ("Season 2"):upper(),
    ["SplashImage"] = "",
    ["Content"] = {
        {
            ["Type"] = "Short",
            ["Body"] = "SEASON 2!"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "2X SECRET PITY WEEKEND!"
        }
    }
}
return v1(v2)