-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.BunnyHopScoreEffect

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
    v11.AnimationId = "rbxassetid://111675566255592"
    local v12 = v6.Animator:LoadAnimation(v11)
    v12.Priority = Enum.AnimationPriority.Action4
    v12.Looped = true
    v12:Play()
end
game:GetService("TweenService")
local v_u_14 = game:GetService("Debris")
return function(p15, p16)
    -- upvalues: (copy) v_u_13, (copy) v_u_14
    if p16 and p16.Parent then
        v_u_13(p15 + Vector3.new(4, 0, 0), p16)
        v_u_13(p15, p16)
        v_u_13(p15 + Vector3.new(-4, 0, 0), p16)
    end
    local v17 = CFrame.new(p15)
    local v18 = script.MeshPartss:Clone()
    v_u_14:AddItem(v18, 7)
    v18.CFrame = v17 * CFrame.new(0, -2.5, 0)
    v18.Parent = workspace
    local v19 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v18.Transparency = 0.5
    v18.Size = Vector3.new(0.1, 0.1, 0.1)
    game:GetService("TweenService"):Create(v18, v19, {
        ["Size"] = Vector3.new(25, 1, 25),
        ["Transparency"] = 1
    }):Play()
    local v20 = script.MeshPart2:Clone()
    v_u_14:AddItem(v20, 7)
    v20.CFrame = v17 * CFrame.new(0, -2.5, 0)
    v20.Parent = workspace
    local v21 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v20.Transparency = 0.5
    v20.Size = Vector3.new(0.1, 0.1, 0.1)
    game:GetService("TweenService"):Create(v20, v21, {
        ["Size"] = Vector3.new(25, 0.1, 25),
        ["Transparency"] = 1
    }):Play()
    local v22 = script.MeshPart3:Clone()
    v_u_14:AddItem(v22, 7)
    v22.CFrame = v17 * CFrame.new(0, -2.5, 0)
    v22.Parent = workspace
    local v23 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v22.Transparency = 0.5
    v22.Size = Vector3.new(0.1, 0.1, 0.1)
    game:GetService("TweenService"):Create(v22, v23, {
        ["Size"] = Vector3.new(35, 10, 35),
        ["Transparency"] = 1
    }):Play()
    local v24 = script.PastelSwirl:Clone()
    v_u_14:AddItem(v24, 7)
    v24.CFrame = v20.CFrame * CFrame.new(0, 0, 0)
    v24.Parent = workspace
    for _, v25 in v24:GetDescendants() do
        if v25:IsA("ParticleEmitter") then
            v25:Emit(v25:GetAttribute("EmitCount"))
        end
    end
end