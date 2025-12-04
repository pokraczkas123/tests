-- Decompiled game.ReplicatedStorage.Content.Update.41

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "41",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 10, 18, 15, 25, 0).UnixTimestamp,
    ["DisplayName"] = "PLAYER CARDS",
    ["Color"] = ColorSequence.new(Color3.fromHex("#ff7300"), Color3.fromHex("#e700fc")),
    ["Header"] = ("PLAYER CARDS"):upper(),
    ["SplashImage"] = "rbxassetid://125174298935528",
    ["Content"] = {
        {
            ["Type"] = "Short",
            ["Body"] = "NEW PLAYER CARDS!"
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