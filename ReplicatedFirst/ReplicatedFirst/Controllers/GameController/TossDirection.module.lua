-- Decompiled game.ReplicatedFirst.Controllers.GameController.TossDirection

local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("RunService")
local v_u_4 = require(v2.Packages.Fusion)
local v_u_5 = require(v2.Configuration.Game)
return function(p_u_6)
    -- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_3, (copy) v_u_1
    local v_u_7 = v_u_4.Value(0)
    local v_u_8 = v_u_4.Value(UDim2.fromScale(0.5, 0.5))
    local v_u_9 = v_u_4.Spring(v_u_8, v_u_5.Ball.Toss.DirectionSpeed, 1)
    v_u_3.Heartbeat:Connect(function(p10)
        -- upvalues: (ref) v_u_1, (copy) v_u_8, (copy) v_u_7, (copy) v_u_9, (copy) p_u_6
        local v_u_11 = v_u_1.LocalPlayer.Character
        if v_u_11 then
            local v12, v13 = pcall(function()
                -- upvalues: (copy) v_u_11
                return v_u_11.Humanoid
            end)
            if v12 then
                local v14 = v_u_11:GetPivot():VectorToObjectSpace(v13.MoveDirection)
                local v15 = v_u_8
                local v16 = UDim2.fromScale
                local v17 = v14.X * 0.37 + 0.5
                local v18 = v14.Z * 0.37
                v15:set(v16(v17, math.min(v18, 0) + 0.5))
                v_u_7:set(v_u_7:get() + p10 * 100)
                local v19 = v_u_9:get()
                local v20 = p_u_6.Direction
                local v21 = (v19.X.Scale - 0.5) / 0.37
                local v22 = (v19.Y.Scale - 0.5) / -0.37
                v20:set((Vector3.new(v21, 0, v22)))
            end
        else
            return
        end
    end)
    v_u_4.Hydrate(p_u_6.Component)({
        ["Visible"] = p_u_6.Visible
    })
    v_u_4.Hydrate(p_u_6.Component.Ball)({
        ["Position"] = v_u_9,
        ["Rotation"] = v_u_7
    })
end