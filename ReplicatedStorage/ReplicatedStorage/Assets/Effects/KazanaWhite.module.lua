-- Decompiled game.ReplicatedStorage.Assets.Effects.KazanaWhite

return function(p1)
    local v2 = script.VFX:Clone()
    v2.CFrame = p1.HumanoidRootPart.CFrame * CFrame.new(0, -3, 0)
    v2.Parent = workspace
    for _, v3 in v2:GetDescendants() do
        if v3:IsA("ParticleEmitter") then
            v3:Emit(v3:GetAttribute("EmitCount"))
        end
    end
end