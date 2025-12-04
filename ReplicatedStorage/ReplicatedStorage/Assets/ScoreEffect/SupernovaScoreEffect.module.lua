-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.SupernovaScoreEffect

local v_u_1 = Random.new()
local v_u_2 = game:GetService("Debris")
local v_u_3 = game:GetService("Players").LocalPlayer
local v_u_4 = workspace.CurrentCamera
local v_u_5 = game:GetService("Lighting")
local v_u_6 = game:GetService("TweenService")
game:GetService("RunService")
local v_u_7 = require(game.ReplicatedStorage.Common.State)
local v_u_8 = require(game.ReplicatedStorage.Assets.Misc.SpecialEffects.Modules.ScreenShakeModule)
local function v_u_12(p9, p10)
    for _, v11 in p9:GetDescendants() do
        if v11:IsA("ParticleEmitter") or v11:IsA("Trail") or v11:IsA("Beam") then
            v11.Enabled = p10
        end
    end
end
local function v_u_15(p13)
    for _, v_u_14 in p13:GetDescendants() do
        if v_u_14:IsA("ParticleEmitter") then
            task.delay(v_u_14:GetAttribute("EmitDelay"), function()
                -- upvalues: (copy) v_u_14
                v_u_14:Emit(v_u_14:GetAttribute("EmitCount"))
            end)
        end
    end
end
local function v_u_28(p16, p17, _, p18, p19, p20, p21)
    local v22 = Instance.new("Model", p17)
    local v23 = os.clock()
    p16.Parent = v22
    while true do
        local v24 = os.clock() - v23
        local v25 = v24 / p20
        local v26 = math.clamp(v25, 0, 1)
        local v27
        if p21 == "EaseIn" then
            v27 = v26 ^ 2
        elseif p21 == "EaseOut" then
            v27 = 1 - (1 - v26) ^ 2
        else
            v27 = p21 ~= "EaseInOut" or v26 < 0.5 and 2 * v26 ^ 2 or 1 - (-2 * v26 + 2) ^ 2 / 2
        end
        v22:ScaleTo(p18 + (p19 - p18) * v27)
        task.wait(0.01)
        if p20 <= v24 then
            p16.Parent = p17
            v22:Destroy()
            return
        end
    end
end
local function v_u_34(p29)
    -- upvalues: (copy) v_u_7, (copy) v_u_3, (copy) v_u_2
    if v_u_7.get(v_u_3, v_u_7.Id.Gameplay, "InGame") then
        local v30 = v_u_3.Character
        if v30 then
            local v31 = v30.PrimaryPart
            if v31 then
                local v32 = Instance.new("Attachment", v31)
                v_u_2:AddItem(v32, 5)
                local v33 = Instance.new("AlignPosition", v32)
                v33.ApplyAtCenterOfMass = true
                v33.Mode = Enum.PositionAlignmentMode.OneAttachment
                v33.Position = p29
                v33.MaxForce = 9000
                v33.MaxVelocity = 20
                v33.Attachment0 = v32
            end
        else
            return
        end
    else
        return
    end
