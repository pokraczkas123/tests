-- Decompiled game.ReplicatedFirst.Controllers.GameController.Notification

local v_u_1 = game:GetService("Debris")
local v2 = game:GetService("Players")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = game:GetService("TweenService")
local v_u_5 = require(v3.Configuration.Game)
local v_u_6 = v2.LocalPlayer
return function(p7)
    -- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_4, (copy) v_u_1
    local v_u_8 = p7.Component.Template:Clone()
    local v9 = os.clock() * 100
    v_u_8.Name = ("Notification @ %*"):format(math.floor(v9) / 100)
    v_u_8.Parent = p7.Component
    v_u_8.Visible = true
    v_u_8.Text = p7.Body
    v_u_8.TextTransparency = 1
    v_u_8.UIStroke.Transparency = 1
    local v10
    if p7.TeamName and v_u_6.Team and v_u_6.Team.Name == p7.TeamName then
        v10 = v_u_5.Notification.Color.Green
    elseif p7.Color then
        v10 = p7.Color
    else
        v10 = v_u_5.Notification.Color.Red
    end
    v_u_8.TextColor3 = v10
    v_u_4:Create(v_u_8, TweenInfo.new(0.5), {
        ["TextTransparency"] = 0
    }):Play()
    v_u_4:Create(v_u_8.UIStroke, TweenInfo.new(0.5), {
        ["Transparency"] = 0
    }):Play()
    task.delay(p7.Duration or 3, function()
        -- upvalues: (ref) v_u_4, (copy) v_u_8, (ref) v_u_1
        v_u_4:Create(v_u_8, TweenInfo.new(2), {
            ["TextTransparency"] = 1
        }):Play()
        v_u_4:Create(v_u_8.UIStroke, TweenInfo.new(2), {
            ["Transparency"] = 1
        }):Play()
        v_u_1:AddItem(v_u_8, 2)
    end)
end