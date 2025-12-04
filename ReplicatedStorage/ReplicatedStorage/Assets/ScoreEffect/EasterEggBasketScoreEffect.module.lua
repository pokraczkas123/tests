-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.EasterEggBasketScoreEffect

game:GetService("TweenService")
local v_u_1 = game:GetService("Debris")
return function(p2)
    -- upvalues: (copy) v_u_1
    local v3 = CFrame.new(p2)
    local v4 = script.Basket:Clone()
    v_u_1:AddItem(v4, 1)
    v4.CFrame = v3 * CFrame.new(0, 3, -11)
    v4.Parent = workspace
    local v5 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v4.Mesh.Scale = Vector3.new(1, 1, 1)
    local v6 = script.Appear:Clone()
    v_u_1:AddItem(v6, 7)
    v6.CFrame = v4.CFrame
    v6.Parent = workspace
    for _, v7 in v6:GetDescendants() do
        if v7:IsA("ParticleEmitter") then
            v7:Emit(v7:GetAttribute("EmitCount"))
        end
    end
    game:GetService("TweenService"):Create(v4.Mesh, v5, {
        ["Scale"] = Vector3.new(7, 7, 7)
    }):Play()
    task.wait(1)
    local v8 = script.DissAppear:Clone()
    v_u_1:AddItem(v8, 7)
    v8.CFrame = v4.CFrame * CFrame.new(0, 0, 0)
    v8.Parent = workspace
    for _, v9 in v8:GetDescendants() do
        if v9:IsA("ParticleEmitter") then
            v9:Emit(v9:GetAttribute("EmitCount"))
        end
    end
end