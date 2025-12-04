-- Decompiled game.ReplicatedStorage.Assets.WinScreen.HakkaWinScreen.Scenes.1.Effects

local v_u_1 = game:GetService("TweenService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Tools.Sound)
local v_u_4 = require(v2.Content.Effect)
local v_u_5 = require(v2.Assets.Effects.CloneEffect)
return function(p_u_6)
    -- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_1, (copy) v_u_4
    workspace.CurrentCamera.FieldOfView = 14.96
    v_u_3.new({
        ["Id"] = "rbxassetid://115227690270666",
        ["Volume"] = 1.5
    })
    task.delay(0.75, function()
        -- upvalues: (copy) p_u_6, (ref) v_u_5, (ref) v_u_1
        for v7 = 1, 2 do
            local v8 = p_u_6:FindFirstChild((("ClonePlayer%*"):format(v7)))
            if v8 then
                v_u_5(v8)
            end
        end
        v_u_1:Create(workspace.CurrentCamera, TweenInfo.new(0.16666666666666666), {
            ["FieldOfView"] = 33.550000000000004
        }):Play()
    end)
    task.delay(1, function()
        -- upvalues: (ref) v_u_1
        v_u_1:Create(workspace.CurrentCamera, TweenInfo.new(0.43333333333333335, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
            ["FieldOfView"] = 40.04
        }):Play()
    end)
    task.delay(2.45, function()
        -- upvalues: (copy) p_u_6, (ref) v_u_4
        local v9 = p_u_6:FindFirstChild("ClonePlayer1")
        v_u_4:Play("Particle")({
            ["Name"] = "CloneFX",
            ["Duration"] = 0.15,
            ["Origin"] = v9.UpperTorso.CFrame
        })
    end)
end