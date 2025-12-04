-- Decompiled game.ReplicatedStorage.Content.Ability.CurveSpike.PostAction

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = nil
require(script.Parent.Parent)
local v_u_3 = require(v1.Packages.Knit)
require(v1.Common.Context)
local v_u_4 = require(v1.Common.Physics)
return function(p5, p6)
    -- upvalues: (ref) v_u_2, (copy) v_u_3, (copy) v_u_4
    v_u_2 = v_u_2 or v_u_3.GetService("GameService")
    local v7 = p6.TiltDirection
    local v8 = v_u_4.lerp
    local v9 = p5.Metadata.CurveAcceleration.Min
    local v10 = p5.Metadata.CurveAcceleration.Max
    local v11 = (p6.State.Ball.Velocity.Magnitude - 33) / 80
    local v12 = v7 * v8(v9, v10, (math.max(v11, 0)))
    p6.State.Effect.Ball = "CurveSpike"
    p6.State.Ball.Acceleration = v_u_4.correctVector3(v12)
    p6.State.Ball.Timer = 3
    v_u_2.Client.Effect:FireAll("CurveSpikeHit", {
        ["Character"] = p6.Player.Character,
        ["IsModuleEffect"] = true
    })
    return true
end