-- Decompiled game.ReplicatedStorage.Content.Ability.MagneticPull

local v1 = require(script.Parent)
local v2 = v1.new
local v3 = {
    ["Id"] = script.Name,
    ["DisplayName"] = "Magnetic Pull",
    ["Description"] = "Pulls the ball to you for an easy hit!",
    ["Rarity"] = v1.Rarity.Type.Secret,
    ["Type"] = v1.Type.Activation,
    ["Conditions"] = {
        ["Charge"] = 250,
        ["TimeActive"] = 2
    },
    ["Metadata"] = {
        ["Range"] = 15,
        ["MaxBallGrabVelocity"] = 60,
        ["MaxTargetVelocity"] = 50,
        ["MaxTargetAcceleration"] = 150,
        ["Lifetime"] = 1.2
    },
    ["OnActivation"] = require(script.OnActivation)
}
return v2(v3)