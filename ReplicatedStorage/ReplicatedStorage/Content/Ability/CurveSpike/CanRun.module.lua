-- Decompiled game.ReplicatedStorage.Content.Ability.CurveSpike.CanRun

local v1 = game:GetService("ReplicatedStorage")
require(script.Parent.Parent)
require(v1.Common.Context)
local v_u_2 = require(v1.Content.Special.TheTwins.CanRun)
return function(_, p3)
    -- upvalues: (copy) v_u_2
    if p3.State.Custom.CachedCurveSpikeCanRun == nil then
        p3.State.Custom.ForceTheTwinsCanRun = true
        if v_u_2(nil, p3) then
            p3.State.Custom.CachedCurveSpikeCanRun = false
            return false
        else
            p3.State.Custom.CachedCurveSpikeCanRun = true
            return true
        end
    else
        return p3.State.Custom.CachedCurveSpikeCanRun
    end
end