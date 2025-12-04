-- Decompiled game.ReplicatedStorage.Content.Update.11

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "11",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 3, 22, 15, 30, 0).UnixTimestamp,
    ["DisplayName"] = "Regional Matchmaking",
    ["Color"] = ColorSequence.new(Color3.fromHex("#ff7300"), Color3.fromHex("#e700fc")),
    ["Header"] = ("REGIONAL MATCHMAKING!"):upper(),
    ["SplashImage"] = "rbxassetid://84492666725874",
    ["Content"] = {
        {
            ["Type"] = "Long",
            ["Body"] = "QUEUE LOWER PING SERVERS WITH REGIONAL MATCHMAKING!"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "SELL EXTRA DUPLICATE INVENTORY ITEMS FOR YEN!"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "NEW* MOBILE UI CUSTOMIZATION!"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "UPDATED IN-GAME MATCH UI!"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "STREAK QUESTS & STREAK BUYBACK!"
        }
    }
}
return v1(v2)