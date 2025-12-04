-- Decompiled game.ReplicatedStorage.Content.Update.44

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "44",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 11, 8, 16, 25, 0).UnixTimestamp,
    ["DisplayName"] = "MORE MASTERIES",
    ["Color"] = ColorSequence.new(Color3.fromHex("#ffb700"), Color3.fromHex("#00fbff")),
    ["Header"] = ("TAICHOU & TSO MASTERY"):upper(),
    ["SplashImage"] = "rbxassetid://72521521773485",
    ["Content"] = {
        {
            ["Type"] = "Short",
            ["Body"] = "TAICHOU MASTERY!"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "TSO MASTERY!"
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