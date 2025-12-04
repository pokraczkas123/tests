-- Decompiled game.ReplicatedStorage.Assets.Effects.TileBurst

local v_u_1 = Random.new()
local _ = game:GetService("Players").LocalPlayer
local _ = workspace.CurrentCamera
local v_u_2 = game:GetService("Debris")
local v_u_3 = game:GetService("TweenService")
game:GetService("RunService")
local function v_u_7(p4, p5)
    for _, v6 in p4:GetDescendants() do
        if v6:IsA("ParticleEmitter") or v6:IsA("Trail") or v6:IsA("Beam") then
            v6.Enabled = p5
        end
    end
end
local function v_u_10(p8)
    for _, v_u_9 in p8:GetDescendants() do
        if v_u_9:IsA("ParticleEmitter") then
            task.delay(v_u_9:GetAttribute("EmitDelay"), function()
                -- upvalues: (copy) v_u_9
                v_u_9:Emit(v_u_9:GetAttribute("EmitCount"))
            end)
        end
    end
end
return function(p11, p12)
    -- upvalues: (copy) v_u_2, (copy) v_u_7, (copy) v_u_10, (copy) v_u_1, (copy) v_u_3
    local v13 = os.clock() + p12
    local v_u_14 = script.TileBurst:Clone()
    v_u_2:AddItem(v_u_14, 5)
    local v15 = v_u_14.SpleefTile
    v_u_14.Parent = workspace.Effects
    v15.CFrame = p11.CFrame * CFrame.new(0, 0, 0)
    local v16 = v15.CFrame
    for _, v17 in v15:GetDescendants() do
        if v17:IsA("ParticleEmitter") then
            v17.Color = ColorSequence.new(v15.SurfaceAppearance.Color)
        end
    end
    v_u_7(v15, true)
    v_u_10(v15.CrackFX)
    repeat
        local v18 = CFrame.Angles
        local v19 = v_u_1:NextNumber(-3.5, 3.5)
        local v20 = math.rad(v19)
        local v21 = v_u_1:NextNumber(3.5, 3.5)
        local v22 = math.rad(v21)
        local v23 = v_u_1:NextNumber(-3.5, 3.5)
        local v24 = v18(v20, v22, (math.rad(v23)))
        v_u_3:Create(v15, TweenInfo.new(0.04, Enum.EasingStyle.Linear), {
            ["CFrame"] = v15.CFrame * v24
        }):Play()
        task.wait(0.04)
        v_u_3:Create(v15, TweenInfo.new(0.04, Enum.EasingStyle.Linear), {
            ["CFrame"] = v16
        }):Play()
        task.wait(0.04)
    until v13 <= os.clock()
    v15.CrackFX:Destroy()
    v_u_7(v15, false)
    v_u_10(v15)
    v15.Transparency = 1
    task.delay(1, function()
        -- upvalues: (copy) v_u_14
        v_u_14:Destroy()
    end)
end