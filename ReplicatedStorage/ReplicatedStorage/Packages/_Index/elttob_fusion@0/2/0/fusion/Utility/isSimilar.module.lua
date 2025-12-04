-- Decompiled game.ReplicatedStorage.Packages._Index.elttob_fusion@0.2.0.fusion.Utility.isSimilar

return function(p1, p2)
    if typeof(p1) == "table" then
        return false
    else
        return p1 == p2
    end
end