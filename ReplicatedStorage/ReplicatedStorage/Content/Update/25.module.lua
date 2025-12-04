-- Decompiled game.ReplicatedStorage.Content.Update.25

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "25",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 6, 28, 15, 30, 0).UnixTimestamp,
    ["DisplayName"] = "Season 5",
    ["Color"] = ColorSequence.new(Color3.fromHex("#8b0000"), Color3.fromHex("#ff4500")),
    ["Header"] = ("Season 5"):upper(),
    ["SplashImage"] = "rbxassetid://128188938976155",
    ["Content"] = {
        {
            ["Type"] = "Short",
            ["Body"] = "SEASON 5"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "UPDATED LOBBY & MAP"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "PERFORMANCE BOOSTS!"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "2X SECRET PITY WEEKEND!"
        }
    }
}
return v1(v2)