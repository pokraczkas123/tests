-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.GlowStickDanceScoreEffect

Random.new()
local v_u_1 = workspace.CurrentCamera
game:GetService("TweenService")
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("Debris")
local v_u_5 = require(game.ReplicatedStorage.Assets.Misc.SpecialEffects.Modules.ScreenShakeModule).new(Enum.RenderPriority.Camera.Value, function(p4)
    -- upvalues: (copy) v_u_1
    v_u_1.CFrame = v_u_1.CFrame * p4
end)
local v_u_6 = require(game.ReplicatedStorage.Assets.Misc.SpecialEffects.Modules.DebrisModule)
local function v_u_21(p7, p8)
    -- upvalues: (copy) v_u_3, (copy) v_u_2
    p8.Archivable = true
    local v9 = p8:Clone()
    if v9:FindFirstChild("Weld") then
        v9:FindFirstChild("Weld"):Destroy()
    end
    local v10 = v9.HumanoidRootPart.CFrame
    p8.Archivable = false
    local v11 = v9.Humanoid
    v_u_3:AddItem(v9, 5)
    for _, v12 in v9:GetDescendants() do
        if v12:IsA("BaseScript") or v12:IsA("Highlight") or v12:IsA("BillboardGui") then
            v12:Destroy()
        end
        if v12:IsA("BasePart") then
            v12.CanQuery = false
            v12.CanCollide = false
            v12.CanTouch = false
        end
    end
    local v13 = v10.Position
    local v14 = v10 - v10.Position
    local v15 = CFrame.new(v13.X, p7.Y + 1.5, v13.Z) * v14
    v9.HumanoidRootPart.Anchored = true
    v9:ScaleTo(0.5)
    v9.Parent = workspace.Effects
    v9:PivotTo(CFrame.new(p7, v15.Position) + Vector3.new(0, 1.5, 0))
    local v16 = Instance.new("Animation")
    v16.Parent = v11
    v16.AnimationId = "rbxassetid://124317486814333"
    local v17 = v11.Animator:LoadAnimation(v16)
    v17.Priority = Enum.AnimationPriority.Action4
    v17.Looped = true
    v17:Play()
    local v18 = v_u_2.Assets.Misc.Glowsticks:Clone()
    for _, v19 in ipairs(v18:GetChildren()) do
        local v20 = Instance.new("Motor6D")
        v20.Part0 = v9:FindFirstChild((("%*Hand"):format(v19.Name)))
        v20.Part1 = v19
        v20.C0 = CFrame.new(-0.002, -0.173, -0.318) * CFrame.fromOrientation(1.5707963267948966, 3.141592653589793, 0)
        v20.Parent = v18
    end
    v18.Parent = v9
end
local function v_u_24(p22)
    for _, v_u_23 in p22:GetDescendants() do
        if v_u_23:IsA("ParticleEmitter") then
            task.delay(v_u_23:GetAttribute("EmitDelay"), function()
                -- upvalues: (copy) v_u_23
                v_u_23:Emit(v_u_23:GetAttribute("EmitCount"))
            end)
        end
    end
end
return function(p25, p26, p27)
    -- upvalues: (copy) v_u_21, (copy) v_u_5, (copy) v_u_24, (copy) v_u_6
    if p26 and p26.Parent then
        v_u_21(p25 + Vector3.new(4, 0, 0), p26)
        v_u_21(p25, p26)
        v_u_21(p25 + Vector3.new(-4, 0, 0), p26)
    end
    v_u_5:Start()
    local v28 = script.Confetti:Clone()
    p27:GiveTask(v28)
    local v29 = v28.ConfettiFX
    v28.Parent = workspace.Effects
    v29.Position = p25
    v_u_24(v29)
    local v30 = {
        ["CFrame"] = CFrame.new(p25)
    }
    v_u_6(v30, {
        ["Size"] = Vector3.new(1, 1, 1),
        ["Duration"] = 2,
        ["FallSpeed"] = -0.75,
        ["CanCollide"] = false,
        ["Amount"] = 4,
        ["Velocity"] = 65,
        ["SizeMultiplier"] = 1,
        ["SpreadFactor"] = 2.5,
        ["Part"] = "ConfettiLines1"
    })
    v_u_6(v30, {
        ["Size"] = Vector3.new(1, 1, 1),
        ["Duration"] = 2,
        ["FallSpeed"] = -0.75,
        ["CanCollide"] = false,
        ["Amount"] = 4,
        ["Velocity"] = 65,
        ["SizeMultiplier"] = 1,
        ["SpreadFactor"] = 2.5,
        ["Part"] = "ConfettiLines2"
    })
end