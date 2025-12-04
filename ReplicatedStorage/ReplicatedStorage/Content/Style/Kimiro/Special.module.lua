-- Decompiled game.ReplicatedStorage.Content.Style.Kimiro.Special

local v1 = game:GetService("ReplicatedStorage")
return require(v1.Content.Special).get("Kimiro", {
    ["Speed"] = 200,
    ["Damping"] = 1,
    ["Power"] = NumberRange.new(19.5, 45),
    ["Duration"] = 1,
    ["EasingStyle"] = Enum.EasingStyle.Quad,
    ["MaxForce"] = 100000,
    ["StretchSpeedFactor"] = 75,
    ["TimeScale"] = 0.6,
    ["Debounce"] = 0,
    ["IgnoreAerialDebounce"] = true,
    ["SpecialEffect"] = "SuperDive"
})