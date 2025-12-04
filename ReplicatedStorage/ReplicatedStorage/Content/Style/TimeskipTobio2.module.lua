-- Decompiled game.ReplicatedStorage.Content.Style.TimeskipTobio2

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Timeskip Kyamo",
    ["OldDisplayName"] = "Timeskip Kagayomo",
    ["Rarity"] = v1.Rarity.Type.Secret,
    ["Description"] = "An exceptional setter with great serving abilities.",
    ["Number"] = 9,
    ["Multipliers"] = require(script.Parent.TimeskipTobio.Multipliers),
    ["Metadata"] = {
        ["Special"] = require(script.Parent.TimeskipTobio.Special),
        ["Statistics"] = require(script.Parent.TimeskipTobio.Statistics),
        ["Animations"] = require(script.Parent.TimeskipTobio.Animations),
        ["Nametag"] = require(script.Parent.TimeskipTobio.Nametag),
        ["Timestamp"] = DateTime.fromUniversalTime(2025, 9, 20, 15, 30, 0).UnixTimestamp
    }
}
return v2(v3)