-- Decompiled game.ReplicatedStorage.Content.Update.14

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "14",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 4, 12, 15, 30, 0).UnixTimestamp,
    ["DisplayName"] = "Shield Breaker",
    ["Color"] = ColorSequence.new(Color3.fromHex("#0004e8"), Color3.fromHex("#bf00ff")),
    ["Header"] = ("SHIELD BREAKER!"):upper(),
    ["SplashImage"] = "rbxassetid://132008751817992",
    ["Content"] = {
        {
            ["Type"] = "Long",
            ["Body"] = "NEW SECRET ABILITY!"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "SCORE EFFECT PREVIEWS!"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "2X SECRET CHANCE WEEKEND!"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "PERFORMANCE BOOSTS!"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "BLOCK BUFFS!"
        }
    }
}
return v1(v2)