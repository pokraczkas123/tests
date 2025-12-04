-- Decompiled game.ReplicatedStorage.Content.Special.Hakka.PostAction.Orchestator.CharClone.Attributes

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Tools.CharBot.MockPlayer)
return {
    ["bindAttributesToSourcePlayer"] = function(p_u_3, p_u_4)
        -- upvalues: (copy) v_u_2
        function p_u_3.GetAttribute(_, p5)
            -- upvalues: (copy) p_u_4
            return p5 == "IsMock" and true or p_u_4:GetAttribute(p5)
        end
        function p_u_3.SetAttribute(_, p6, p7)
            -- upvalues: (ref) v_u_2, (copy) p_u_3, (copy) p_u_4
            v_u_2.SetAttribute(p_u_3, p6, p7)
            p_u_4:SetAttribute(p6, p7)
        end
    end
}