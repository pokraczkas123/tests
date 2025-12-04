-- Decompiled game.ReplicatedStorage.Content.Special.Jester.PostAction

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = nil
local v_u_3 = require(v1.Packages.Knit)
local v_u_4 = require(v1.Common.Physics)
require(v1.Common.Context)
local v_u_5 = require(script.CalculateRelativeAcceleration)
return function(_, p6)
    -- upvalues: (ref) v_u_2, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
    if p6.State.Custom.WeakHit then
        return false
    end
    v_u_2 = v_u_2 or v_u_3.GetService("BallService")
    p6.State.Custom.BackTiltServeInfluence = 0.5
    if (p6.ServePower or 0) > 0 and p6.ServePower < 0.3 then
        p6.State.Custom.BackTiltServeInfluence = 0
    end
    local v7 = p6.Player.Character:GetPivot()
    p6.State.Ball.Timer = 3
    local v8 = p6.State.Ball
    local v9 = v_u_4.correctVector3
    local v10 = v_u_5
    local v11 = p6.TiltDirection
    local v12 = p6.Distance
    local v13 = p6.State.Ball.Velocity
    local v14 = (p6.ServePower or 0) > 0 and 0.7 or nil
    local v15
    if (p6.ServePower or 0) > 0 then
        v15 = p6.State.Custom.BackTiltServeInfluence
    else
        v15 = nil
    end
    local v16 = v9(v7:VectorToWorldSpace(v10(v7, v11, v12, v13, v14, v15)))
    local v17 = (p6.ServePower or 0) * 10
    v8.Acceleration = v16 - Vector3.new(0, v17, 0)
    v_u_2.Action.netAssist(p6)
    return true
end