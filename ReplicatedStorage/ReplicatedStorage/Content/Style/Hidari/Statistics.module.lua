-- Decompiled game.ReplicatedStorage.Content.Style.Hidari.Statistics

local v1 = {}
local v2 = {
    ["IsRainbow"] = true,
    ["Value"] = 0.2,
    ["Variable"] = {
        ["HideArrows"] = true,
        ["Overshoot"] = 1.4,
        ["Period"] = 3
    },
    ["Color"] = {
        ["Value"] = ColorSequence.new(Color3.new(1, 0, 0), Color3.new(1, 0, 1)),
        ["Period"] = 3
    }
}
v1.ServePower = v2
local v3 = {
    ["IsRainbow"] = true,
    ["Variable"] = {
        ["HideArrows"] = true,
        ["Overshoot"] = 1.17,
        ["Period"] = 3
    }
}
v1.SpikePower = v3
return v1