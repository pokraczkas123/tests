-- Decompiled game.ReplicatedStorage.Content.Update.24

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "24",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 6, 21, 15, 25, 0).UnixTimestamp,
    ["DisplayName"] = "Massive QOL Update",
    ["Color"] = ColorSequence.new(Color3.fromHex("#00ffd5"), Color3.fromHex("#ff00aa")),
    ["Header"] = ("MASSIVE QOL UPDATE"):upper(),
    ["SplashImage"] = "rbxassetid://83996936550117",
    ["Content"] = {
        {
            ["Type"] = "Short",
            ["Body"] = "PITY UI CHANGE"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "RANKED HISTORY"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "UPDATE HISTORY"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "BALANCING"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "MISC CHANGES"
        }
    }
}
return v1(v2)