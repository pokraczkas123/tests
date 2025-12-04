-- Decompiled game.ReplicatedStorage.Assets.Misc.SpecialEffects.Modules.BezierModule.Quadratic

return function(p1, p2, p3, p4)
    return (1 - p1) ^ 2 * p2 + 2 * (1 - p1) * p1 * p3 + p1 ^ 2 * p4
end