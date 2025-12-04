-- Decompiled game.ReplicatedFirst.Client.fps-counter

local v1 = game:GetService("Players")
local v2 = require(script.Controller)
local v3 = require(script.Interface)
v2.new({
    ["Interface"] = v3.new(v1.LocalPlayer.PlayerGui)
})