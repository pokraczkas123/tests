-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.SpellCasterScoreEffect

game:GetService("TweenService")
local v_u_1 = game:GetService("Debris")
local v_u_2 = game:GetService("ReplicatedStorage")
local function v_u_15(p3, p4)
    -- upvalues: (copy) v_u_1, (copy) v_u_2
    p4.Archivable = true
    local v5 = p4:Clone()
    if v5:FindFirstChild("Weld") then
        v5:FindFirstChild("Weld"):Destroy()
    end
    local v6 = v5.HumanoidRootPart.CFrame
    p4.Archivable = false
    local v7 = v5.Humanoid
    v_u_1:AddItem(v5, 5)
    for _, v8 in v5:GetDescendants() do
        if v8:IsA("BaseScript") or v8:IsA("Highlight") or v8:IsA("BillboardGui") then
            v8:Destroy()
        end
        if v8:IsA("BasePart") then
            v8.CanQuery = false
            v8.CanCollide = false
            v8.CanTouch = false
        end
    end
    local v9 = v6.Position
    local v10 = v6 - v6.Position
    local v11 = CFrame.new(v9.X, p3.Y + 1.5, v9.Z) * v10
    v5.HumanoidRootPart.Anchored = true
    v5.Parent = workspace.Effects
    v5:PivotTo(CFrame.new(p3, v11.Position) + Vector3.new(0, 1.5, 0))
    local v12 = Instance.new("Animation")
    v12.Parent = v7
    v12.AnimationId = "rbxassetid://125478268691034"
    local v13 = v_u_2.Assets.Misc.Wand:Clone()
    v13.Parent = v5
    v13.Motor6D.Part0 = v5.HumanoidRootPart
    v13.Motor6D.Parent = v5.HumanoidRootPart
    v_u_1:AddItem(v13, 5)
    local v14 = v7.Animator:LoadAnimation(v12)
    v14.Priority = Enum.AnimationPriority.Action4
    v14.Looped = true
    v5:ScaleTo(0.5)
    v14:Play()
end
game:GetService("TweenService")
local v_u_16 = game:GetService("Debris")
return function(p17, p18)
    -- upvalues: (copy) v_u_15, (copy) v_u_16
    if p18 and p18.Parent then
        v_u_15(p17 + Vector3.new(4, 0, 0), p18)
        v_u_15(p17, p18)
        v_u_15(p17 + Vector3.new(-4, 0, 0), p18)
    end
    local v19 = CFrame.new(p17)
    local v20 = script.MeshPartss:Clone()
    v_u_16:AddItem(v20, 7)
    v20.CFrame = v19 * CFrame.new(0, -2.5, 0)
    v20.Parent = workspace
    local v21 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v20.Transparency = 0.5
    v20.Size = Vector3.new(0.1, 0.1, 0.1)
    game:GetService("TweenService"):Create(v20, v21, {
        ["Size"] = Vector3.new(25, 1, 25),
        ["Transparency"] = 1
    }):Play()
    local v22 = script.MeshPart2:Clone()
    v_u_16:AddItem(v22, 7)
    v22.CFrame = v19 * CFrame.new(0, -2.5, 0)
    v22.Parent = workspace
    local v23 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v22.Transparency = 0.5
    v22.Size = Vector3.new(0.1, 0.1, 0.1)
    game:GetService("TweenService"):Create(v22, v23, {
        ["Size"] = Vector3.new(25, 0.1, 25),
        ["Transparency"] = 1
    }):Play()
    local v24 = script.MeshPart3:Clone()
    v_u_16:AddItem(v24, 7)
    v24.CFrame = v19 * CFrame.new(0, -2.5, 0)
    v24.Parent = workspace
    local v25 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    v24.Transparency = 0.5
    v24.Size = Vector3.new(0.1, 0.1, 0.1)
    game:GetService("TweenService"):Create(v24, v25, {
        ["Size"] = Vector3.new(35, 10, 35),
        ["Transparency"] = 1
    }):Play()
    local v26 = script.PastelSwirl:Clone()
    v_u_16:AddItem(v26, 7)
    v26.CFrame = v22.CFrame * CFrame.new(0, 0, 0)
    v26.Parent = workspace
    for _, v27 in v26:GetDescendants() do
        if v27:IsA("ParticleEmitter") then
            v27:Emit(v27:GetAttribute("EmitCount"))
        end
    end
end