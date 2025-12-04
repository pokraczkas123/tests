-- Decompiled game.ReplicatedStorage.Content.Update.42

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "42",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 10, 25, 15, 25, 0).UnixTimestamp,
    ["DisplayName"] = "MASTERIES",
    ["Color"] = ColorSequence.new(Color3.fromHex("#fc3f00"), Color3.fromHex("#fcad10")),
    ["Header"] = ("MASTERIES + TAICHOU"):upper(),
    ["SplashImage"] = "rbxassetid://74690554320499",
    ["Content"] = {
        {
            ["Type"] = "Short",
            ["Body"] = "NEW STYLE MASTERIES!"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "TAICHOU RETURNS!"
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