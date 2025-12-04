-- Decompiled game.ReplicatedStorage.Tools.ValueCurve

return {
    ["new"] = function(p1)
        return p1
    end,
    ["evaluate"] = function(p2, p3)
        if typeof(p2) == "number" then
            return p2
        end
        local v4 = p2.Values
        local v5 = p2.Lerp or false
        local v6 = v4[0] or next(v4)
        local v7 = 0
        for v8, v9 in pairs(v4) do
            if p3 < v8 then
                if not v5 then
                    return math.random(v6.Min, v6.Max)
                end
                local v10 = (p3 - v7) / (v8 - v7)
                return v6.Min + (v9.Min - v6.Min) * v10
            end
            v6 = v9
            v7 = v8
        end
        return math.random(v6.Min, v6.Max)
    end
}