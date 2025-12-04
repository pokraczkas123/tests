-- Decompiled game.ReplicatedStorage.Content.Special.Mikage

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
require(v1.Common.Context)
return v2.new({
    ["Id"] = script.Name,
    ["Type"] = v2.Type.Action,
    ["DisplayName"] = "Ghost Arms",
    ["Description"] = { "Charge your <font color=\"rgb(255,125,0)\">Ghost Arms</font> by Defending!", "INSANE Block Power + Range with Special Tilt!" },
    ["Icon"] = "rbxassetid://80807058442336",
    ["Move"] = v2.Move.All,
    ["ActionMove"] = v2.Move.Block,
    ["CanRun"] = function(p3, p4)
        local v5
        if p4.Move == p3.ActionMove then
            v5 = p4.IsSpecialActive == true
        else
            v5 = false
        end
        return v5
    end,
    ["PostAction"] = function(_, p6)
        p6.State.Effect.Sound = "GhostArmBlock"
        return true
    end
})