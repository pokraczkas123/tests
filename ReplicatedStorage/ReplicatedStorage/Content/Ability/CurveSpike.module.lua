-- Decompiled game.ReplicatedStorage.Content.Ability.CurveSpike

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
require(v1.Common.Context)
local v3 = v2.new
local v5 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Curve Spike",
    ["Description"] = "Causes your next spike to curve in your tilt direction!",
    ["Number"] = 1,
    ["Rarity"] = v2.Rarity.Type.Godly,
    ["Type"] = v2.Type.Action,
    ["Conditions"] = {
        ["Charge"] = 150,
        ["Move"] = v2.Move.Spike
    },
    ["Metadata"] = {
        ["CurveAcceleration"] = NumberRange.new(10, 100)
    },
    ["CanRun"] = require(script.CanRun),
    ["PreAction"] = function(_, p4)
        p4.SpecialProps.ServePowerMultiplier = 0.6
        return false
    end,
    ["PostAction"] = require(script.PostAction)
}
return v3(v5)