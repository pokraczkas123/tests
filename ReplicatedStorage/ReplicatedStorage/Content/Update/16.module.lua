-- Decompiled game.ReplicatedStorage.Content.Update.16

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "16",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 4, 26, 15, 30, 0).UnixTimestamp,
    ["DisplayName"] = "Season 3",
    ["Color"] = ColorSequence.new(Color3.fromHex("#082863"), Color3.fromHex("#00f2ff")),
    ["Header"] = ("SEASON 3"):upper(),
    ["SplashImage"] = "rbxassetid://119186417519965",
    ["Content"] = {
        {
            ["Type"] = "Short",
            ["Body"] = "NEW WIZARDS GAMEMODE"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "NEW SEASONAL REWARDS"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "SEASON 2 REWARDS HAVE BEEN DISTRIBUTED!"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "2X SECRET CHANCE WEEKEND!"
        }
    }
}
return v1(v2)