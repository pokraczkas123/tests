-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.FlamethrowerScoreEffect

game:GetService("TweenService")
local v_u_1 = game:GetService("Debris")
local v_u_2 = game:GetService("ReplicatedStorage")
local function v_u_16(p3, p4)
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
    v12.AnimationId = "rbxassetid://113946301576816"
    local v13 = v_u_2.Assets.Misc.Flamethrower:Clone()
    local v14 = Instance.new("Motor6D")
    v13.Name = "Tee Joint.001"
    v13.Parent = v5
    v14.Part0 = v5.HumanoidRootPart
    v14.Part1 = v13
    v14.Parent = v5.HumanoidRootPart
    v13.Parent = v5
    v_u_1:AddItem(v13, 5)
    local v15 = v7.Animator:LoadAnimation(v12)
    v15.Priority = Enum.AnimationPriority.Action4
    v15.Looped = true
    v5:ScaleTo(0.5)
    v15:Play()
end
game:GetService("TweenService")
local v_u_17 = game:GetService("Debris")
return function(p18, p19)
    -- upvalues: (copy) v_u_16, (copy) v_u_17
    if p19 and p19.Parent then
        v_u_16(p18 + Vector3.new(4, 0, 0), p19)
        v_u_16(p18, p19)
        v_u_16(p18 + Vector3.new(-4, 0, 0), p19)
    end
    local _ = p19.Humanoid
    local _ = p19.HumanoidRootPart
    local _ = p19.UpperTorso
    local v20 = script.LavaImpact:Clone()
    v_u_17:AddItem(v20, 5)
    v20.CFrame = CFrame.new(p18)
    v20.Parent = workspace
    for _, v21 in v20:GetDescendants() do
        if v21:IsA("ParticleEmitter") then
            v21:Emit(v21:GetAttribute("EmitCount"))
        end
    end
    task.wait(5)
    v20:Destroy()
end