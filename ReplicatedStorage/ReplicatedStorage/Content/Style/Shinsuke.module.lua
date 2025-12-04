-- Decompiled game.ReplicatedStorage.Content.Style.Shinsuke

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Kishoti",
    ["OldDisplayName"] = "Kito",
    ["Rarity"] = v1.Rarity.Type.Common,
    ["Description"] = "A well rounded player with decent receiving abilities.",
    ["Number"] = 1,
    ["Multipliers"] = {
        ["Speed"] = 1.05,
        ["SpikePower"] = 0.85,
        ["JumpPower"] = 1,
        ["BumpPower"] = 1.3,
        ["DiveSpeed"] = 1.15,
        ["ServePower"] = 0.9,
        ["SetPower"] = 0.8,
        ["BlockPower"] = 1.2
    }
}
return v2(v3)