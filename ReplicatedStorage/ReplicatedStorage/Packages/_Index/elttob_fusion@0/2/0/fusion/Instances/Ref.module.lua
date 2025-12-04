-- Decompiled game.ReplicatedStorage.Packages._Index.elttob_fusion@0.2.0.fusion.Instances.Ref

local v1 = script.Parent.Parent
require(v1.PubTypes)
local v_u_2 = require(v1.Logging.logError)
local v_u_3 = require(v1.Utility.xtypeof)
return {
    ["type"] = "SpecialKey",
    ["kind"] = "Ref",
    ["stage"] = "observer",
    ["apply"] = function(_, p_u_4, p5, p6)
        -- upvalues: (copy) v_u_3, (copy) v_u_2
        if v_u_3(p_u_4) == "State" and p_u_4.kind == "Value" then
            p_u_4:set(p5)
            table.insert(p6, function()
                -- upvalues: (copy) p_u_4
                p_u_4:set(nil)
            end)
        else
            v_u_2("invalidRefType")
        end
    end
}