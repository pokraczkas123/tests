-- Decompiled game.ReplicatedStorage.Content.Special.TheTwins.CanRun

local v1 = game:GetService("ReplicatedStorage")
require(script.Parent.Parent)
local v_u_2 = require(v1.Common.State)
local v_u_3 = require(v1.Common.Context)
return function(_, p4)
    -- upvalues: (copy) v_u_3, (copy) v_u_2
    if p4.State.Stage ~= v_u_3.Stage.PostAction and not p4.State.Custom.ForceTheTwinsCanRun then
        return false
    end
    local v5 = v_u_2.get(p4.Player, v_u_2.Id.Gameplay, "Style", "")
    local v6
    if p4.ServePower == nil or v5 ~= "Twin1" and v5 ~= "Twin1_2" then
        v6 = false
    else
        v6 = p4.State.Control.TiltDot <= -0.3
    end
    return v6 == true
end