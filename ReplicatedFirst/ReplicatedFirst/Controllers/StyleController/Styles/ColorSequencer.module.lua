-- Decompiled game.ReplicatedFirst.Controllers.StyleController.Styles.ColorSequencer

local v_u_15 = {
    ["evaluate"] = function(p1, p2)
        if p2 <= 0 then
            return p1.Keypoints[1].Value
        end
        if p2 >= 1 then
            return p1.Keypoints[#p1.Keypoints].Value
        end
        for v3 = 1, #p1.Keypoints - 1 do
            local v4 = p1.Keypoints[v3]
            local v5 = p1.Keypoints[v3 + 1]
            if v4.Time <= p2 and p2 < v5.Time then
                local v6 = (p2 - v4.Time) / (v5.Time - v4.Time)
                return Color3.new((v5.Value.R - v4.Value.R) * v6 + v4.Value.R, (v5.Value.G - v4.Value.G) * v6 + v4.Value.G, (v5.Value.B - v4.Value.B) * v6 + v4.Value.B)
            end
        end
    end,
    ["breathe"] = function(p7, p8, p9)
        -- upvalues: (copy) v_u_15
        local v10 = p9 / (p8 or 2) * 3.141592653589793 * 2
        local v11 = (math.sin(v10) + 1) / 2
        return v_u_15.evaluate(p7, v11)
    end,
    ["strength"] = function(p12)
        if p12 >= 1 then
            return Color3.new(1, 0, 1)
        end
        local v13 = Color3.fromHSV
        local v14 = p12 * 0.4
        return v13(math.min(v14, 0.3), 1, 1)
    end
}
return v_u_15