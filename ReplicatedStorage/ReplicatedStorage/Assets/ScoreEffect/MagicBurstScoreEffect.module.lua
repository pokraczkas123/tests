-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.MagicBurstScoreEffect

local v_u_1 = Random.new()
local _ = game:GetService("Players").LocalPlayer
local v_u_2 = workspace.CurrentCamera
local v_u_3 = game:GetService("TweenService")
game:GetService("RunService")
local v_u_4 = game:GetService("Debris")
require(game.ReplicatedStorage.Assets.Misc.SpecialEffects.Modules.ScreenShakeModule).new(Enum.RenderPriority.Camera.Value, function(p5)
    -- upvalues: (copy) v_u_2
    v_u_2.CFrame = v_u_2.CFrame * p5
end):Start()
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
local function v_u_13(p9, p10, p11)
    for v12 = 1, #p11 do
        p9.Decal.Texture = "rbxassetid://" .. p11[v12]
        task.wait(p10 / #p11)
    end
end
return function(p14)
    -- upvalues: (copy) v_u_4, (copy) v_u_8, (copy) v_u_1, (copy) v_u_3, (copy) v_u_13
    local v_u_15 = CFrame.new(p14)
    local v_u_16 = os.clock() + 0.85
    local v_u_17 = script.MagicBurst:Clone()
    v_u_4:AddItem(v_u_17, 6)
    local v_u_18 = v_u_17.MagicBurstFX
    v_u_17.Parent = workspace.Effects
    for _, v19 in v_u_18:GetDescendants() do
        if v19:IsA("ParticleEmitter") then
            v19.Lifetime = NumberRange.new(1.25)
        end
    end
    v_u_18.CFrame = v_u_15 * CFrame.new(0, -3, 0)
    v_u_8(v_u_18)
    task.spawn(function()
        -- upvalues: (copy) v_u_17, (copy) v_u_18, (copy) v_u_15, (ref) v_u_1, (ref) v_u_3, (ref) v_u_13, (copy) v_u_16
        local v20 = {
            Color3.fromRGB(610, 350, 500),
            Color3.fromRGB(134, 0, 216),
            Color3.fromRGB(600, 250, 450),
            Color3.fromRGB(85, 0, 127),
            Color3.fromRGB(170, 0, 255)
        }
        local v21 = 1
        local v_u_22 = {
            125887162135393,
            112507827639021,
            105374957881764,
            92063435542326,
            123975534525135,
            82482922665093,
            70697642909228,
            136106714855922,
            71716541189184,
            137861727654566,
            114241791475300,
            104119904226773,
            127671889184709,
            126168008948745,
            83170477954621
        }
        local v23 = 6
        local v24 = 1
        repeat
            local v_u_25 = v_u_17.BallMesh:Clone()
            v_u_25.Parent = v_u_17
            v_u_25.Mesh.Scale = Vector3.new(v23, v23, v23)
            v_u_25.Decal.Color3 = v20[v24]
            v_u_25.Decal.ZIndex = v21
            v21 = v21 + -1
            local v26 = v24 + 1
            v24 = #v20 < v26 and 1 or v26
            v23 = v23 + 0.35
            v_u_18.CFrame = v_u_15 * CFrame.new(0, -3, 0)
            local v27 = v_u_15 * CFrame.new(0, -3, 0)
            local v28 = CFrame.Angles
            local v29 = v_u_1:NextNumber(-360, 360)
            v_u_25.CFrame = v27 * v28(0, math.rad(v29), 0)
            local v30 = v_u_3
            local v31 = v_u_25.Mesh
            local v32 = TweenInfo.new(0.75, Enum.EasingStyle.Quint)
            local v33 = {}
            local v34 = v23 + 2
            local v35 = v23 + 2
            local v36 = v23 + 2
            v33.Scale = Vector3.new(v34, v35, v36)
            v30:Create(v31, v32, v33):Play()
            v_u_3:Create(v_u_25, TweenInfo.new(0.75, Enum.EasingStyle.Sine), {
                ["CFrame"] = v_u_25.CFrame * CFrame.Angles(0, 2.6179938779914944, 0)
            }):Play()
            task.spawn(function()
                -- upvalues: (ref) v_u_13, (copy) v_u_25, (copy) v_u_22
                v_u_13(v_u_25, 0.75, v_u_22)
                v_u_25:Destroy()
            end)
            task.wait(0.025)
        until v_u_16 <= os.clock()
    end)
    task.delay(3, function()
        -- upvalues: (copy) v_u_17
        v_u_17:Destroy()
    end)
end