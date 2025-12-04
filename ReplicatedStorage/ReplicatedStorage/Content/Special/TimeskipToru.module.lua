-- Decompiled game.ReplicatedStorage.Content.Special.TimeskipToru

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
require(v1.Common.Context)
return v2.new({
    ["Id"] = script.Name,
    ["Type"] = v2.Type.Action,
    ["DisplayName"] = "Super Serve",
    ["Description"] = { "Max Serve to perform <font color=\"rgb(255,125,0)\">Rainbow Serve!</font>", "<font color=\"rgb(255,125,0)\">Knock</font> opponents back with your serve!" },
    ["Icon"] = "rbxassetid://124587825606929",
    ["Move"] = v2.Move.ServeSpike,
    ["CanRun"] = function(p3, p4)
        if p4.State.Custom.WeakHit then
            return false
        end
        local v5
        if p4.Move == "Spike" then
            v5 = (p4.ServePower or 0) >= p3.Metadata.ServeRequirement
        else
            v5 = false
        end
        return v5
    end,
    ["PreAction"] = function(p6, p7)
        p7.SpecialProps.Power = p6.Metadata.Power
        p7.State.Events.SpecialActive = true
        return true
    end,
    ["PostAction"] = require(script.PostAction)
})