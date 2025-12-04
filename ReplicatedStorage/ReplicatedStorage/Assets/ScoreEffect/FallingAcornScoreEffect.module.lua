-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.FallingAcornScoreEffect

local v_u_1 = Random.new()
local v_u_2 = workspace.CurrentCamera
local v_u_3 = game:GetService("TweenService")
local v4 = game.ReplicatedStorage.Assets.Misc.SpecialEffects
local v_u_6 = require(v4.Modules.ScreenShakeModule).new(Enum.RenderPriority.Camera.Value, function(p5)
    -- upvalues: (copy) v_u_2
    v_u_2.CFrame = v_u_2.CFrame * p5
end)
return function(p7, _, p8)
    -- upvalues: (copy) v_u_6, (copy) v_u_1, (copy) v_u_3
    v_u_6:Start()
    local v9 = os.clock() + 2
    local v_u_10 = script:WaitForChild("FallingAcorns"):Clone()
    v_u_10.Parent = workspace.Effects
    p8:GiveTask(v_u_10)
    v_u_6:ShakeSustain(v_u_6.Presets.SofterVibration)
    repeat
        local v_u_11 = v_u_10:WaitForChild("Acorn"):Clone()
        v_u_11.Parent = v_u_10
        local v12 = CFrame.new(p7) * CFrame.new(v_u_1:NextNumber(-10, 10), v_u_1:NextNumber(2, 6), v_u_1:NextNumber(-10, 10))
        local v13 = CFrame.Angles
        local v14 = v_u_1:NextNumber(-360, 360)
        local v15 = math.rad(v14)
        local v16 = v_u_1:NextNumber(-360, 360)
        local v17 = math.rad(v16)
        local v18 = v_u_1:NextNumber(-360, 360)
        v_u_11.CFrame = v12 * v13(v15, v17, (math.rad(v18)))
        v_u_11.Anchored = false
        task.delay(1.25, function()
            -- upvalues: (ref) v_u_3, (copy) v_u_11
            v_u_3:Create(v_u_11, TweenInfo.new(0.75, Enum.EasingStyle.Sine), {
                ["Size"] = Vector3.new(0, 0, 0)
            }):Play()
            task.wait(0.75)
            v_u_11:Destroy()
        end)
        task.wait(0.04)
    until v9 <= os.clock()
    v_u_6:StopSustained(1)
    task.delay(2.5, function()
        -- upvalues: (copy) v_u_10
        v_u_10:Destroy()
    end)
end