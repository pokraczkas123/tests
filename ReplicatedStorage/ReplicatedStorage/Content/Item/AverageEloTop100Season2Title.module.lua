-- Decompiled game.ReplicatedStorage.Content.Item.AverageEloTop100Season2Title

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Top 100 Average S2",
    ["Rarity"] = v1.Rarity.Type.Epic,
    ["Type"] = v1.Type.Title,
    ["Description"] = "Obtained by being Top 100 in Average Elo during Season 2.",
    ["Metadata"] = {
        ["Color"] = Color3.fromRGB(237, 31, 227)
    }
}
return v2(v3)