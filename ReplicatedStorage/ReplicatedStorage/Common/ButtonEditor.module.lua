-- Decompiled game.ReplicatedStorage.Common.ButtonEditor

local v_u_24 = {
    ["Exceptions"] = require(script.Exceptions),
    ["MaxOffset"] = 10000,
    ["Increment"] = 0.1,
    ["clampScale"] = function(p1, p2)
        -- upvalues: (copy) v_u_24
        local v3 = 0.5
        local v4 = 2
        local v5 = v_u_24.Exceptions[p1]
        if v5 and v5.CustomScale then
            v3 = v5.CustomScale.Min or v3
            v4 = v5.CustomScale.Max or v4
        end
        return math.clamp(p2, v3, v4)
    end,
    ["serialize"] = function(p6)
        -- upvalues: (copy) v_u_24
        if typeof(p6) ~= "UDim2" then
            return "0,0"
        end
        local v7 = p6.X.Offset
        local v8 = math.floor(v7)
        local v9 = p6.Y.Offset
        local v10 = math.floor(v9)
        local v11 = -v_u_24.MaxOffset
        local v12 = v_u_24.MaxOffset
        local v13 = math.clamp(v8, v11, v12)
        local v14 = -v_u_24.MaxOffset
        local v15 = v_u_24.MaxOffset
        local v16 = math.clamp(v10, v14, v15)
        return string.format("%d,%d", v13, v16)
    end,
    ["deserialize"] = function(p17)
        -- upvalues: (copy) v_u_24
        if typeof(p17) == "string" and v_u_24.isUtf8(p17) then
            local v18, v19 = p17:match("([^,]+),([^,]+)")
            if v18 and v19 then
                return UDim2.fromOffset(tonumber(v18), (tonumber(v19)))
            else
                return UDim2.new()
            end
        else
            return UDim2.new()
        end
    end,
    ["validate"] = function(p20)
        -- upvalues: (copy) v_u_24
        return v_u_24.serialize(v_u_24.deserialize(p20))
    end,
    ["isUtf8"] = function(p21)
        if utf8.len(p21) == nil then
            return false
        end
        for v22, v23 in utf8.graphemes(p21) do
            if v22 ~= v23 then
                return false
            end
        end
        return true
    end
}
return v_u_24