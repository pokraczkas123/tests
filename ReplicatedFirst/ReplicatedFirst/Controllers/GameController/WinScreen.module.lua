-- Decompiled game.ReplicatedFirst.Controllers.GameController.WinScreen

local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("ReplicatedFirst")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = require(v3.Packages.Fusion)
return function(p_u_5)
    -- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_4
    local v_u_6 = v_u_2.Assets.WinScreen:Clone()
    v_u_6.Parent = v_u_1.LocalPlayer.PlayerGui
    v_u_6.Enabled = false
    v_u_4.Observer(p_u_5.Data):onChange(function()
        -- upvalues: (copy) p_u_5, (copy) v_u_6
        local v7 = p_u_5.Data:get()
        v_u_6.Enabled = v7 ~= nil
        p_u_5.App.Enabled = v7 == nil
        if v7 then
            v_u_6.Mvp.Text = ("MVP: %s"):format(v7.MVP)
            v_u_6.MvpShadow.Text = ("MVP: %s"):format(v7.MVP)
            v_u_6.Winners.Text = ("%s Has Won %s-%s!"):format(v7.Winner, v7.Score[1], v7.Score[2])
            v_u_6.WinnersShadow.Text = ("%s Has Won %s-%s!"):format(v7.Winner, v7.Score[1], v7.Score[2])
        end
    end)
end