end
return function(p35)
    -- upvalues: (copy) v_u_8, (copy) v_u_4, (copy) v_u_2, (copy) v_u_15, (copy) v_u_34, (copy) v_u_12, (copy) v_u_6, (copy) v_u_5, (copy) v_u_1, (copy) v_u_28
    local v_u_37 = v_u_8.new(Enum.RenderPriority.Camera.Value, function(p36)
        -- upvalues: (ref) v_u_4
        v_u_4.CFrame = workspace.CurrentCamera.CFrame * p36
    end)
    v_u_37:Start()
    task.delay(10, function()
        -- upvalues: (copy) v_u_37
        if v_u_37 and v_u_37.Stop then
            v_u_37:Stop()
        end
    end)
    local v_u_38 = script.TotalAbyss:Clone()
    v_u_2:AddItem(v_u_38, 10)
    local v39 = v_u_38.StartUpFX
    local v_u_40 = v_u_38.Blackhole
    v_u_38.Parent = workspace.Effects
    v39.CFrame = CFrame.new(p35 + Vector3.new(0, 3, 0))
    v_u_15(v39)
    v_u_34(p35)
    v_u_37:Shake(v_u_8.Presets.SmallExplosion)
    task.wait(0.25)
    v_u_40.CFrame = v39.CFrame
    v_u_12(v_u_40, true)
    v_u_6:Create(v_u_40, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {
        ["Transparency"] = 0
    }):Play()
    v_u_6:Create(v_u_40, TweenInfo.new(1.8, Enum.EasingStyle.Sine), {
        ["CFrame"] = v_u_40.CFrame * CFrame.new(0, 8, 0)
    }):Play()
    for _, v41 in v_u_40:GetDescendants() do
        if v41:IsA("Beam") then
            v_u_6:Create(v41, TweenInfo.new(0.75, Enum.EasingStyle.Linear), {
                ["Width0"] = 7.5,
                ["Width1"] = 0
            }):Play()
        end
    end
    v_u_6:Create(v_u_5, TweenInfo.new(2, Enum.EasingStyle.Linear), {
        ["ExposureCompensation"] = -0.5
    }):Play()
    task.spawn(function()
        -- upvalues: (copy) v_u_37, (ref) v_u_8
        local v42 = os.clock() + 2.25 + 3
        repeat
            v_u_37:Shake(v_u_8.Presets.SoftVibration)
            task.wait(0.5)
        until v42 <= os.clock()
    end)
    task.spawn(function()
        -- upvalues: (ref) v_u_1, (ref) v_u_6, (ref) v_u_5
        local v43 = os.clock() + 2.25 + 2
        local v44 = v_u_1:NextNumber(0.1, 0.2)
        repeat
            v_u_6:Create(v_u_5, TweenInfo.new(v44, Enum.EasingStyle.Linear), {
                ["ExposureCompensation"] = -1
            }):Play()
            task.wait(v44)
            v_u_6:Create(v_u_5, TweenInfo.new(v44, Enum.EasingStyle.Linear), {
                ["ExposureCompensation"] = -0.5
            }):Play()
            task.wait(v44)
        until v43 <= os.clock()
    end)
    task.wait(1.5)
    local v_u_45 = v_u_38.PullFX
    v_u_45.CFrame = v_u_40.CFrame
    task.spawn(function()
        -- upvalues: (ref) v_u_28, (copy) v_u_40, (copy) v_u_38
        v_u_28(v_u_40, v_u_38, "Add", 1, 1.75, 1.75, "EaseInOut")
    end)
    task.spawn(function()
        -- upvalues: (ref) v_u_28, (copy) v_u_45, (copy) v_u_38
        v_u_28(v_u_45, v_u_38, "Add", 1, 1.75, 1.75, "EaseInOut")
    end)
    v_u_45.Anchored = false
    local v46 = Instance.new("WeldConstraint")
    v46.Parent = v_u_45
    v46.Part0 = v_u_40
    v46.Part1 = v_u_45
    v46.Enabled = true
    v_u_12(v_u_45, true)
    task.delay(2.25, function()
        -- upvalues: (ref) v_u_28, (copy) v_u_40, (copy) v_u_38, (copy) v_u_45, (ref) v_u_6, (ref) v_u_12, (ref) v_u_5, (copy) v_u_37
        task.spawn(function()
            -- upvalues: (ref) v_u_28, (ref) v_u_40, (ref) v_u_38
            v_u_28(v_u_40, v_u_38, "Minus", 1, 0.001, 2, "EaseIn")
        end)
        task.spawn(function()
            -- upvalues: (ref) v_u_28, (ref) v_u_45, (ref) v_u_38
            v_u_28(v_u_45, v_u_38, "Minus", 1, 0.75, 2, "EaseIn")
        end)
        for _, v47 in v_u_40:GetDescendants() do
            if v47:IsA("Beam") then
                v_u_6:Create(v47, TweenInfo.new(0.75, Enum.EasingStyle.Linear), {
                    ["Width0"] = 0,
                    ["Width1"] = 0
                }):Play()
            end
        end
        v_u_12(v_u_40, false)
        task.wait(0.5)
        task.delay(0.35, function()
            -- upvalues: (ref) v_u_12, (ref) v_u_45
            v_u_12(v_u_45, false)
        end)
        task.wait(1)
        v_u_6:Create(v_u_40, TweenInfo.new(1, Enum.EasingStyle.Linear), {
            ["Transparency"] = 1
        }):Play()
        task.wait(1.5)
        v_u_6:Create(v_u_5, TweenInfo.new(1, Enum.EasingStyle.Linear), {
            ["ExposureCompensation"] = 0
        }):Play()
        v_u_38:Destroy()
        v_u_37:Stop()
    end)
end