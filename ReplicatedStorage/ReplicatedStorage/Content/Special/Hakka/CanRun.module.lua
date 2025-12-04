-- Decompiled game.ReplicatedStorage.Content.Special.Hakka.CanRun

local v1 = game:GetService("ReplicatedStorage")
require(script.Parent.Parent)
local v_u_2 = require(v1.Common.Context)
local v_u_3 = require(v1.Common.Move)
return function(p4, p5)
    -- upvalues: (copy) v_u_2, (copy) v_u_3
    if p5.State.Stage == v_u_2.Stage.PreAction then
        local v6 = p5.Player
        if typeof(v6) == "table" then
            return true
        end
    end
    if p5.State.Stage == v_u_2.Stage.PreAction then
        return false
    elseif v_u_3.matches(p5.Move, p4.ActionMove) then
        if p5.TiltDirection.Magnitude <= 0.1 then
            return false
        else
            return p5.State.Stage == v_u_2.Stage.PostAction or p5.IsSpecialActive == true
        end
    else
        return false
    end
end