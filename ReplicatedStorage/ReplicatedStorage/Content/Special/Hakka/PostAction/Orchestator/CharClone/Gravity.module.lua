-- Decompiled game.ReplicatedStorage.Content.Special.Hakka.PostAction.Orchestator.CharClone.Gravity

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Tools.CharGravity)
return {
    ["applyGravityControl"] = function(p3, p4, p5, p6)
        -- upvalues: (copy) v_u_2
        local v7 = v_u_2.new(p3, p6)
        v7:SetFactor(p5)
        p4:GiveTask(v7)
        return v7
    end
}