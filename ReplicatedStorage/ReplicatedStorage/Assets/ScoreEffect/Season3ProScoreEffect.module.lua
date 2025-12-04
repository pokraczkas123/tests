-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.Season3ProScoreEffect

Random.new()
local _ = game:GetService("Players").LocalPlayer
local v_u_1 = workspace.CurrentCamera
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
game:GetService("RunService")
local v_u_4 = game:GetService("Debris")
local v_u_5 = require(v2.Assets.Misc.SpecialEffects.Modules.ScreenShakeModule)
local v_u_7 = v_u_5.new(Enum.RenderPriority.Camera.Value, function(p6)
    -- upvalues: (copy) v_u_1
    v_u_1.CFrame = v_u_1.CFrame * p6
end)
v_u_7:Start()
local function v_u_11(p8, p9)
    for _, v10 in p8:GetDescendants() do
        if v10:IsA("ParticleEmitter") or v10:IsA("Trail") or v10:IsA("Beam") then
            v10.Enabled = p9
        end
    end
end
local function v_u_14(p12)
    for _, v_u_13 in p12:GetDescendants() do
        if v_u_13:IsA("ParticleEmitter") then
            task.delay(v_u_13:GetAttribute("EmitDelay"), function()
                -- upvalues: (copy) v_u_13
                v_u_13:Emit(v_u_13:GetAttribute("EmitCount"))
            end)
        end
    end
end
return function(p15, _)
    -- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_11, (copy) v_u_7, (copy) v_u_5, (copy) v_u_14
    local v16 = CFrame.new(p15) * CFrame.new(0, 0.5, 0)
    local v_u_17 = script.LightningStrike:Clone()
    v_u_4:AddItem(v_u_17, 6)
    local v18 = v_u_17.LightningFX
    local v19 = v_u_17.LightningImpactFX
    v_u_17.Parent = workspace.Effects
    v18.CFrame = v16
    v19.CFrame = v18.CFrame
    v_u_3:Create(v18.Att0.Att1, TweenInfo.new(0.05, Enum.EasingStyle.Linear), {
        ["CFrame"] = CFrame.new(0, -75, 0)
    }):Play()
    v_u_11(v18, true)
    task.wait(0.025)
    v_u_7:Shake(v_u_5.Presets.SmallExplosion)
    v_u_14(v19)
    for _, v20 in v18:GetDescendants() do
        if v20:IsA("Beam") then
            v_u_3:Create(v20, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
                ["Width0"] = 0,
                ["Width1"] = 0
            }):Play()
        end
    end
    task.delay(4, function()
        -- upvalues: (copy) v_u_17
        v_u_17:Destroy()
    end)
end