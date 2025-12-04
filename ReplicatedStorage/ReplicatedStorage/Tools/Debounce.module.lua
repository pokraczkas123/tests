-- Decompiled game.ReplicatedStorage.Tools.Debounce

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Common.State)
local v_u_3 = {}
v_u_3.__index = v_u_3
function v_u_3.new(p4, p5)
    -- upvalues: (copy) v_u_3
    local v6 = v_u_3
    local v7 = setmetatable({}, v6)
    v7._name = p4
    v7._duration = p5
    return v7
end
function v_u_3.Set(p_u_8, p_u_9, p10)
    -- upvalues: (copy) v_u_2
    local v_u_11 = workspace:GetServerTimeNow()
    local v12 = p10 or p_u_8._duration
    v_u_2.set(p_u_9, v_u_2.Id.Debounce, p_u_8._name, v_u_11)
    if v12 then
        task.delay(v12, function()
            -- upvalues: (ref) v_u_2, (copy) p_u_9, (copy) p_u_8, (copy) v_u_11
            if v_u_2.get(p_u_9, v_u_2.Id.Debounce, p_u_8._name) == v_u_11 then
                p_u_8:Remove(p_u_9)
            end
        end)
    end
end
function v_u_3.Has(p13, p14)
    -- upvalues: (copy) v_u_2
    return v_u_2.get(p14, v_u_2.Id.Debounce, p13._name) ~= nil
end
function v_u_3.Remove(p15, p16)
    -- upvalues: (copy) v_u_2
    v_u_2.set(p16, v_u_2.Id.Debounce, p15._name, nil)
end
return v_u_3