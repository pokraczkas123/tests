-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.PumpkinSmashScoreEffect

Random.new()
local v_u_1 = workspace.CurrentCamera
local v_u_2 = game:GetService("TweenService")
local v_u_3 = require(game.ReplicatedStorage.Assets.Misc.SpecialEffects.Modules.DebrisModule)
local v_u_5 = require(game.ReplicatedStorage.Assets.Misc.SpecialEffects.Modules.ScreenShakeModule).new(Enum.RenderPriority.Camera.Value, function(p4)
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
return function(p9, _, _)
    -- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_8, (copy) v_u_3
    v_u_5:Start()
    local v_u_10 = script.PumpkinFall:Clone()
    local v11 = v_u_10.Pumpkin
    local v12 = v_u_10.PumpkinExplosion
    local v13 = v_u_10.Candy1:Clone()
    local v14 = v_u_10.Candy2:Clone()
    v_u_10.Parent = workspace.Effects
    local v15 = game.ReplicatedStorage.Assets.Misc.SpecialEffects.Modules.DebrisModule
    local v16 = game.ReplicatedStorage.Assets.Misc.SpecialEffects.Modules.DebrisModule
    v13.Parent = v15
    v14.Parent = v16
    v11.CFrame = CFrame.new(p9) * CFrame.new(0, 25, 0)
    v_u_2:Create(v11, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
        ["Position"] = p9
    }):Play()
    task.wait(0.5)
    local v17 = v11.Size
    local v18 = v17 * Vector3.new(1.3, 0.5, 1.3)
    local v19 = v11.CFrame
    v11.Size = v18
    v_u_2:Create(v11, TweenInfo.new(1.7, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
        ["Size"] = v17,
        ["CFrame"] = v19 * CFrame.new(0, 3, 0)
    }):Play()
    task.wait(1.7)
    v_u_2:Create(v11, TweenInfo.new(0.3, Enum.EasingStyle.Elastic, Enum.EasingDirection.In), {
        ["Size"] = Vector3.new(0.1, 0.1, 0.1)
    }):Play()
    task.wait(0.3)
    v11.Transparency = 1
    v12.CFrame = v11.CFrame * CFrame.new(0, -5.85, 0)
    local v20 = v12.CFrame
    local v21 = v12.CFrame
    v13.CFrame = v20
    v14.CFrame = v21
    v_u_8(v12)
    v_u_5:Shake(v_u_5.Presets.SmallExplosion)
    v_u_3(v13, {
        ["Size"] = v13.Size,
        ["Duration"] = 3,
        ["FallSpeed"] = -0.625,
        ["CanCollide"] = true,
        ["Amount"] = 7,
        ["Velocity"] = 50,
        ["SizeMultiplier"] = 1,
        ["SpreadFactor"] = 2,
        ["Part"] = "Candy1"
    })
    v_u_3(v14, {
        ["Size"] = v14.Size,
        ["Duration"] = 3,
        ["FallSpeed"] = -0.625,
        ["CanCollide"] = true,
        ["Amount"] = 7,
        ["Velocity"] = 50,
        ["SizeMultiplier"] = 1,
        ["SpreadFactor"] = 2,
        ["Part"] = "Candy2"
    })
    task.delay(2, function()
        -- upvalues: (copy) v_u_10
        v_u_10:Destroy()
    end)
end