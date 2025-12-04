-- Decompiled game.ReplicatedStorage.Tools.Benchmark

local v_u_1 = {
    ["Unit"] = {
        ["Seconds"] = "s",
        ["Milliseconds"] = "ms"
    }
}
v_u_1.__index = v_u_1
function v_u_1.new(p2, p3)
    -- upvalues: (copy) v_u_1
    local v4 = {
        ["_name"] = p2,
        ["_timestamp"] = os.clock(),
        ["_samples"] = {},
        ["_isProfiling"] = p3 == true
    }
    local v5 = v_u_1
    return setmetatable(v4, v5)
end
function v_u_1.SetProfiling(p6, p7)
    p6._isProfiling = p7
    return p6
end
function v_u_1.Start(p8)
    if p8._isProfiling then
        debug.profilebegin(p8._name)
        return p8
    end
    if p8._timestamp then
        p8._timestamp = os.clock()
        return p8
    end
end
function v_u_1.Stop(p9, p10)
    -- upvalues: (copy) v_u_1
    if p9._isProfiling then
        debug.profileend()
    elseif p9._timestamp then
        local v11 = p10 or v_u_1.Unit.Seconds
        local v12 = os.clock() - p9._timestamp
        local v13, v14
        if v11 == v_u_1.Unit.Milliseconds then
            v13 = v12 * 1000
            v14 = "ms"
        else
            v13 = v12
            v14 = "s"
        end
        if not p9._isProfiling then
            print(string.format("<%s> took %.2f %s", p9._name, v13, v14))
        end
        local v15 = p9._samples
        table.insert(v15, v12)
        return v12
    end
end
function v_u_1.Average(p16, p17)
    -- upvalues: (copy) v_u_1
    if p16._timestamp then
        local v18 = p17 or v_u_1.Unit.Seconds
        if #p16._samples == 0 then
            warn(string.format("<%s> has no samples to calculate average", p16._name))
            return 0
        end
        local v19 = 0
        for _, v20 in ipairs(p16._samples) do
            v19 = v19 + v20
        end
        local v21 = v19 / #p16._samples
        local v22
        if v18 == v_u_1.Unit.Milliseconds then
            v22 = v21 * 1000
        else
            v22 = v21
        end
        warn(string.format("<%s> average time: %.2f %s", p16._name, v22, v18))
        return v21
    end
end
function v_u_1.Destroy(p23)
    p23._name = nil
    p23._timestamp = nil
end
return v_u_1