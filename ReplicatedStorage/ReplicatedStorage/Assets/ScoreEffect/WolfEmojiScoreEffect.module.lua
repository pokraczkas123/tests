-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.WolfEmojiScoreEffect

return function(p1, _, _)
    local v2 = script.VBLWolfExpo:Clone()
    v2.Parent = workspace.Effects
    v2.Position = p1
    for _, v3 in v2:GetDescendants() do
        if v3:IsA("ParticleEmitter") then
            v3:Emit(v3:GetAttribute("EmitCount"))
        end
    end
end