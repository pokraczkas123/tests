-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.GobbleStormScoreEffect

local v_u_1 = Random.new()
local v_u_2 = workspace.CurrentCamera
local v_u_3 = game:GetService("TweenService")
local v4 = game.ReplicatedStorage.Assets.Misc.SpecialEffects
local v_u_6 = require(v4.Modules.ScreenShakeModule).new(Enum.RenderPriority.Camera.Value, function(p5)
    -- upvalues: (copy) v_u_2
    v_u_2.CFrame = v_u_2.CFrame * p5
end)
local function v_u_10(p7, p8)
    for _, v9 in p7:GetDescendants() do
        if v9:IsA("ParticleEmitter") or v9:IsA("Trail") or v9:IsA("Beam") then
            v9.Enabled = p8
        end
    end
end
return function(p11, _, p12)
    -- upvalues: (copy) v_u_6, (copy) v_u_1, (copy) v_u_10, (copy) v_u_3
    v_u_6:Start()
    local v13 = os.clock() + 1
    local v_u_14 = script:WaitForChild("GobbleStorm"):Clone()
    v_u_14.Parent = workspace:WaitForChild("Effects")
    p12:GiveTask(v_u_14)
    v_u_6:ShakeSustain(v_u_6.Presets.SofterVibration)
    while true do
        local v_u_15 = v_u_14:WaitForChild("Turkey"):Clone()
        v_u_15.Parent = v_u_14
        local v16 = CFrame.new(p11)
        local v17 = CFrame.Angles
        local v18 = v_u_1:NextNumber(-360, 360)
        v_u_15:PivotTo(v16 * v17(1.5707963267948966, 0, (math.rad(v18))))
        v_u_10(v_u_15, true)
        for _, v_u_19 in v_u_15:GetChildren() do
            if v_u_19:IsA("BasePart") then
                v_u_3:Create(v_u_19, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {
                    ["Transparency"] = 0
                }):Play()
                v_u_3:Create(v_u_19, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    ["CFrame"] = v_u_19.CFrame * CFrame.new(35, 0, 0)
                }):Play()
                task.delay(0.75, function()
                    -- upvalues: (ref) v_u_3, (copy) v_u_19, (ref) v_u_10, (copy) v_u_15
                    v_u_3:Create(v_u_19, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
                        ["Transparency"] = 1
                    }):Play()
                    v_u_10(v_u_15, false)
                    task.delay(0.5, function()
                        -- upvalues: (ref) v_u_15
                        v_u_15:Destroy()
                    end)
                end)
            end
        end
        task.wait(0.05555555555555555)
        if v13 <= os.clock() then
            v_u_6:StopSustained(1)
            task.delay(2.5, function()
                -- upvalues: (copy) v_u_14
                v_u_14:Destroy()
            end)
            return
        end
    end
end