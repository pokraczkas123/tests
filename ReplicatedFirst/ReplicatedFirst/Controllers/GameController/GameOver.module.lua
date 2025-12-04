-- Decompiled game.ReplicatedFirst.Controllers.GameController.GameOver

local v_u_1 = UDim2.fromScale(1.089, 0.327)
local v_u_2 = UDim2.fromScale(0.5, -0.089)
local v_u_3 = UDim2.fromScale(2.417, 2)
local v_u_4 = UDim2.fromScale(2.079, 0.3892)
local v_u_5 = UDim2.fromScale(2.371, 0.498)
local v_u_6 = UDim2.fromScale(2.97, 0.556)
local v_u_7 = game:GetService("Debris")
local v_u_8 = game:GetService("Players")
local v_u_9 = game:GetService("ReplicatedFirst")
local v_u_10 = game:GetService("TweenService")
return function()
    -- upvalues: (copy) v_u_9, (copy) v_u_8, (copy) v_u_7, (copy) v_u_3, (copy) v_u_4, (copy) v_u_10, (copy) v_u_5, (copy) v_u_6, (copy) v_u_2, (copy) v_u_1
    local v11 = v_u_9.Assets.GameOver:Clone()
    v11.Parent = v_u_8.LocalPlayer.PlayerGui
    v_u_7:AddItem(v11, 1.5)
    local v12 = v11.Container.ImageLabel
    v12.Position = v_u_3
    v12.Size = v_u_4
    local v13 = {
        ["Position"] = v_u_5,
        ["Size"] = v_u_6
    }
    v_u_10:Create(v12, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v13):Play()
    task.wait(0.3)
    local v14 = {
        ["Position"] = v_u_2,
        ["Size"] = v_u_1
    }
    v_u_10:Create(v12, TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), v14):Play()
end