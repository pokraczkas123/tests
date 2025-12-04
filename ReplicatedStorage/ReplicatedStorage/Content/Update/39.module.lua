-- Decompiled game.ReplicatedStorage.Content.Update.39

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "39",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 10, 4, 15, 25, 0).UnixTimestamp,
    ["DisplayName"] = "THE TWINS RETURN",
    ["Color"] = ColorSequence.new(Color3.fromHex("#0004e8"), Color3.fromHex("#bf00ff")),
    ["Header"] = ("THE TWINS RETURN"):upper(),
    ["SplashImage"] = "rbxassetid://84405895022299",
    ["Content"] = {
        {
            ["Type"] = "Short",
            ["Body"] = "THE TWINS RETURN!"
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