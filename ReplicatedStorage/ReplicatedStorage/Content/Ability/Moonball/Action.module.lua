-- Decompiled game.ReplicatedStorage.Content.Ability.Moonball.Action

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = nil
local v_u_3 = require(v1.Packages.Knit)
local v_u_4 = require(v1.Common.Context)
local v_u_5 = require(v1.Common.Physics)
return function(_, p6)
    -- upvalues: (ref) v_u_2, (copy) v_u_3, (copy) v_u_5, (copy) v_u_4
    v_u_2 = v_u_2 or v_u_3.GetService("GameService")
    local v7 = p6.CollisionNet
    local v8 = p6.Player.Character
    local v9 = v_u_5.lerp(0.5, 1.4, p6.DistanceFactor)
    local v10 = v_u_5.lerp(1, 0.8, p6.DistanceFactor)
    local v11 = v_u_5.unit((v7.Position - v8.Head.Position) * Vector3.new(1, 0, 1)) * v9 * 35 + Vector3.new(0, 1, 0) * v10 * 70
    p6.State.Stage = v_u_4.Stage.Cancel
    p6.State.Ball.Velocity = v11
    p6.State.Ball.GravityMultiplier = 3.5
    p6.State.Effect.Ball = "Moonball"
    v_u_2.Client.Effect:FireAll("Particle", {
        ["Name"] = "MoonballSmoke",
        ["Offset"] = CFrame.new(0, 0, -2),
        ["Parent"] = v8.PrimaryPart
    })
    v_u_2.Client.Sound:FireAll("GravityBallStop", {
        ["Parent"] = v8.PrimaryPart
    })
    return true
end