-- Decompiled game.ReplicatedStorage.Content.Style.Toru

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Okazu",
    ["OldDisplayName"] = "Oigawa",
    ["Rarity"] = v1.Rarity.Type.Godly,
    ["Description"] = "An excellent setter with a potent serve.",
    ["Number"] = 1,
    ["Multipliers"] = {
        ["Speed"] = 1,
        ["SpikePower"] = 0.9,
        ["JumpPower"] = 1.1,
        ["BumpPower"] = 0.9,
        ["DiveSpeed"] = 1,
        ["ServePower"] = 1.25,
        ["SetPower"] = 1.3,
        ["BlockPower"] = 1.35
    }
}
return v2(v3)