-- Decompiled game.ReplicatedStorage.Packages._Index.elttob_fusion@0.2.0.fusion.Utility.xtypeof

return function(p1)
    local v2 = typeof(p1)
    if v2 == "table" then
        local v3 = p1.type
        if typeof(v3) == "string" then
            return p1.type
        end
    end
    return v2
end