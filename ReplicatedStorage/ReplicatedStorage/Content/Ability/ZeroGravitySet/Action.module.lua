-- Decompiled game.ReplicatedStorage.Content.Ability.ZeroGravitySet.Action

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = nil
require(script.Parent.Parent)
local v_u_3 = require(v1.Packages.Knit)
require(v1.Common.Context)
return function(p4, p5)
    -- upvalues: (ref) v_u_2, (copy) v_u_3
    v_u_2 = v_u_2 or v_u_3.GetService("GameService")
    local v6 = p5.LookVector * p4.Metadata.LookVectorImpulse + Vector3.new(0, 1, 0) * p4.Metadata.SetImpulse
    p5.State.Ball.GravityMultiplier = p4.Metadata.GravityMultiplier
    p5.State.Ball.Timer = p4.Metadata.Duration
    p5.State.Ball.Velocity = v6
    p5.State.Effect.Ball = "ZeroGravity"
    v_u_2.Client.Effect:FireAll("ZeroGravityHit", {
        ["IsModuleEffect"] = true,
        ["Character"] = p5.Player.Character
    })
    v_u_2.Client.Sound:FireAll("GravityBallStop", {
        ["Parent"] = p5.Player.Character.PrimaryPart
    })
    return true
end