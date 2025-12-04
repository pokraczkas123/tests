-- Decompiled game.ReplicatedStorage.Tools.Number

local v_u_1 = require(script.Abbreviations)
return {
    ["random"] = function(p2, p3)
        local v4 = p3 or 100
        return math.random(-v4, v4) / v4 * p2
    end,
    ["format"] = function(p5)
        local v6 = math.floor(p5)
        local v7 = tostring(v6)
        return #v7 % 3 == 0 and v7:reverse():gsub("(%d%d%d)", "%1,"):reverse():sub(2) or v7:reverse():gsub("(%d%d%d)", "%1,"):reverse()
    end,
    ["abbreviate"] = function(p8)
        -- upvalues: (copy) v_u_1
        local v9 = math.floor(p8)
        if v9 == 0 then
            return tostring(0)
        end
        local v10 = math.log10(v9)
        local v11 = math.floor(v10)
        local v12 = v11 - v11 % 3
        local v13 = v_u_1[v12 / 3 + 1] or ""
        local v14 = v9 / 10 ^ v12 * 10
        return math.floor(v14) / 10 .. v13
    end
}