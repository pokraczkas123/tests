-- Decompiled game.ReplicatedStorage.Content.Update.21

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "21",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 5, 31, 15, 30, 0).UnixTimestamp,
    ["DisplayName"] = "Season 4",
    ["Color"] = ColorSequence.new(Color3.fromHex("#fc3f00"), Color3.fromHex("#fcad10")),
    ["Header"] = ("SEASON 4"):upper(),
    ["SplashImage"] = "rbxassetid://82969881553195",
    ["Content"] = {
        {
            ["Type"] = "Short",
            ["Body"] = "SUMMER SEASON!"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "SPLEEF GAMEMODE!"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "NEW CONTENT"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "2X SECRET CHANCE WEEKEND!"
        }
    }
}
return v1(v2)