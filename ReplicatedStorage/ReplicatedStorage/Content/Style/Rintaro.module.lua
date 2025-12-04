-- Decompiled game.ReplicatedStorage.Content.Style.Rintaro

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v3 = require(v1.Content.Special)
local v4 = v2.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Sanju",
    ["OldDisplayName"] = "Sanu",
    ["Rarity"] = v2.Rarity.Type.Secret,
    ["Description"] = "",
    ["Number"] = 10,
    ["Multipliers"] = {
        ["Speed"] = 0.93,
        ["SpikePower"] = 1.5,
        ["JumpPower"] = 1.1,
        ["BumpPower"] = 1,
        ["DiveSpeed"] = 1,
        ["ServePower"] = 0.9,
        ["SetPower"] = 0.95,
        ["TiltPower"] = 1.3,
        ["BlockPower"] = 1
    },
    ["Metadata"] = {
        ["Animations"] = require(script.Animations),
        ["Special"] = v3.get("Rintaro"),
        ["BacktiltInfluence"] = 35,
        ["TiltInfluence"] = 16
    }
}
return v4(v5)