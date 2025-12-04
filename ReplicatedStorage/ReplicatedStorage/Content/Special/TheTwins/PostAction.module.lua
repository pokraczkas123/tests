-- Decompiled game.ReplicatedStorage.Content.Special.TheTwins.PostAction

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Common.Physics)
require(v1.Common.Context)
return function(_, p_u_3)
    -- upvalues: (copy) v_u_2
    local v_u_4 = p_u_3.State.Ball.Velocity
    local v_u_5 = p_u_3.TiltDirection
    local v_u_6 = (p_u_3.State.Ball.Position - p_u_3.CollisionNet.Position).Magnitude
    local v_u_7 = v_u_6 / p_u_3.State.Ball.Velocity.Magnitude
    local v8 = v_u_2.lerp
    local v9 = (v_u_4.Magnitude - 33) / 80
    local v_u_10 = v8(1, 75, (math.max(v9, 0)))
    p_u_3.State.Ball.Timer = 3
    p_u_3.State.Ball.Rotation = -6
    p_u_3.State.Ball.Garbage = p_u_3.State.Ball.Garbage or {}
    local v11 = p_u_3.State.Ball.Garbage
    local v12 = task.spawn
    local function v44()
        -- upvalues: (copy) v_u_7, (ref) v_u_2, (copy) v_u_5, (copy) v_u_4, (copy) v_u_6, (copy) p_u_3, (copy) v_u_10
        local v13 = os.clock() + v_u_7 * 0.4
        local v14 = v_u_2.unit((v_u_5 or Vector3.new(0, 0, 0)) * Vector3.new(1, 0, 1))
        local v15 = v_u_2.lerp
        local v16 = (v_u_4.Magnitude - 33) / 80
        local v17 = v14 * v15(10, 30, (math.max(v16, 0)))
        local v18 = -v_u_2.unit(v_u_4 * Vector3.new(1, 0, 1))
        local v19 = v_u_2.lerp
        local v20 = (v_u_4.Magnitude - 35) / 120
        local v21 = v18 * v19(20, 250, (math.max(v20, 0)))
        local v22 = v_u_6 * -0.3 + 20
        local v23 = p_u_3.Ball:GetCFrame().Position
        local v24 = v23.X
        local v25 = v23.Y
        local v26 = p_u_3.CollisionNet.Position.Z
        local v27 = v_u_4.Z
        local v28 = v26 + math.sign(v27) * v22
        local v29 = Vector3.new(v24, v25, v28)
        local v30 = v17.X + v21.X
        local v31 = v17.Y + v21.Y
        local v32 = Vector3.new(v30, v31, 0)
        local v33 = v_u_2.calculateAccelerationToStopAt(v29, v23, v_u_4, v32).Z
        local v34 = v17.X + v21.X
        local v35 = v17.Y + v21.Y
        local v36 = Vector3.new(v34, v35, v33)
        local v37 = 0.5
        while p_u_3.Ball and p_u_3.Ball.OnTouch do
            local v38 = v13 <= os.clock()
            local v39 = Vector3.new(1, v38 and 1 or 0, 0)
            local v40 = v_u_10
            local v41 = v37 * 3 * 3.141592653589793
            local v42 = v40 * math.cos(v41) * v37
            local v43 = v39 * math.clamp(v42, -50, 50)
            p_u_3.Ball.Acceleration = v36 * (v38 and 1 or 0) + v43
            v37 = v37 + 0.1
            task.wait(0.1)
        end
    end
    table.insert(v11, v12(v44))
    return true
end