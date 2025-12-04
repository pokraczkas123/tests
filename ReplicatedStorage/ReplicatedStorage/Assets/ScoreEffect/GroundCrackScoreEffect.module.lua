-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.GroundCrackScoreEffect

Random.new()
local v_u_1 = workspace.CurrentCamera
local v_u_2 = game:GetService("RunService")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = game:GetService("TweenService")
local v_u_5 = require(v3.Assets.Misc.SpecialEffects.Modules.ViewportWindow)
local v_u_7 = require(v3.Assets.Misc.SpecialEffects.Modules.ScreenShakeModule).new(Enum.RenderPriority.Camera.Value, function(p6)
    -- upvalues: (copy) v_u_1
    v_u_1.CFrame = v_u_1.CFrame * p6
end)
local function v_u_11(p8, p9)
    for _, v10 in p8:GetDescendants() do
        if v10:IsA("ParticleEmitter") or v10:IsA("Trail") or v10:IsA("Beam") then
            v10.Enabled = p9
        end
    end
end
local function v_u_39(p12, p13, p14)
    local v15 = {}
    local v16 = "Frame" .. 1
    table.insert(v15, v16)
    local v17 = "Frame" .. 2
    table.insert(v15, v17)
    local v18 = "Frame" .. 3
    table.insert(v15, v18)
    local v19 = "Frame" .. 4
    table.insert(v15, v19)
    local v20 = "Frame" .. 5
    table.insert(v15, v20)
    local v21 = "Frame" .. 6
    table.insert(v15, v21)
    local v22 = "Frame" .. 7
    table.insert(v15, v22)
    local v23 = "Frame" .. 8
    table.insert(v15, v23)
    local v24 = "Frame" .. 9
    table.insert(v15, v24)
    local v25 = "Frame" .. 10
    table.insert(v15, v25)
    local v26 = "Frame" .. 11
    table.insert(v15, v26)
    local v27 = "Frame" .. 12
    table.insert(v15, v27)
    local v28 = "Frame" .. 13
    table.insert(v15, v28)
    local v29 = "Frame" .. 14
    table.insert(v15, v29)
    local v30 = "Frame" .. 15
    table.insert(v15, v30)
    local v31 = "Frame" .. 16
    table.insert(v15, v31)
    local v32 = "Frame" .. 17
    table.insert(v15, v32)
    local v33 = "Frame" .. 18
    table.insert(v15, v33)
    local v34 = "Frame" .. 19
    table.insert(v15, v34)
    local v35 = "Frame" .. 20
    table.insert(v15, v35)
    for _, v36 in ipairs(v15) do
        local v37 = p14:FindFirstChild(v36)
        if v37 then
            local v38 = p12:FindFirstChildOfClass("SurfaceAppearance")
            if v38 then
                v38:Destroy()
            end
            v37:Clone().Parent = p12
            task.wait(p13 / #v15)
        end
    end
end
return function(p40, _, p41)
    -- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_11, (copy) v_u_5, (copy) v_u_39, (copy) v_u_2, (copy) v_u_1
    v_u_7:Start()
    local v_u_42 = os.clock() + 3
    local v_u_43 = script:WaitForChild("Earthquake"):Clone()
    p41:GiveTask(v_u_43)
    local v44 = v_u_43:WaitForChild("Background")
    local v45 = v_u_43:WaitForChild("Alpha")
    local v_u_46 = v_u_43:WaitForChild("SecondAlpha")
    local v47 = v_u_43:WaitForChild("Window")
    local v_u_48 = v_u_43:WaitForChild("Dirt")
    v_u_43.Parent = workspace.Effects
    local v49 = CFrame.new(p40) * CFrame.new(0, -4, 0)
    local v50 = CFrame.new(p40) * CFrame.new(0, -4, 0)
    v44.CFrame = v49
    v45.CFrame = v50
    local v51 = CFrame.new(p40)
    local v52 = CFrame.new(p40)
    v_u_46.CFrame = v51
    v47.CFrame = v52
    v_u_48.CFrame = v_u_46.CFrame * CFrame.new(0, -2, v_u_46.Size.Z / -2)
    local v53 = v_u_4
    local v54 = TweenInfo.new(1.5, Enum.EasingStyle.Sine)
    local v55 = {
        ["CFrame"] = v_u_46.CFrame * CFrame.new(0, -2, 0)
    }
    local v56 = v_u_46.Size.Z
    v55.Size = Vector3.new(30, 5, v56)
    v53:Create(v_u_48, v54, v55):Play()
    v44.Material = Enum.Material.Basalt
    v44.Color = Color3.fromRGB(49, 49, 49)
    v_u_11(v_u_48, true)
    local v_u_57 = v_u_5.FromPart(v47, Enum.NormalId.Top, 0)
    v45.Parent = v_u_57.WorldFrame
    v_u_46.Parent = v_u_57.WorldFrame
    v44.Parent = v_u_57.WorldFrame
    v_u_57.WorldFrame.LightColor = Color3.new(1, 1, 1)
    v_u_57.WorldFrame.Ambient = Color3.new(1, 1, 1)
    v_u_57.WorldFrame.BackgroundColor = BrickColor.new("Really black")
    v_u_57.WorldFrame.LightDirection = Vector3.new(-1, -1, -1)
    v_u_7:ShakeSustain(v_u_7.Presets.SoftVibration)
    task.spawn(function()
        -- upvalues: (ref) v_u_39, (copy) v_u_46, (copy) v_u_43, (ref) v_u_11, (copy) v_u_48
        v_u_39(v_u_46, 1.5, v_u_43.Variants)
        v_u_46:Destroy()
        task.delay(1, function()
            -- upvalues: (ref) v_u_11, (ref) v_u_48
            v_u_11(v_u_48, false)
        end)
    end)
    local v_u_58 = nil
    v_u_58 = v_u_2.RenderStepped:Connect(function()
        -- upvalues: (copy) v_u_57, (ref) v_u_1, (copy) v_u_42, (ref) v_u_58, (ref) v_u_7, (copy) v_u_43
        v_u_57:Render(v_u_1.CFrame)
        if v_u_42 <= os.clock() then
            v_u_58:Disconnect()
            v_u_58 = nil
            v_u_7:StopSustained(1)
            v_u_57:Destroy()
            v_u_43:Destroy()
        end
    end)
    p41:GiveTask(v_u_58)
end