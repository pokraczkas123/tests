-- Decompiled game.ReplicatedStorage.Content.Special.TimeskipTobio.Action

local v1 = game:GetService("ReplicatedStorage")
require(script.Parent.Parent)
local v_u_2 = require(v1.Common.Physics)
require(v1.Common.Context)
return function(p_u_3, p_u_4)
    -- upvalues: (copy) v_u_2
    if p_u_4.TiltDirection.Magnitude <= 0.1 then
        return false
    end
    local v5 = 1
    local v6 = p_u_4.State.Custom.TimeskipTobioMaxZ
    if v6 then
        local v7 = p_u_4.TiltDirection.Z
        if math.abs(v7) > 0 then
            local v8 = p_u_4.TiltDirection.Z
            local v9 = math.abs(v8)
            local v10 = math.clamp(v9, 0, 1)
            v5 = math.lerp(1, v6, v10)
        end
    end
    local v11 = v_u_2.lerpFromRange(p_u_3.Metadata.Speed, p_u_4.Charge)
    local v12 = v_u_2.lerpFromRange(p_u_3.Metadata.Distance, p_u_4.Charge)
    local v13 = p_u_4.State.Ball.Position
    local v14 = CFrame.new
    local v15 = p_u_4.Player.Character:GetPivot().Position * Vector3.new(1, 0, 1)
    local v16 = v13.Y
    local v17 = v14(v15 + Vector3.new(0, v16, 0) + p_u_4.TiltDirection * v12 * v5)
    local v18 = p_u_3.Metadata.MaxHeight
    local v19 = p_u_4.Map
    if v19 then
        local v20 = RaycastParams.new()
        v20.FilterType = Enum.RaycastFilterType.Include
        v20.FilterDescendantsInstances = { v19 }
        local v21 = workspace
        local v22 = p_u_4.State.Ball.Position
        local v23 = -p_u_3.Metadata.MaxHeight
        local v24 = v21:Raycast(v22, Vector3.new(0, v23, 0), v20)
        if v24 then
            v18 = v24.Distance or v18
        end
    end
    local v25 = v_u_2.lerpFromRange
    local v26 = p_u_3.Metadata.VerticalVelocity
    local v27 = 1 - v18 / p_u_3.Metadata.MaxHeight
    local v28 = Vector3.new(0, 1, 0) * v25(v26, (math.clamp(v27, 0, 1)))
    local v29 = v17.Position - v13
    local v30 = v29.Unit * v11 + v28
    local v31 = -p_u_3.Metadata.Jerk * v29.Unit
    local v32 = -((v11 ^ 2 - 2 * v31.Magnitude ^ 2 / v11 / 3) / 2 * v29.Magnitude) * v29.Unit * 2
    local v33 = v30.Magnitude / v32.Magnitude
    p_u_4.State.Ball.GravityMultiplier = p_u_3.Metadata.InitialGravity
    p_u_4.State.Ball.Timer = v33 + p_u_3.Metadata.GravityDelay + 1
    p_u_4.State.Ball.Velocity = v30
    p_u_4.State.Ball.Acceleration = v32
    p_u_4.State.Ball.Jerk = v31
    p_u_4.State.Ball.Garbage = p_u_4.State.Ball.Garbage or {}
    p_u_4.State.Custom.TimeskipTobioDuration = v33
    p_u_4.State.Effect.Visual = "JumpSet"
    p_u_4.State.Effect.Sound = ("JumpSet%*"):format((math.random(3)))
    p_u_4.State.Custom.TimeskipTobioCleanupThread = task.delay(v33 * p_u_3.Metadata.DurationFactor, function()
        -- upvalues: (copy) p_u_4, (copy) p_u_3
        p_u_4.Ball.Acceleration = Vector3.new(0, 0, 0)
        p_u_4.Ball.Jerk = Vector3.new(0, 0, 0)
        task.wait(p_u_3.Metadata.GravityDelay)
        p_u_4.Ball.GravityMultiplier = p_u_3.Metadata.FinalGravity
    end)
    local v34 = p_u_4.State.Ball.Garbage
    local v35 = p_u_4.State.Custom.TimeskipTobioCleanupThread
    table.insert(v34, v35)
    return true
end