-- Decompiled game.ReplicatedStorage.Content.Special.Hakka.Action

local v1 = game:GetService("ReplicatedStorage")
require(script.Parent.Parent)
local v_u_2 = require(script.Parent.Utility)
require(v1.Common.Context)
local v_u_3 = require(v1.Common.SpecialLib.Action)
local v_u_4 = require(script.Parent.Parent.TimeskipTobio.Action)
return function(p5, p6)
    -- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_2
    if not v_u_3.isBallInPlay() then
        return false
    end
    if not v_u_4(p5, p6) then
        return false
    end
    local v7 = p6.State.Custom.TimeskipTobioDuration or 0
    local v8 = p6.State.Ball.Acceleration
    local v9 = p6.State.Ball.Velocity
    local v10 = p6.State.Ball.Position
    local v11 = p6.State.Ball.Jerk
    p6.State.Custom.HakkaTarget = CFrame.new(v7 * v9 + v8 * v7 ^ 2 * 0.5 + v10 + v11 * v7 ^ 3 / 3) * p6.Player.Character:GetPivot().Rotation
    if not v_u_2.isTargetPastNet(p6) then
        return true
    end
    if p6.State.Custom.TimeskipTobioCleanupThread then
        task.cancel(p6.State.Custom.TimeskipTobioCleanupThread)
        p6.State.Custom.TimeskipTobioCleanupThread = nil
    end
    p6.State.Custom.HakkaTarget = nil
    p6.State.Ball.GravityMultiplier = 1
    p6.State.Ball.Timer = nil
    p6.State.Ball.Velocity = Vector3.new(0, 0, 0)
    p6.State.Ball.Acceleration = Vector3.new(0, 0, 0)
    p6.State.Ball.Jerk = Vector3.new(0, 0, 0)
    p6.State.Custom.TimeskipTobioDuration = nil
    return false
end