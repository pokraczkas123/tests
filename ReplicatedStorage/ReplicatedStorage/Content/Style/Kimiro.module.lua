-- Decompiled game.ReplicatedStorage.Content.Style.Kimiro

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Kisuki",
    ["OldDisplayName"] = "Kimiro",
    ["Rarity"] = v1.Rarity.Type.Secret,
    ["Description"] = "An exceptional libero with a super dive.",
    ["Number"] = 13,
    ["Multipliers"] = {
        ["Speed"] = 1.2,
        ["SpikePower"] = 0.9,
        ["JumpPower"] = 1.05,
        ["BumpPower"] = 1.6,
        ["DiveSpeed"] = 1.4,
        ["ServePower"] = 1.15,
        ["SetPower"] = 1.4,
        ["BlockPower"] = 0.7
    }
}
local v4 = {
    ["Special"] = require(script.Special)
}
local v5 = {
    ["DiveSpeed"] = {
        ["IsRainbow"] = true
    }
}
v4.Statistics = v5
v3.Metadata = v4
return v2(v3)