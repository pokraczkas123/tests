-- Decompiled game.ReplicatedStorage.Content.Style.TimeskipTobio.Special

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Content.Special).get
local v3 = {
    ["Speed"] = NumberRange.new(35, 70),
    ["Distance"] = NumberRange.new(20, 60),
    ["VerticalVelocity"] = NumberRange.new(2, 10),
    ["Jerk"] = -2,
    ["InitialGravity"] = 0.1,
    ["FinalGravity"] = 1,
    ["GravityDelay"] = 0,
    ["DurationFactor"] = 0.85,
    ["MaxHeight"] = 25,
    ["Spring"] = {
        ["Speed"] = 30,
        ["Damping"] = 0.7
    },
    ["Debounce"] = 0.25
}
return v2("TimeskipTobio", v3)