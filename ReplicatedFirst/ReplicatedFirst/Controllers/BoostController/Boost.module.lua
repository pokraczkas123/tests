-- Decompiled game.ReplicatedFirst.Controllers.BoostController.Boost

local v1 = game:GetService("ReplicatedFirst")
local v2 = game:GetService("ReplicatedStorage")
local v3 = require(v2.Packages.Fusion)
local v_u_4 = require(v2.Packages.Knit)
local v_u_5 = require(v2.Content.Boost)
local v_u_6 = require(v2.Tools.Time)
local v_u_7 = require(v1.Components.DisplayItem)
local v_u_8 = v3.Computed
local v_u_9 = v3.Hydrate
return function(p_u_10)
    -- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_9, (copy) v_u_8, (copy) v_u_6, (copy) v_u_7
    local v_u_11 = v_u_4.GetController("InterfaceController")
    local v_u_12 = v_u_5:Get(p_u_10.BoostId)
    v_u_9(p_u_10.Component.TextLabel)({
        ["Text"] = v_u_8(function()
            -- upvalues: (copy) p_u_10, (copy) v_u_11, (ref) v_u_6
            local v13 = p_u_10.EndTimestamp - v_u_11.DynamicTimestamp:get()
            if v13 >= 86400 then
                return v_u_6.format(v13, "dd:hh:mm:ss")
            else
                return v_u_6.format(v13, "hh:mm:ss")
            end
        end)
    })
    task.spawn(function()
        -- upvalues: (ref) v_u_7, (copy) p_u_10, (copy) v_u_12
        v_u_7(p_u_10.Component.ImageLabel, v_u_12.ItemId)
    end)
    return v_u_9(p_u_10.Component)({
        ["Name"] = string.format("%s_Boost", p_u_10.BoostId),
        ["Visible"] = v_u_8(function()
            -- upvalues: (copy) p_u_10, (copy) v_u_11
            return p_u_10.EndTimestamp > v_u_11.DynamicTimestamp:get()
        end)
    })
end