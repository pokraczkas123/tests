-- Decompiled game.ReplicatedFirst.Assets.RankupVfxUI.VFX

local v_u_1 = game:GetService("TweenService")
local v_u_2 = require(script.Parent.InterfaceShaker)
local _ = game.Players.LocalPlayer
local v_u_3 = script.Parent
local v_u_4 = v_u_3.BckgFrame
local v_u_5 = v_u_3.PrevRankIcon
local v_u_6 = v_u_5.Glow
local v_u_7 = v_u_3.NewRankIcon
local v_u_8 = v_u_3.RankUpTxt
local v_u_9 = v_u_3.NewRank
local v_u_10 = v_u_3.ScreenFlash
return function()
    -- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10, (copy) v_u_4, (copy) v_u_1, (copy) v_u_2, (copy) v_u_7, (copy) v_u_3
    script.Parent.SFX:Play()
    v_u_5.Visible = false
    v_u_6.Visible = false
    v_u_8.Visible = false
    v_u_9.Visible = false
    v_u_10.Visible = false
    v_u_4.Visible = true
    v_u_4.BackgroundTransparency = 1
    v_u_1:Create(v_u_4, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {
        ["BackgroundTransparency"] = 0.4
    }):Play()
    task.wait(0.2)
    v_u_5.Visible = true
    v_u_5.Position = UDim2.fromScale(0.5, 0.5)
    v_u_5.ImageTransparency = 1
    v_u_1:Create(v_u_5, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        ["ImageTransparency"] = 0,
        ["Position"] = UDim2.fromScale(0.5, 0.393)
    }):Play()
    task.wait(0.7)
    v_u_2.ShakeOnce(v_u_5, 10, 0, 2, 0)
    v_u_6.Visible = true
    v_u_6.ImageTransparency = 1
    v_u_1:Create(v_u_6, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        ["ImageTransparency"] = 0.5
    }):Play()
    v_u_1:Create(v_u_5.UIAspectRatioConstraint, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        ["AspectRatio"] = 1.25
    }):Play()
    v_u_1:Create(v_u_5, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
        ["Size"] = UDim2.fromScale(1, 1)
    }):Play()
    task.wait(1)
    v_u_10.Visible = true
    v_u_10.BackgroundTransparency = 0
    v_u_1:Create(v_u_10, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
        ["BackgroundTransparency"] = 1
    }):Play()
    v_u_5.Visible = false
    v_u_7.Visible = true
    v_u_7.Size = UDim2.fromScale(0.9, 0.9)
    v_u_2.ShakeOnce(v_u_7, 5, 0, 0, 3)
    v_u_1:Create(v_u_7, TweenInfo.new(1, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
        ["Size"] = UDim2.fromScale(0.5, 0.5)
    }):Play()
    task.wait(0.7)
    v_u_8.Visible = true
    v_u_8.Size = UDim2.fromScale(0, 0)
    v_u_8.Shadow.BackgroundColor3 = Color3.new(1, 1, 1)
    v_u_1:Create(v_u_8, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        ["Size"] = UDim2.fromScale(0.3, 0.119)
    }):Play()
    v_u_1:Create(v_u_8.Shadow, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
        ["BackgroundColor3"] = Color3.new(0, 0, 0)
    }):Play()
    task.wait(0.7)
    v_u_9.Visible = true
    v_u_9.Size = UDim2.fromScale(0, 0)
    v_u_9.Shadow.BackgroundColor3 = Color3.new(1, 1, 1)
    v_u_1:Create(v_u_9, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        ["Size"] = UDim2.fromScale(0.3, 0.119)
    }):Play()
    v_u_1:Create(v_u_9.Shadow, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
        ["BackgroundColor3"] = Color3.new(0, 0, 0)
    }):Play()
    task.wait(2)
    v_u_1:Create(v_u_9, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        ["Position"] = UDim2.fromScale(0.5, 0.9),
        ["TextTransparency"] = 1
    }):Play()
    v_u_1:Create(v_u_8, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        ["Position"] = UDim2.fromScale(0.5, 0.8),
        ["TextTransparency"] = 1
    }):Play()
    v_u_8.UIStroke:Destroy()
    v_u_9.UIStroke:Destroy()
    v_u_8.Shadow:Destroy()
    v_u_9.Shadow:Destroy()
    v_u_1:Create(v_u_7, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        ["ImageTransparency"] = 1,
        ["Position"] = UDim2.fromScale(0.5, 0.5)
    }):Play()
    v_u_1:Create(v_u_4, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {
        ["BackgroundTransparency"] = 1
    }):Play()
    task.wait(0.5)
    v_u_3:Destroy()
end