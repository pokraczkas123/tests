-- Decompiled game.ReplicatedStorage.Assets.Misc.SpecialEffects.Effects.GodlyRoll

local v1 = {}
Random.new()
local v_u_2 = game:GetService("Players").LocalPlayer
local v_u_3 = workspace.CurrentCamera
game:GetService("TweenService")
local v_u_4 = game:GetService("RunService")
local v_u_5 = require(game.ReplicatedStorage.Packages.Knit).GetController("InterfaceController")
local v_u_6 = require(game.ReplicatedStorage.Tools.Character)
local v_u_7 = require(game.ReplicatedStorage.Assets.Misc.SpecialEffects.Modules.ScreenShakeModule)
local v_u_9 = v_u_7.new(Enum.RenderPriority.Camera.Value, function(p8)
    -- upvalues: (copy) v_u_3
    v_u_3.CFrame = workspace.CurrentCamera.CFrame * p8
end)
v_u_9:Start()
local function v_u_13(p10, p11)
    for _, v12 in p10:GetDescendants() do
        if v12:IsA("ParticleEmitter") or v12:IsA("Trail") or v12:IsA("Beam") then
            v12.Enabled = p11
        end
    end
end
local function v_u_16(p14)
    for _, v_u_15 in p14:GetDescendants() do
        if v_u_15:IsA("ParticleEmitter") then
            task.delay(v_u_15:GetAttribute("EmitDelay"), function()
                -- upvalues: (copy) v_u_15
                v_u_15:Emit(v_u_15:GetAttribute("EmitCount"))
            end)
        end
    end
end
function v1.Start(_, p17)
    -- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_13, (copy) v_u_16, (copy) v_u_4, (copy) v_u_9, (copy) v_u_7, (copy) v_u_6, (copy) v_u_5
    local v_u_18 = p17 or v_u_2.Character or v_u_2.CharacterAdded:Wait()
    v_u_18:WaitForChild("Humanoid")
    local v_u_19 = v_u_18:WaitForChild("HumanoidRootPart")
    v_u_3.CameraType = Enum.CameraType.Scriptable
    local v20 = script.GodlyRoll:Clone()
    v20.Parent = workspace.Effects
    local v_u_21 = v20.CamFX
    local v_u_22 = v20.RollFX
    local v_u_23 = v20.TextGUi
    v_u_23.Parent = v_u_2.PlayerGui
    v_u_13(v_u_21, true)
    local v_u_24 = false
    task.delay(0.1, function()
        -- upvalues: (ref) v_u_16, (copy) v_u_21, (ref) v_u_24
        v_u_16(v_u_21)
        task.wait(1.5)
        task.wait(0.5)
        repeat
            v_u_21.Stars:Emit(1)
            task.wait(0.075)
        until v_u_24
    end)
    local v_u_25 = os.clock() + 3.5
    local v_u_26 = nil
    v_u_26 = v_u_4.RenderStepped:Connect(function()
        -- upvalues: (copy) v_u_21, (ref) v_u_3, (copy) v_u_25, (ref) v_u_26, (ref) v_u_24, (copy) v_u_23, (copy) v_u_22, (copy) v_u_19, (ref) v_u_16, (ref) v_u_9, (ref) v_u_7, (ref) v_u_6, (copy) v_u_18, (ref) v_u_5, (ref) v_u_13
        v_u_21.CFrame = v_u_3.CFrame * CFrame.new(0, 0, -1) * CFrame.Angles(0, 0, 3.141592653589793)
        if v_u_25 <= os.clock() then
            v_u_26:Disconnect()
            v_u_26 = nil
            v_u_24 = true
            task.delay(0.85, function()
                -- upvalues: (ref) v_u_23, (ref) v_u_22, (ref) v_u_19, (ref) v_u_16, (ref) v_u_9, (ref) v_u_7, (ref) v_u_6, (ref) v_u_18, (ref) v_u_5
                v_u_23:Destroy()
                v_u_22.CFrame = v_u_19.CFrame * CFrame.new(0, -2.75, 0)
                v_u_16(v_u_22)
                v_u_9:Shake(v_u_7.Presets.SmallExplosion)
                v_u_6.lookAt(v_u_18)
                v_u_5.App.Enabled = true
            end)
            v_u_13(v_u_21, false)
            task.delay(2, function()
                -- upvalues: (ref) v_u_21
                v_u_21:Destroy()
            end)
        end
    end)
end
return v1