-- Decompiled game.ReplicatedStorage.Content.Style.Morisuke

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Yokai",
    ["OldDisplayName"] = "Yabu",
    ["Rarity"] = v1.Rarity.Type.Legendary,
    ["Description"] = "A libero with the capability to jump very high.",
    ["Number"] = 3,
    ["Multipliers"] = {
        ["Speed"] = 1.2,
        ["SpikePower"] = 0.8,
        ["JumpPower"] = 1.1,
        ["BumpPower"] = 1.45,
        ["DiveSpeed"] = 1.3,
        ["ServePower"] = 0.8,
        ["SetPower"] = 1,
        ["BlockPower"] = 1.25
    }
}
return v2(v3)