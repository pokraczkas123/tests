-- Decompiled game.ReplicatedStorage.Tools.Time

local v1 = require(script.Constants)
local v_u_39 = {
    ["Unit"] = v1.Unit,
    ["Scientific"] = v1.Scientific,
    ["toHMS"] = function(p2)
        -- upvalues: (copy) v_u_39
        local v3 = typeof(p2) == "number"
        local v4 = ("[%*]: Invalid seconds parameter!"):format(script.Name)
        assert(v3, v4)
        local v5 = p2 / v_u_39.Unit.Hour
        local v6 = math.floor(v5)
        local v7 = p2 - v6 * v_u_39.Unit.Hour
        local v8 = v7 / v_u_39.Unit.Minute
        local v9 = math.floor(v8)
        return v6, v9, v7 - v9 * v_u_39.Unit.Minute
    end,
    ["toDHMS"] = function(p10)
        local v11 = p10 / 86400
        local v12 = math.floor(v11)
        local v13 = p10 % 86400
        local v14 = v13 / 3600
        local v15 = math.floor(v14)
        local v16 = v13 % 3600
        local v17 = v16 / 60
        local v18 = math.floor(v17)
        local v19 = v16 % 60
        local v20 = {}
        if v12 > 0 then
            table.insert(v20, { v12, "d" })
        end
        if v15 > 0 then
            table.insert(v20, { v15, "h" })
        end
        if v18 > 0 then
            table.insert(v20, { v18, "m" })
        end
        if v19 > 0 then
            table.insert(v20, { v19, "s" })
        end
        local v21 = #v20
        local v22 = ""
        for v23 = 1, math.min(2, v21) do
            local v24 = v20[v23]
            local v25 = v23 > 1 and " " or ""
            local v26 = string.format("%d%s%s", v24[1], v24[2], "")
            v22 = v22 .. v25 .. v26
        end
        return v22
    end,
    ["format"] = function(p27, p28)
        -- upvalues: (copy) v_u_39
        local v29 = typeof(p27) == "number"
        local v30 = ("[%*]: Invalid seconds parameter!"):format(script.Name)
        assert(v29, v30)
        local v31
        if p28:find("dd") then
            local v32 = p27 / v_u_39.Unit.Day
            v31 = math.floor(v32)
            p27 = p27 % v_u_39.Unit.Day
        else
            v31 = 0
        end
        local v33, v34, v35 = v_u_39.toHMS(p27)
        if p28:find("dd") then
            p28 = p28:gsub("dd", string.format("%02d", v31))
        end
        return p28:gsub("hh", string.format("%02d", v33)):gsub("mm", string.format("%02d", v34)):gsub("ss", string.format("%02d", v35))
    end,
    ["humanizeHours"] = function(p36)
        -- upvalues: (copy) v_u_39
        local v37 = p36 / v_u_39.Unit.Hour
        local v38 = math.floor(v37)
        return string.format("%d hour%s", v38, v38 == 1 and "" or "s")
    end
}
return v_u_39