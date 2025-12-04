-- Decompiled game.ReplicatedStorage.Content.Special.Hakka.Utility

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Common.Physics)
require(v1.Common.Context)
local v_u_13 = {
    ["isTargetPastNet"] = function(p3)
        -- upvalues: (copy) v_u_13
        local v4 = v_u_13.getTarget(p3)
        local v5 = p3.CollisionNet.Position.Z
        local v6 = v5 - p3.Player.Character:GetPivot().Position.Z
        return math.sign(v6) * (v4.Position.Z - v5) > -2
    end,
    ["getTarget"] = function(p7)
        return p7.State.Custom.HakkaTarget
    end,
    ["getBaseTarget"] = function(p8)
        -- upvalues: (copy) v_u_2
        local v9 = p8.Player.Character:GetPivot()
        local v10 = CFrame.new
        local v11 = p8.State.Ball.Position * Vector3.new(1, 0, 1) + (v9.Position * Vector3.new(1, 0, 1)).Unit
        local v12 = p8.State.Ball.Position.Y + v_u_2.lerp(0.5, 2.5, p8.Charge)
        return v10(v11 + Vector3.new(0, v12, 0) + p8.TiltDirection * v_u_2.lerp(7, 20, p8.Charge))
    end
}
return v_u_13