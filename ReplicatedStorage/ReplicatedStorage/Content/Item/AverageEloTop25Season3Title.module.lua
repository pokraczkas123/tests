-- Decompiled game.ReplicatedStorage.Content.Item.AverageEloTop25Season3Title

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Top 25 Average S3",
    ["Rarity"] = v1.Rarity.Type.Epic,
    ["Type"] = v1.Type.Title,
    ["Description"] = "Obtained by being Top 25 in Average Elo during Season 3.",
    ["Metadata"] = {
        ["Color"] = Color3.fromRGB(237, 31, 227)
    }
}
return v2(v3)