-- Decompiled game.ReplicatedStorage.Content.Ability.SteelBlock.PostAction

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = nil
local v_u_3 = require(v1.Packages.Knit)
require(v1.Common.Context)
local v_u_4 = require(v1.Common.Physics)
local v_u_5 = require(v1.Configuration.Game)
return function(_, p6)
    -- upvalues: (ref) v_u_2, (copy) v_u_3, (copy) v_u_5, (copy) v_u_4
    v_u_2 = v_u_2 or v_u_3.GetService("GameService")
    local v7 = p6.State.Ball
    v7.Velocity = v7.Velocity * Vector3.new(1.5, -1.5, 1.5)
    p6.State.Ball.GravityMultiplier = 4
    v_u_2.Client.Effect:FireAll("Particle", {
        ["Name"] = "SteelBlock",
        ["Parent"] = p6.Player.Character.PrimaryPart,
        ["Duration"] = 2
    })
    v_u_2.Client.Sound:FireAll("SteelBlock", {
        ["Parent"] = p6.Player.Character.PrimaryPart
    })
    local v8 = p6.State.Ball.Acceleration
    local v9 = -v_u_5.Physics.Gravity * p6.State.Ball.GravityMultiplier
    local v10 = v8 + Vector3.new(0, v9, 0)
    if v_u_4.calculateMissScore(p6.ScoreNet, p6.State.Ball.Position, p6.State.Ball.Velocity, v10) <= 0 then
        local v11 = v_u_4.calculateVelocityToClearNet(p6.ScoreNet, p6.State.Ball.Position, p6.State.Ball.Velocity, v10)
        p6.State.Ball.Velocity = v11 or p6.State.Ball.Velocity
    end
    return true
end