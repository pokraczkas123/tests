-- Decompiled game.ReplicatedStorage.Content.Update.38

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "38",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 9, 27, 15, 25, 0).UnixTimestamp,
    ["DisplayName"] = "SEASON 8",
    ["Color"] = ColorSequence.new(Color3.fromHex("#6d02ba"), Color3.fromHex("#ff6f00")),
    ["Header"] = ("SEASON 8"):upper(),
    ["SplashImage"] = "rbxassetid://125133125322798",
    ["Content"] = {
        {
            ["Type"] = "Short",
            ["Body"] = "SEASON 8!"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "NEW CONTENT!"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "UPDATED LOBBY & MAP!"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "2X SECRET PITY WEEKEND!"
        }
    }
}
return v1(v2)