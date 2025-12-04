-- Decompiled game.ReplicatedStorage.Assets.Misc.SpecialEffects.Modules.BezierModule.Cubic

return function(p1, p2, p3, p4, p5)
    return (1 - p1) ^ 3 * p2 + 3 * (1 - p1) ^ 2 * p1 * p3 + 3 * (1 - p1) * p1 ^ 2 * p4 + p1 ^ 3 * p5
end