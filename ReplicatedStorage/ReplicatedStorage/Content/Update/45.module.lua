-- Decompiled game.ReplicatedStorage.Content.Update.45

local v1 = require(script.Parent).new
local v2 = {
    ["Id"] = "45",
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 11, 15, 16, 25, 0).UnixTimestamp,
    ["DisplayName"] = "HAKKA",
    ["Color"] = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromHex("#006bf7")),
        ColorSequenceKeypoint.new(0.23, Color3.fromHex("#00ddff")),
        ColorSequenceKeypoint.new(0.454, Color3.fromHex("#fae500")),
        ColorSequenceKeypoint.new(0.725, Color3.fromHex("#e917fc")),
        ColorSequenceKeypoint.new(1, Color3.fromHex("#fd006e"))
    }),
    ["Header"] = ("ULTRA RARITY: HAKKA"):upper(),
    ["SplashImage"] = "rbxassetid://82001175685794",
    ["Content"] = {
        {
            ["Type"] = "Short",
            ["Body"] = "NEW STYLE: HAKKA!"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "NEW RARITY: ULTRA!"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "ULTRAS GET STRONGER WITH LEVELS"
        },
        {
            ["Type"] = "Long",
            ["Body"] = "EVERYONE GETS +1 FREE STYLE SLOT!"
        },
        {
            ["Type"] = "Short",
            ["Body"] = "LUCKY SPIN HANDOUT!"
        }
    }
}
return v1(v2)