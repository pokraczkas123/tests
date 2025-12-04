-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.TapDancerScoreEffect

game:GetService("TweenService")
local v_u_1 = game:GetService("Debris")
local function v_u_13(p2, p3)
    -- upvalues: (copy) v_u_1
    p3.Archivable = true
    local v4 = p3:Clone()
    if v4:FindFirstChild("Weld") then
        v4:FindFirstChild("Weld"):Destroy()
    end
    local v5 = v4.HumanoidRootPart.CFrame
    p3.Archivable = false
    local v6 = v4.Humanoid
    v_u_1:AddItem(v4, 5)
    for _, v7 in v4:GetDescendants() do
        if v7:IsA("BaseScript") or v7:IsA("Highlight") or v7:IsA("BillboardGui") then
            v7:Destroy()
        end
        if v7:IsA("BasePart") then
            v7.CanQuery = false
            v7.CanCollide = false
            v7.CanTouch = false
        end
    end
    local v8 = v5.Position
    local v9 = v5 - v5.Position
    local v10 = CFrame.new(v8.X, p2.Y + 1.5, v8.Z) * v9
    v4.HumanoidRootPart.Anchored = true
    v4:ScaleTo(0.5)
    v4.Parent = workspace.Effects
    v4:PivotTo(CFrame.new(p2, v10.Position) + Vector3.new(0, 1.5, 0))
    local v11 = Instance.new("Animation")
    v11.Parent = v6
    v11.AnimationId = "rbxassetid://10714076981"
    local v12 = v6.Animator:LoadAnimation(v11)
    v12.Priority = Enum.AnimationPriority.Action4
    v12.Looped = true
    v12:Play()
end
return function(p14, p15)
    -- upvalues: (copy) v_u_13, (copy) v_u_1
    if p15 and p15.Parent then
        v_u_13(p14 + Vector3.new(4, 0, 0), p15)
        v_u_13(p14, p15)
        v_u_13(p14 + Vector3.new(-4, 0, 0), p15)
    end
    local v16 = CFrame.new(p14)
    local v17 = script.MeshPartss:Clone()
    v_u_1:AddItem(v17, 7)
    v17.CFrame = v16 * CFrame.new(0, -2.5, 0)
    v17.Parent = workspace
    local v18 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v17.Transparency = 0.5
    v17.Size = Vector3.new(0.1, 0.1, 0.1)
    game:GetService("TweenService"):Create(v17, v18, {
        ["Size"] = Vector3.new(75, 3, 75),
        ["Transparency"] = 1
    }):Play()
    local v19 = script.MeshPart2:Clone()
    v_u_1:AddItem(v19, 7)
    v19.CFrame = v16 * CFrame.new(0, -2.5, 0)
    v19.Parent = workspace
    local v20 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v19.Transparency = 0.5
    v19.Size = Vector3.new(0.1, 0.1, 0.1)
    game:GetService("TweenService"):Create(v19, v20, {
        ["Size"] = Vector3.new(75, 0.3, 75),
        ["Transparency"] = 1
    }):Play()
    local v21 = script.MeshPart3:Clone()
    v_u_1:AddItem(v21, 7)
    v21.CFrame = v16 * CFrame.new(0, -2.5, 0)
    v21.Parent = workspace
    local v22 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v21.Transparency = 0.5
    v21.Size = Vector3.new(0.1, 0.1, 0.1)
    game:GetService("TweenService"):Create(v21, v22, {
        ["Size"] = Vector3.new(105, 30, 105),
        ["Transparency"] = 1
    }):Play()
    local v23 = script.VFX:Clone()
    v_u_1:AddItem(v23, 7)
    v23.CFrame = v19.CFrame * CFrame.new(0, 0, 0)
    v23.Parent = workspace
    for _, v24 in v23:GetDescendants() do
        if v24:IsA("ParticleEmitter") then
            v24:Emit(v24:GetAttribute("EmitCount"))
        end
    end
end