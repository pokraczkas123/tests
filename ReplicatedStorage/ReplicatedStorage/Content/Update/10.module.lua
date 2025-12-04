-- Decompiled game.ReplicatedStorage.Content.Update.10

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "10",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 3, 15, 15, 30, 0).UnixTimestamp,
    ["DisplayName"] = "Level Rewards",
    ["Color"] = ColorSequence.new(Color3.fromHex("#fc3f00"), Color3.fromHex("#fcad10")),
    ["Header"] = ("Level Rewards"):upper(),
    ["SplashImage"] = "",
    ["Content"] = {
        {
            ["Type"] = "Short",
            ["Body"] = "LEVEL REWARDS"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "GLOBAL GIFTING"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "MOBILE CUSTOMIZATION"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "SELL ITEMS FOR YEN"
        }
    }
}
return v1(v2)