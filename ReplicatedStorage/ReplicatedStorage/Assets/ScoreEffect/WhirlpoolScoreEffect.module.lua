-- Decompiled game.ReplicatedStorage.Assets.ScoreEffect.WhirlpoolScoreEffect

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
local function v_u_9(p6, p7)
    for _, v8 in p6:GetDescendants() do
        if v8:IsA("ParticleEmitter") or v8:IsA("Trail") or v8:IsA("Beam") then
            v8.Enabled = p7
        end
    end
end
local function v_u_14(p10, p11, p12)
    for v13 = 1, #p12 do
        p10.Decal.Texture = "rbxassetid://" .. p12[v13]
        task.wait(p11 / #p12)
    end
end
return function(p15, p16, p_u_17)
    -- upvalues: (copy) v_u_1, (copy) v_u_4, (copy) v_u_9, (copy) v_u_3, (copy) v_u_14
    p16:WaitForChild("Humanoid")
    p16:WaitForChild("HumanoidRootPart")
    local v18 = CFrame.new(p15) * CFrame.new(0, 8, 0)
    local v19 = CFrame.Angles
    local v20 = v_u_1:NextNumber(-360, 360)
    local v_u_21 = v18 * v19(3.141592653589793, math.rad(v20), 0)
    local v_u_22 = os.clock() + 2.55
    local v_u_23 = script.Whirlpool:Clone()
    v_u_4:AddItem(v_u_23, 10)
    local v_u_24 = v_u_23.WhirlpoolFX
    v_u_23.Parent = workspace.Effects
    v_u_24.CFrame = v_u_21
    v_u_9(v_u_24, true)
    task.spawn(function()
        -- upvalues: (copy) v_u_23, (copy) p_u_17, (ref) v_u_1, (copy) v_u_21, (ref) v_u_3, (copy) v_u_24, (ref) v_u_14, (copy) v_u_22, (ref) v_u_9
        local v25 = { Color3.fromRGB(255, 255, 255), Color3.fromRGB(80, 150, 400) }
        local v26 = 1
        local v27 = 1
        local v_u_28 = {
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
        repeat
            local v_u_29 = v_u_23.WhirlpoolMesh:Clone()
            p_u_17:GiveTask(v_u_29)
            v_u_29.Parent = v_u_23
            local v30 = v_u_1:NextNumber(-17.5, -10)
            local v31 = v_u_29.Mesh
            local v32 = v_u_1:NextNumber(-20, -15)
            v31.Scale = Vector3.new(v30, v32, v30)
            v_u_29.Decal.Color3 = v25[v26]
            v_u_29.Decal.ZIndex = v27
            v27 = v27 + -1
            local v33 = v26 + 1
            v26 = #v25 < v33 and 1 or v33
            v_u_29.CFrame = v_u_21
            v_u_3:Create(v_u_29, TweenInfo.new(0.75, Enum.EasingStyle.Sine), {
                ["CFrame"] = v_u_29.CFrame * CFrame.Angles(0, 2.6179938779914944, 0)
            }):Play()
            v_u_3:Create(v_u_24, TweenInfo.new(0.1, Enum.EasingStyle.Sine), {
                ["CFrame"] = v_u_24.CFrame * CFrame.Angles(0, 0.3490658503988659, 0)
            }):Play()
            task.spawn(function()
                -- upvalues: (ref) v_u_14, (copy) v_u_29, (copy) v_u_28
                v_u_14(v_u_29, 0.75, v_u_28)
                v_u_29:Destroy()
            end)
            task.wait(0.1)
        until v_u_22 <= os.clock()
        v_u_3:Create(v_u_24, TweenInfo.new(1.5, Enum.EasingStyle.Sine), {
            ["CFrame"] = v_u_24.CFrame * CFrame.Angles(0, 2.0943951023931953, 0)
        }):Play()
        v_u_9(v_u_24, false)
    end)
    task.wait(5)
end