-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.ConfettiBurstScoreEffect

Random.new()
local v_u_1 = workspace.CurrentCamera
game:GetService("TweenService")
local v_u_3 = require(game.ReplicatedStorage.Assets.Misc.SpecialEffects.Modules.ScreenShakeModule).new(Enum.RenderPriority.Camera.Value, function(p2)
    -- upvalues: (copy) v_u_1
    v_u_1.CFrame = v_u_1.CFrame * p2
end)
local v_u_4 = require(game.ReplicatedStorage.Assets.Misc.SpecialEffects.Modules.DebrisModule)
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
    -- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_4
    v_u_3:Start()
    local v10 = script.Confetti:Clone()
    p9:GiveTask(v10)
    local v11 = v10.ConfettiFX
    v10.Parent = workspace.Effects
    v11.Position = p8
    v_u_7(v11)
    local v12 = {
        ["CFrame"] = CFrame.new(p8)
    }
    v_u_4(v12, {
        ["Size"] = Vector3.new(1, 1, 1),
        ["Duration"] = 2,
        ["FallSpeed"] = -0.75,
        ["CanCollide"] = false,
        ["Amount"] = 4,
        ["Velocity"] = 65,
        ["SizeMultiplier"] = 1,
        ["SpreadFactor"] = 2.5,
        ["Part"] = "ConfettiLines1"
    })
    v_u_4(v12, {
        ["Size"] = Vector3.new(1, 1, 1),
        ["Duration"] = 2,
        ["FallSpeed"] = -0.75,
        ["CanCollide"] = false,
        ["Amount"] = 4,
        ["Velocity"] = 65,
        ["SizeMultiplier"] = 1,
        ["SpreadFactor"] = 2.5,
        ["Part"] = "ConfettiLines2"
    })
end