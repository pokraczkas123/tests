-- Decompiled game.ReplicatedStorage.Common.SpecialLib

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Tools.Logger).new(script.Name)
local v_u_3 = require(v1.Content.Special)
require(v1.Common.Context)
local v_u_16 = {
    ["Cache"] = {},
    ["get"] = function(p4)
        -- upvalues: (copy) v_u_16, (copy) v_u_2
        local v5 = p4.Type
        if not v_u_16.Cache[v5] then
            local v6 = script:FindFirstChild(v5)
            if not v6 then
                v_u_2:Warn((("SpecialLib does not have a plugin for type: %*"):format(v5)))
                return {}
            end
            v_u_16.Cache[v5] = require(v6)
        end
        return v_u_16.Cache[v5]
    end,
    ["isSpecialAction"] = function(p7, p8)
        -- upvalues: (copy) v_u_3
        local v9 = p7 and (p7.Type == v_u_3.Type.Action or p7.Type == v_u_3.Type.ActionActivatable) and p7.Move ~= "All" and p7.Move ~= p8.Move and (p7.Move ~= "Sets" or p8.Move ~= "JumpSet" and p8.Move ~= "Set") and p8.ServePower
        if v9 then
            v9 = p7.Move == ("Serve%*"):format(p8.Move)
        end
        return v9
    end,
    ["canRun"] = function(p10, p11)
        -- upvalues: (copy) v_u_16
        if not v_u_16.isSpecialAction(p10, p11) then
            return false
        end
        local v12 = v_u_16.get(p10)
        return not v12.CanRun and true or v12.CanRun(p10, p11)
    end,
    ["updateState"] = function(p13, p14)
        -- upvalues: (copy) v_u_16
        if v_u_16.isSpecialAction(p13, p14) then
            local v15 = v_u_16.get(p13)
            if v15.UpdateState and p13.UpdateState then
                return v15.UpdateState(p13, p14)
            else
                return false
            end
        else
            return false
        end
    end
}
return v_u_16