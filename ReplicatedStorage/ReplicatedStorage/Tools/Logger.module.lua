-- Decompiled game.ReplicatedStorage.Tools.Logger

local v_u_1 = require(script.Configuration)
local v_u_2 = {}
v_u_2.__index = v_u_2
function v_u_2.new(p3, p4)
    -- upvalues: (copy) v_u_2, (copy) v_u_1
    local v5 = v_u_2
    local v6 = setmetatable({}, v5)
    v6._priority = p4 or v_u_1.BasePriority
    v6._name = p3
    return v6
end
function v_u_2._GetSuffix(_)
    -- upvalues: (copy) v_u_1
    if v_u_1.Raw then
        return debug.traceback()
    end
    local v7 = debug.traceback():split("\n")[4]
    return ("%*:%*"):format(v7:match("([^:]+):(%d+)"):match("([^%.]+)$"), (v7:match(":(%d+)")))
end
function v_u_2._Log(p8, p9, p10, p11)
    -- upvalues: (copy) v_u_1
    local v12 = p11 or p8._priority
    if typeof(v12) ~= "number" then
        p9((("[%*]: Invalid priority. Must be a number. @ %*"):format(script.Name, (p8:_GetSuffix()))))
        v12 = p8._priority
    end
    if v_u_1.Priority <= v12 then
        p9((("[%*]: %* @ %*"):format(p8._name, p10, (p8:_GetSuffix()))))
    end
end
function v_u_2.SetPriority(p13, p14)
    -- upvalues: (copy) v_u_1
    local v15 = typeof(p14) == "number"
    local v16 = ("[%*]: Invalid priority. Must be a number."):format(script.Name)
    assert(v15, v16)
    p13._priority = p14 or v_u_1.BasePriority
end
function v_u_2.Print(p17, p18, p19)
    p17:_Log(print, p18, p19)
end
function v_u_2.Warn(p20, p21, p22)
    p20:_Log(warn, p21, p22)
end
function v_u_2.WarnOnce(p23, p24, p25)
    if p23._lastLog ~= p24 then
        p23._lastLog = p24
        p23:Warn(p24, p25)
    end
end
function v_u_2.Error(p26, p27, p28)
    p26:_Log(error, p27, p28)
end
function v_u_2.Catch(p29, p30, ...)
    local v31, v32 = pcall(p30, ...)
    if not v31 then
        p29:_Log(warn, ("Caught error: %*"):format(v32), 15)
    end
end
function v_u_2.PrintTable(p33, p34, p35)
    local v36 = p34 or "nil"
    if not p35 then
        p33:Print("Printing table:")
    end
    local v37 = p35 or 0
    if type(v36) == "table" then
        for v38, v39 in pairs(v36) do
            local v40 = string.rep("  ", v37) .. ("\"%*\""):format((tostring(v38))) .. ": "
            if type(v39) == "table" then
                print(v40)
                p33:PrintTable(v39, v37 + 1)
            else
                print(v40 .. tostring(v39 or "nil"))
            end
        end
    else
        p33:Print("Not a table:" .. v36)
    end
end
return v_u_2