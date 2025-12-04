-- Decompiled game.ReplicatedStorage.Content.Style.TimeskipShoyo.Special

local v1 = game:GetService("ReplicatedStorage")
local v2 = {
    ["Spring"] = {
        ["Speed"] = 4,
        ["Damping"] = 1
    },
    ["Power"] = 0.6,
    ["Debounce"] = 1.5
}
return require(v1.Content.Special).get("TimeskipShoyo", v2)