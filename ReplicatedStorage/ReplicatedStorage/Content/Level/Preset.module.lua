-- Decompiled game.ReplicatedStorage.Content.Level.Preset

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Content.Reward)
local v3 = {
    [50] = v2.new({
        ["Type"] = v2.Type.Item,
        ["Value"] = "Level50Ball"
    }),
    [100] = v2.new({
        ["Type"] = v2.Type.Item,
        ["Value"] = "Level100ScoreEffect"
    }),
    [150] = v2.new({
        ["Type"] = v2.Type.Item,
        ["Value"] = "Level150Ball"
    }),
    [200] = v2.new({
        ["Type"] = v2.Type.Item,
        ["Value"] = "Level200ScoreEffect"
    })
}
return v3