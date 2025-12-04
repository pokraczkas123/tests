-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.Season9ProScoreEffect

Random.new()
local v_u_1 = workspace.CurrentCamera
game:GetService("TweenService")
local v2 = game.ReplicatedStorage.Assets.Misc.SpecialEffects
local v_u_4 = require(v2.Modules.ScreenShakeModule).new(Enum.RenderPriority.Camera.Value, function(p3)
    -- upvalues: (copy) v_u_1
    v_u_1.CFrame = v_u_1.CFrame * p3
end)
local function v_u_7(p5)
    for _, v_u_6 in p5:GetDescendants() do
        if v_u_6:IsA("ParticleEmitter") then
            task.delay(v_u_6:GetAttribute("EmitDelay"), function()
                -- upvalues: (copy) v_u_6
                v_u_6:Emit(v_u_6:GetAttribute("EmitCount"))
            end)
        end
    end
end
return function(p8, _, p9)
    -- upvalues: (copy) v_u_4, (copy) v_u_7
    v_u_4:Start()
    local v_u_10 = script:WaitForChild("FallingEclipse"):Clone()
    v_u_10.Parent = workspace.Effects
    p9:GiveTask(v_u_10)
    local v11 = v_u_10:WaitForChild("FallingEclipseFX")
    v11.CFrame = CFrame.new(p8)
    v_u_7(v11)
    v_u_4:Start(v_u_4.Presets.SmallExplosion)
    task.delay(2.5, function()
        -- upvalues: (copy) v_u_10
        v_u_10:Destroy()
    end)
end