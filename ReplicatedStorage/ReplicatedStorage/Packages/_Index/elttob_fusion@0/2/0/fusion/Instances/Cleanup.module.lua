-- Decompiled game.ReplicatedStorage.Packages._Index.elttob_fusion@0.2.0.fusion.Instances.Cleanup

local v1 = script.Parent.Parent
require(v1.PubTypes)
return {
    ["type"] = "SpecialKey",
    ["kind"] = "Cleanup",
    ["stage"] = "observer",
    ["apply"] = function(_, p2, _, p3)
        table.insert(p3, p2)
    end
}