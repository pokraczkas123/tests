-- Decompiled game.ReplicatedFirst.Components.Transition

local v_u_1 = game:GetService("Debris")
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("ReplicatedFirst")
return function(p_u_5)
    -- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_1, (copy) v_u_3
    local v_u_6 = v_u_4.Assets.Transition:Clone()
    local v7 = v_u_6.Blackout
    local v_u_8 = p_u_5.Duration or 0.75
    v_u_6.Enabled = true
    v_u_6.Parent = v_u_2.LocalPlayer:WaitForChild("PlayerGui")
    v7.Visible = true
    v_u_1:AddItem(v_u_6, v_u_8 + (p_u_5.HoldDuration or 0) + (p_u_5.CanYield and 10 or 0))
    v7.Position = UDim2.fromScale(1, 0)
    local v10, v11 = pcall(function()
        -- upvalues: (copy) v_u_6, (copy) p_u_5, (ref) v_u_3, (copy) v_u_8
        local v9 = v_u_6.Body
        v9.TextTransparency = 1
        v9.UIStroke.Transparency = 1
        v9.Text = p_u_5.Body or ""
        v_u_3:Create(v9, TweenInfo.new(v_u_8 / 2, Enum.EasingStyle.Quad), {
            ["TextTransparency"] = 0
        }):Play()
        v_u_3:Create(v9.UIStroke, TweenInfo.new(v_u_8 / 2, Enum.EasingStyle.Quad), {
            ["Transparency"] = 0
        }):Play()
    end)
    if not v10 then
        warn((("[%*]: %*"):format(script.Name, v11)))
    end
    v_u_3:Create(v7, TweenInfo.new(v_u_8 / 2, Enum.EasingStyle.Linear), {
        ["Position"] = UDim2.fromScale(0, 0)
    }):Play()
    task.wait(v_u_8 / 2)
    local v13, v14 = pcall(function()
        -- upvalues: (copy) v_u_6, (ref) v_u_3, (copy) v_u_8
        local v12 = v_u_6.Body
        v_u_3:Create(v12, TweenInfo.new(v_u_8 / 2, Enum.EasingStyle.Quad), {
            ["TextTransparency"] = 1
        }):Play()
        v_u_3:Create(v12.UIStroke, TweenInfo.new(v_u_8 / 2, Enum.EasingStyle.Quad), {
            ["Transparency"] = 1
        }):Play()
    end)
    if p_u_5.OnHidden then
        v_u_2.LocalPlayer:SetAttribute("User_IsTransitioning", true)
        if p_u_5.CanYield then
            p_u_5.OnHidden()
        else
            task.spawn(p_u_5.OnHidden)
        end
    end
    if p_u_5.HoldDuration then
        task.wait(p_u_5.HoldDuration)
    end
    v_u_3:Create(v7, TweenInfo.new(v_u_8 / 2, Enum.EasingStyle.Linear), {
        ["Position"] = UDim2.fromScale(-1, 0)
    }):Play()
    if not v13 then
        warn((("[%*]: %*"):format(script.Name, v14)))
    end
    task.wait(v_u_8 / 2)
    if p_u_5.OnEnd then
        v_u_2.LocalPlayer:SetAttribute("User_IsTransitioning", nil)
        task.spawn(p_u_5.OnEnd)
    end
end