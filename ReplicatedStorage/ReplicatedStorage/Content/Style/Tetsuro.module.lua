-- Decompiled game.ReplicatedStorage.Content.Style.Tetsuro

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Kozei",
    ["OldDisplayName"] = "Kuzee",
    ["Rarity"] = v1.Rarity.Type.Legendary,
    ["Description"] = "A middle blocker with an excellent serve and a powerful jump.",
    ["Number"] = 1,
    ["Multipliers"] = {
        ["Speed"] = 0.85,
        ["SpikePower"] = 1.3,
        ["JumpPower"] = 1.1,
        ["BumpPower"] = 1.2,
        ["DiveSpeed"] = 0.95,
        ["ServePower"] = 1.15,
        ["SetPower"] = 0.9,
        ["BlockPower"] = 1.2
    }
}
return v2(v3)