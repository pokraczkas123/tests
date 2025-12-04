-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.PixelExplosionScoreEffect

Random.new()
local v_u_1 = workspace.CurrentCamera
game:GetService("TweenService")
local v_u_3 = require(game.ReplicatedStorage.Assets.Misc.SpecialEffects.Modules.ScreenShakeModule).new(Enum.RenderPriority.Camera.Value, function(p2)
    -- upvalues: (copy) v_u_1
    v_u_1.CFrame = v_u_1.CFrame * p2
end)
local function v_u_6(p4)
    for _, v_u_5 in p4:GetDescendants() do
        if v_u_5:IsA("ParticleEmitter") then
            task.delay(v_u_5:GetAttribute("EmitDelay"), function()
                -- upvalues: (copy) v_u_5
                v_u_5:Emit(v_u_5:GetAttribute("EmitCount"))
            end)
        end
    end
end
return function(p7, _, p8)
    -- upvalues: (copy) v_u_3, (copy) v_u_6
    v_u_3:Start()
    local v_u_9 = script.PixelatedExplosion:Clone()
    local v10 = v_u_9.ExplosionFX
    p8:GiveTask(v_u_9)
    v_u_9.Parent = workspace.Effects
    v10.Position = p7
    v_u_6(v10)
    v_u_3:Shake(v_u_3.Presets.MidExplosion)
    task.delay(2, function()
        -- upvalues: (copy) v_u_9
        v_u_9:Destroy()
    end)
end