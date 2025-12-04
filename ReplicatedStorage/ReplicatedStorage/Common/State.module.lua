-- Decompiled game.ReplicatedStorage.Common.State

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Id)
local v_u_3 = require(v1.Tools.Logger).new(script.Name)
local v_u_24 = {
    ["Id"] = v2,
    ["getKey"] = function(p4, p5)
        -- upvalues: (copy) v_u_3
        local v6 = ("%*_%*"):format(p4, p5)
        if #v6 > 100 then
            local v7 = #v6 - 100
            v6 = v6:sub(1, 100)
            v_u_3:Warn((("State key \"%*\" exceeded the limit of %* characters by %* characters. It has been truncated."):format(v6, 100, v7)))
        end
        return v6
    end,
    ["get"] = function(p8, p9, p10, p11)
        -- upvalues: (copy) v_u_24
        local v12 = p8:GetAttribute(v_u_24.getKey(p9, p10))
        if v12 == nil then
            return p11
        else
            return v12
        end
    end,
    ["set"] = function(p13, p14, p15, p16)
        -- upvalues: (copy) v_u_24
        p13:SetAttribute(v_u_24.getKey(p14, p15), p16)
    end,
    ["clear"] = function(p17, p18)
        for v19, _ in pairs(p17:GetAttributes()) do
            if v19:sub(1, #p18 + 1) == ("%*_"):format(p18) then
                p17:SetAttribute(v19, nil)
            end
        end
    end,
    ["onChange"] = function(p_u_20, p_u_21, p_u_22, p_u_23)
        -- upvalues: (copy) v_u_24
        return p_u_20:GetAttributeChangedSignal(v_u_24.getKey(p_u_21, p_u_22)):Connect(function()
            -- upvalues: (ref) v_u_24, (copy) p_u_20, (copy) p_u_21, (copy) p_u_22, (copy) p_u_23
            p_u_23((v_u_24.get(p_u_20, p_u_21, p_u_22)))
        end)
    end
}
return v_u_24