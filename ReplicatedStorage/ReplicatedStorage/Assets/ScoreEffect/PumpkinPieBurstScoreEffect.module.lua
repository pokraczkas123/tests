-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.PumpkinPieBurstScoreEffect

Random.new()
local v_u_1 = workspace.CurrentCamera
local v_u_2 = game:GetService("TweenService")
local v3 = game.ReplicatedStorage.Assets.Misc.SpecialEffects
require(v3.Modules.DebrisModule)
local v_u_5 = require(v3.Modules.ScreenShakeModule).new(Enum.RenderPriority.Camera.Value, function(p4)
    -- upvalues: (copy) v_u_1
    v_u_1.CFrame = v_u_1.CFrame * p4
end)
local function v_u_8(p6)
    for _, v_u_7 in p6:GetDescendants() do
        if v_u_7:IsA("ParticleEmitter") then
            task.delay(v_u_7:GetAttribute("EmitDelay"), function()
                -- upvalues: (copy) v_u_7
                v_u_7:Emit(v_u_7:GetAttribute("EmitCount"))
            end)
        end
    end
end
return function(p9, _, p10)
    -- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_8
    v_u_5:Start()
    local v_u_11 = script:WaitForChild("PumpkinPieBurst"):Clone()
    v_u_11.Parent = workspace:WaitForChild("Effects")
    p10:GiveTask(v_u_11)
    local v12 = v_u_11:WaitForChild("Pie")
    local v13 = v_u_11:WaitForChild("PieExplosion")
    v12.CFrame = CFrame.new(p9) * CFrame.new(0, 25, 0)
    v_u_2:Create(v12, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
        ["Position"] = p9
    }):Play()
    v_u_2:Create(v12, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
        ["Transparency"] = 0
    }):Play()
    task.wait(0.5)
    local v14 = v_u_2
    local v15 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local v16 = {}
    local v17 = v12.Size.X * 4
    local v18 = v12.Size.Y * 5
    local v19 = v12.Size.Z * 4
    v16.Size = Vector3.new(v17, v18, v19)
    v16.Position = v12.Position + Vector3.new(0, 5, 0)
    v16.Transparency = 1
    v14:Create(v12, v15, v16):Play()
    v13.CFrame = v12.CFrame
    v_u_8(v13)
    v_u_5:Shake(v_u_5.Presets.SmallExplosion)
    task.delay(2, function()
        -- upvalues: (copy) v_u_11
        v_u_11:Destroy()
    end)
end