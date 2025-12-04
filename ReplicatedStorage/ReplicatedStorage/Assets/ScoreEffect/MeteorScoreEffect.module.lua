-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.MeteorScoreEffect

local v_u_1 = game:GetService("CollectionService")
local v_u_2 = Random.new()
local _ = game:GetService("Players").LocalPlayer
local v_u_3 = workspace.CurrentCamera
local v_u_4 = game:GetService("TweenService")
local v_u_5 = game:GetService("RunService")
local v_u_6 = game:GetService("Debris")
local v_u_8 = require(game.ReplicatedStorage.Assets.Misc.SpecialEffects.Modules.ScreenShakeModule).new(Enum.RenderPriority.Camera.Value, function(p7)
    -- upvalues: (copy) v_u_3
    v_u_3.CFrame = v_u_3.CFrame * p7
end)
v_u_8:Start()
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
local function v_u_49(p16, p17, p18, p19, p20, p21, p22, p23, p24, p25, p_u_26)
    -- upvalues: (copy) v_u_6, (copy) v_u_4, (copy) v_u_5, (copy) v_u_1
    local v27 = nil
    for v28 = 0, 360, 360 / p17 do
        local v29 = math.rad(v28)
        local v30 = math.cos(v29) * p18
        local v31 = math.sin(v29) * p18
        local v32 = Vector3.new(v30, p19, v31)
        local v33 = p23:GetPivot()
        local v34 = CFrame.new
        local v35 = -p19
        local v36 = (v33 * v34(v32 + Vector3.new(0, v35, 0))).Position
        v27 = v27 or workspace:Raycast(v36, p20, p22)
        if v27 then
            local v37 = v27.Instance
            local v38 = v27.Position
            local v_u_39 = p21[math.random(1, #p21)]:Clone()
            v_u_6:AddItem(v_u_39, 10)
            v_u_39.Parent = p16
            v_u_39:AddTag("RockDebris")
            v_u_39.Transparency = 0
            v_u_39.Top.Transparency = 0
            v_u_39.CFrame = CFrame.new(v38 + Vector3.new(0, p19, 0), p23:GetPivot().Position) * CFrame.Angles(math.rad(p24), 0, 0)
            v_u_4:Create(v_u_39, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
                ["CFrame"] = v_u_39.CFrame * CFrame.new(0, 3, 0)
            }):Play()
            v_u_39.Top.BrickColor = v37.BrickColor
            v_u_39.Top.Material = v37.Material
            v_u_39:SetAttribute("OriginalSize", v_u_39.Size)
            task.delay(p25, function()
                -- upvalues: (ref) v_u_4, (copy) v_u_39, (copy) p_u_26
                v_u_4:Create(v_u_39, TweenInfo.new(p_u_26, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                    ["CFrame"] = v_u_39.CFrame * CFrame.new(0, -7.5, 0)
                }):Play()
                task.wait(0.15)
                v_u_4:Create(v_u_39, TweenInfo.new(p_u_26, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                    ["Transparency"] = 1
                }):Play()
                task.delay(0.25, function()
                    -- upvalues: (ref) v_u_4, (ref) v_u_39, (ref) p_u_26
                    v_u_4:Create(v_u_39.Top, TweenInfo.new(p_u_26 * 0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                        ["Transparency"] = 1
                    }):Play()
                end)
            end)
        end
    end
    task.delay(p25, function()
        -- upvalues: (ref) v_u_5, (copy) p_u_26, (ref) v_u_1
        local v_u_40 = os.clock()
        local v_u_41 = nil
        v_u_41 = v_u_5.Heartbeat:Connect(function(_)
            -- upvalues: (copy) v_u_40, (ref) p_u_26, (ref) v_u_1, (ref) v_u_41
            local v42 = (os.clock() - v_u_40) / p_u_26
            local v43 = math.clamp(v42, 0, 1)
            local v44 = v43 * -5
            local v45 = math.exp(v44)
            local v46 = math.max(0.001, v45)
            for _, v47 in v_u_1:GetTagged("RockDebris") do
                v47.Size = v47:GetAttribute("OriginalSize") * Vector3.new(1, 1, 1) * v46
            end
            if v43 >= 1 then
                v_u_41:Disconnect()
                v_u_41 = nil
                for _, v48 in v_u_1:GetTagged("RockDebris") do
                    if not (v48 and v48.Parent) then
                        return
                    end
                    v48:RemoveTag("RockDebris")
                    v48:Destroy()
                end
            end
        end)
    end)
end
return function(p50, p51)
    -- upvalues: (copy) v_u_6, (copy) v_u_12, (copy) v_u_4, (copy) v_u_49, (copy) v_u_2, (copy) v_u_15, (copy) v_u_8
    p51:WaitForChild("Humanoid")
    p51:WaitForChild("HumanoidRootPart")
    local v_u_52 = RaycastParams.new()
    v_u_52.FilterDescendantsInstances = { workspace.Effects, p51 }
    local v_u_53 = script.MeteorCrash:Clone()
    v_u_6:AddItem(v_u_53, 10)
    local v_u_54 = v_u_53.EndCFrameRef
    local v55 = v_u_53.Meteor
    local v_u_56 = v_u_53.CrashFX
    local v_u_57 = v_u_53.Rocks
    local v_u_58 = {
        v_u_57.Rock1,
        v_u_57.Rock2,
        v_u_57.Rock3,
        v_u_57.Rock4,
        v_u_57.Rock5
    }
    local v_u_59 = v_u_53.Iframes
    v_u_53.Parent = workspace.Effects
    v55:PivotTo(CFrame.new(p50) * CFrame.new(-25, 50, 25))
    v_u_54.CFrame = CFrame.new(p50) * CFrame.new(25, -3, -25)
    v_u_12(v55, true)
    for _, v60 in v55:GetDescendants() do
        if v60:IsA("BasePart") then
            v_u_4:Create(v60, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
                ["Transparency"] = 0
            }):Play()
            v_u_4:Create(v60, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ["Position"] = v_u_54.Position
            }):Play()
            v60.CFrame = CFrame.lookAt(v60.Position, v_u_54.Position) * CFrame.Angles(0, 1.9198621771937625, 0)
        end
    end
    task.wait(1.5)
    v55["Cube.016"].Transparency = 1
    v55["Cube.018"].Transparency = 1
    v_u_12(v55, false)
    v_u_56.CFrame = v_u_54.CFrame * CFrame.new(0, 10, 0)
    v_u_49(v_u_57, 10, v_u_2:NextNumber(14, 16), v_u_2:NextNumber(-4, -3), Vector3.new(0, -25, 0), v_u_58, v_u_52, v_u_56, v_u_2:NextNumber(-75, -55), 1, 1.75)
    task.delay(0.025, function()
        -- upvalues: (ref) v_u_49, (copy) v_u_57, (ref) v_u_2, (copy) v_u_58, (copy) v_u_52, (copy) v_u_56, (copy) v_u_54, (ref) v_u_15, (ref) v_u_8
        v_u_49(v_u_57, 14, v_u_2:NextNumber(17, 19), v_u_2:NextNumber(-4, -3), Vector3.new(0, -25, 0), v_u_58, v_u_52, v_u_56, v_u_2:NextNumber(-25, -15), 1, 1.75)
        v_u_56.CFrame = v_u_54.CFrame
        v_u_15(v_u_56)
        v_u_8:Shake(v_u_8.Presets.BigExplosion)
    end)
    task.spawn(function()
        -- upvalues: (copy) v_u_59
        v_u_59.Parent = game.Lighting
        for _, v61 in ipairs({ 7.5, -7.5, 7.5 }) do
            v_u_59.Contrast = v61
            task.wait(0.05)
        end
        v_u_59:Destroy()
    end)
    task.delay(3, function()
        -- upvalues: (copy) v_u_53
        v_u_53:Destroy()
    end)
end