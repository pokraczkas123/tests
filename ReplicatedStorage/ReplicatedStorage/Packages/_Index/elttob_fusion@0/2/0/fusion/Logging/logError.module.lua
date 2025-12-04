-- Decompiled game.ReplicatedStorage.Packages._Index.elttob_fusion@0.2.0.fusion.Logging.logError

local v1 = script.Parent.Parent
require(v1.Types)
local v_u_2 = require(v1.Logging.messages)
return function(p3, p4, ...)
    -- upvalues: (copy) v_u_2
    local v5
    if v_u_2[p3] == nil then
        p3 = "unknownMessage"
        v5 = v_u_2[p3]
    else
        v5 = v_u_2[p3]
    end
    local v6
    if p4 == nil then
        v6 = string.format("[Fusion] " .. v5 .. "\n(ID: " .. p3 .. ")", ...)
    else
        local v7 = v5:gsub("ERROR_MESSAGE", p4.message)
        local v8 = string.format
        local v9 = p4.trace
        v6 = v8("[Fusion] " .. v7 .. "\n(ID: " .. p3 .. ")\n---- Stack trace ----\n" .. v9, ...)
    end
    error(v6:gsub("\n", "\n    "), 0)
end