-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.CosmicSpiralScoreEffect

Random.new()
local _ = game:GetService("Players").LocalPlayer
local v_u_1 = workspace.CurrentCamera
game:GetService("TweenService")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("Debris")
require(game.ReplicatedStorage.Assets.Misc.SpecialEffects.Modules.ScreenShakeModule).new(Enum.RenderPriority.Camera.Value, function(p4)
    -- upvalues: (copy) v_u_1
    v_u_1.CFrame = v_u_1.CFrame * p4
end):Start()
local function v_u_8(p5, p6)
    for _, v7 in p5:GetDescendants() do
        if v7:IsA("ParticleEmitter") or v7:IsA("Trail") or v7:IsA("Beam") then
            v7.Enabled = p6
        end
    end
end
local function v_u_11(p9)
    for _, v_u_10 in p9:GetDescendants() do
        if v_u_10:IsA("ParticleEmitter") then
            task.delay(v_u_10:GetAttribute("EmitDelay"), function()
                -- upvalues: (copy) v_u_10
                v_u_10:Emit(v_u_10:GetAttribute("EmitCount"))
            end)
        end
    end
end
return function(p12)
    -- upvalues: (copy) v_u_3, (copy) v_u_8, (copy) v_u_11, (copy) v_u_2
    local v13 = CFrame.new(p12)
    local v_u_14 = script.Cosmosis:Clone()
    v_u_3:AddItem(v_u_14, 7)
    local v15 = v_u_14.CosmosFX
    local v16 = v_u_14.CosmosStartFX
    v_u_14.Parent = workspace.Effects or workspace
    v15.CFrame = v13 * CFrame.new(0, 7.5, 0) * CFrame.Angles(0.17453292519943295, 0, -0.17453292519943295)
    v16.CFrame = v15.CFrame
    v_u_8(v15, true)
    v_u_11(v16)
    local v_u_17 = Instance.new("Model", v_u_14)
    v15.Parent = v_u_17
    local v_u_18 = os.clock()
    local v_u_19 = nil
    v_u_19 = v_u_2.Heartbeat:Connect(function(_)
        -- upvalues: (copy) v_u_18, (copy) v_u_17, (ref) v_u_19
        local v20 = (os.clock() - v_u_18) / 2
        local v21 = math.clamp(v20, 0, 1)
        v_u_17:ScaleTo((1 - (1 - v21) ^ 2) * 9 + 1)
        if v21 >= 1 then
            v_u_19:Disconnect()
            v_u_19 = nil
        end
    end)
    task.wait(3)
    v_u_8(v15, false)
    task.delay(5, function()
        -- upvalues: (copy) v_u_14
        v_u_14:Destroy()
    end)
end