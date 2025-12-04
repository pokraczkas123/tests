-- Decompiled game.ReplicatedStorage.Packages._Index.elttob_fusion@0.2.0.fusion.Logging.parseError

local v1 = script.Parent.Parent
require(v1.Types)
return function(p2)
    return {
        ["type"] = "Error",
        ["raw"] = p2,
        ["message"] = p2:gsub("^.+:%d+:%s*", ""),
        ["trace"] = debug.traceback(nil, 2)
    }
end