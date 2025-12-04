-- Decompiled game.ReplicatedFirst.Controllers.SpecialController.Move

local v_u_7 = {
    ["Direction"] = {
        ["Forward"] = "Forward",
        ["Backward"] = "Backward",
        ["Left"] = "Left",
        ["Right"] = "Right"
    },
    ["getDirection"] = function(p1)
        -- upvalues: (copy) v_u_7
        if p1.Magnitude < 0.1 then
            return nil
        elseif p1.Z >= 0.1 then
            return v_u_7.Direction.Backward
        elseif p1.Z <= -0.1 then
            return v_u_7.Direction.Forward
        elseif p1.X >= 0.1 then
            return v_u_7.Direction.Right
        elseif p1.X <= -0.1 then
            return v_u_7.Direction.Left
        else
            return nil
        end
    end,
    ["angleBetween"] = function(p2, p3)
        local v4 = p2:Dot(p3)
        local v5 = math.clamp(v4, -1, 1)
        local v6 = math.acos(v5)
        return math.deg(v6)
    end
}
return v_u_7