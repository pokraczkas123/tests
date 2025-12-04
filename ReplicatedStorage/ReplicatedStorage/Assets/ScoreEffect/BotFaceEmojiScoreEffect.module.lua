-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.BotFaceEmojiScoreEffect

Random.new()
local v_u_1 = workspace.CurrentCamera
game:GetService("TweenService")
local v_u_3 = require(game.ReplicatedStorage.Assets.Misc.SpecialEffects.Modules.ScreenShakeModule).new(Enum.RenderPriority.Camera.Value, function(p2)
    -- upvalues: (copy) v_u_1
    v_u_1.CFrame = v_u_1.CFrame * p2
end)
v_u_3:Start()
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
return function(p7, _, _)
    -- upvalues: (copy) v_u_6, (copy) v_u_3
    local v_u_8 = script:WaitForChild("RobotEmoji"):Clone()
    v_u_8.Parent = workspace.Effects
    local v9 = v_u_8:WaitForChild("RobotEmojiFX")
    v9.CFrame = CFrame.new(p7)
    v_u_6(v9)
    v_u_3:Start(v_u_3.Presets.SmallExplosion)
    task.delay(2.5, function()
        -- upvalues: (copy) v_u_8
        v_u_8:Destroy()
    end)
end