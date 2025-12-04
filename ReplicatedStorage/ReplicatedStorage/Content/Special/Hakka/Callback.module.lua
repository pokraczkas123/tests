-- Decompiled game.ReplicatedStorage.Content.Special.Hakka.Callback

local v_u_1 = game:GetService("RunService"):IsClient()
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = nil
require(script.Parent.Parent)
local v_u_4 = require(v2.Packages.Knit)
local v_u_5 = require(v2.Common.State)
return function(p6, p7)
    -- upvalues: (copy) v_u_5, (copy) v_u_1, (ref) v_u_3, (copy) v_u_4
    local v8 = v_u_5.get(p7, v_u_5.Id.Special, "ActivationState", false)
    if v_u_5.get(p7, v_u_5.Id.Special, "Charge", 0) < p6.Metadata.Requirement and not v8 then
        return false
    end
    if not v_u_1 then
        v_u_5.set(p7, v_u_5.Id.Special, "ActivationState", not v8)
        return true
    end
    v_u_3 = v_u_3 or v_u_4.GetService("StyleService")
    v_u_3:RequestSpecialCallback()
    return true
end