-- Decompiled game.ReplicatedStorage.Assets.Misc.SpecialEffects.Effects.LegendaryRoll

local v1 = {}
Random.new()
local v_u_2 = game:GetService("Players").LocalPlayer
local v_u_3 = workspace.CurrentCamera
game:GetService("TweenService")
game:GetService("RunService")
local v_u_4 = require(game.ReplicatedStorage.Assets.Misc.SpecialEffects.Modules.ScreenShakeModule)
local v_u_6 = v_u_4.new(Enum.RenderPriority.Camera.Value, function(p5)
    -- upvalues: (copy) v_u_3
    v_u_3.CFrame = workspace.CurrentCamera.CFrame * p5
end)
v_u_6:Start()
local function v_u_9(p7)
    for _, v_u_8 in p7:GetDescendants() do
        if v_u_8:IsA("ParticleEmitter") then
            task.delay(v_u_8:GetAttribute("EmitDelay"), function()
                -- upvalues: (copy) v_u_8
                v_u_8:Emit(v_u_8:GetAttribute("EmitCount"))
            end)
        end
    end
end
function v1.Start(_, p10)
    -- upvalues: (copy) v_u_2, (copy) v_u_9, (copy) v_u_6, (copy) v_u_4
    local v11 = p10 or v_u_2.Character or v_u_2.CharacterAdded:Wait()
    v11:WaitForChild("Humanoid")
    local v12 = v11:WaitForChild("HumanoidRootPart")
    local v_u_13 = script.LegendaryRoll:Clone()
    v_u_13.Parent = workspace.Effects
    local v14 = v_u_13.RollFX
    v14.CFrame = v12.CFrame * CFrame.new(0, -2.85, 0)
    v_u_9(v14)
    v_u_6:Shake(v_u_4.Presets.SoftExplosion)
    task.delay(2, function()
        -- upvalues: (copy) v_u_13
        v_u_13:Destroy()
    end)
end
return v1