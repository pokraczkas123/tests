-- Decompiled game.ReplicatedStorage.Tools.Timestamp

local v1 = {
    ["Sunday"] = 0,
    ["Monday"] = 1,
    ["Tuesday"] = 2,
    ["Wednesday"] = 3,
    ["Thursday"] = 4,
    ["Friday"] = 5,
    ["Saturday"] = 6
}
local v_u_58 = {
    ["Day"] = v1,
    ["Type"] = {
        [v1.Sunday] = "Sunday",
        [v1.Monday] = "Monday",
        [v1.Tuesday] = "Tuesday",
        [v1.Wednesday] = "Wednesday",
        [v1.Thursday] = "Thursday",
        [v1.Friday] = "Friday",
        [v1.Saturday] = "Saturday"
    },
    ["getNextOccurence"] = function(p2, p3, p4)
        local v5 = tonumber(p3:FormatUniversalTime("d", "en-us"))
        local v6 = p4 or {}
        local v7 = v6.Hour or 0
        local v8 = v6.Minute or 0
        local v9 = (p2 - v5 + 6) % 6
        local v10 = p3.UnixTimestamp + v9 * 86400
        local v11 = DateTime.fromUnixTimestamp(v10):ToUniversalTime()
        return DateTime.fromUniversalTime(v11.Year, v11.Month, v11.Day, v7, v8, 0)
    end,
    ["isWeeklyEnum"] = function(p12)
        -- upvalues: (copy) v_u_58
        local v13
        if typeof(p12) == "table" then
            local v14 = p12.Start
            if typeof(v14) == "number" then
                local v15 = p12.End
                v13 = typeof(v15) == "number" and v_u_58.Type[p12.Start]
                if v13 then
                    v13 = v_u_58.Type[p12.End]
                end
            else
                v13 = false
            end
        else
            v13 = false
        end
        return v13
    end,
    ["convertEnumToTimestamps"] = function(p16, p17)
        -- upvalues: (copy) v_u_58
        local v18 = v_u_58.getNextOccurence(p16.Start, p17 or DateTime.now())
        local v19 = v_u_58.getNextOccurence(p16.End, v18)
        if v19.UnixTimestamp <= v18.UnixTimestamp then
            v19 = DateTime.fromUnixTimestamp(v19.UnixTimestamp + 604800)
        end
        return {
            ["Start"] = v18.UnixTimestamp,
            ["End"] = v19.UnixTimestamp
        }
    end,
    ["new"] = function(p20, p21)
        -- upvalues: (copy) v_u_58
        if typeof(p20) == "number" then
            return p20
        end
        local v22 = typeof(p20) == "table"
        assert(v22, "Timestamps must be a table")
        if v_u_58.isWeeklyEnum(p20) then
            p20 = v_u_58.convertEnumToTimestamps(p20, p21)
        end
        if not p20.Start then
            local v23 = p20.End
            if typeof(v23) == "number" then
                return p20.End
            end
        end
        local v24 = p20.End
        local v25 = typeof(v24) == "number"
        assert(v25, "Timestamps must have a number End")
        local v26 = p20.Start
        local v27 = typeof(v26) == "number"
        assert(v27, "Timestamps must have a number Start")
        local v28 = p20.Start <= p20.End
        assert(v28, "Timestamps Start must be less than or equal to End")
        local v29 = p20.Start >= 0
        assert(v29, "Timestamps Start must be greater than or equal to 0")
        return {
            ["Start"] = p20.Start,
            ["End"] = p20.End
        }
    end,
    ["hasEnded"] = function(p30, p31, p32)
        local v33
        if typeof(p30) == "number" then
            v33 = p30
        else
            v33 = p30.End
        end
        if p31 then
            local v34 = DateTime.fromUnixTimestamp
            local v35
            if typeof(p32) == "number" then
                v35 = p32
            else
                v35 = p30.End
            end
            local v36 = v34(v35):ToUniversalTime()
            local v37 = p31.Hour or 0
            local v38 = p31.Minute or 0
            v33 = DateTime.fromUniversalTime(v36.Year, v36.Month, v36.Day, v37, v38, 0).UnixTimestamp
        end
        return v33 <= (p32 and p32.UnixTimestamp or DateTime.now().UnixTimestamp)
    end,
    ["hasStarted"] = function(p39, p40, p41)
        local v42 = typeof(p39) == "number" and 0 or p39.Start
        if p40 then
            local v43 = DateTime.fromUnixTimestamp
            local v44
            if typeof(p41) == "number" then
                v44 = p41
            else
                v44 = p39.Start
            end
            local v45 = v43(v44):ToUniversalTime()
            local v46 = p40.Hour or 0
            local v47 = p40.Minute or 0
            v42 = DateTime.fromUniversalTime(v45.Year, v45.Month, v45.Day, v46, v47, 0).UnixTimestamp
        end
        return v42 <= (p41 and p41.UnixTimestamp or DateTime.now().UnixTimestamp)
    end,
    ["isActive"] = function(p48, p49, p50)
        -- upvalues: (copy) v_u_58
        local v51 = v_u_58.hasStarted(p48, p49, p50)
        if v51 then
            v51 = not v_u_58.hasEnded(p48, p49, p50)
        end
        return v51
    end,
    ["evaluate"] = function(p52, p53)
        local v54 = p53 or DateTime.now().UnixTimestamp
        local v55 = typeof(p52) == "number" and 0 or p52.Start
        if typeof(p52) ~= "number" then
            p52 = p52.End
        end
        local v56 = typeof(v54) == "number"
        assert(v56, "Current time must be a number")
        if v54 < v55 then
            return -1
        end
        local v57 = p52 - v54
        return math.max(v57, 0)
    end
}
return v_u_58