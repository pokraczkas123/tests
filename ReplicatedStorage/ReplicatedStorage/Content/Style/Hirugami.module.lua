-- Decompiled game.ReplicatedStorage.Content.Style.Hirugami

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Hirakumi",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Description"] = "A strong blocker.",
    ["Number"] = 6,
    ["Multipliers"] = {
        ["Speed"] = 0.85,
        ["SpikePower"] = 1,
        ["JumpPower"] = 1.1,
        ["BumpPower"] = 0.8,
        ["DiveSpeed"] = 0.88,
        ["ServePower"] = 1.2,
        ["SetPower"] = 1,
        ["BlockPower"] = 1.5
    }
}
return v2(v3)