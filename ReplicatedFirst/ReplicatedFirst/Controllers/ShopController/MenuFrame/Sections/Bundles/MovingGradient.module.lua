-- Decompiled game.ReplicatedFirst.Controllers.ShopController.MenuFrame.Sections.Bundles.MovingGradient

local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("ReplicatedFirst")
local v_u_3 = game:GetService("RunService")
local v_u_4 = require(v1.Packages.Fusion)
local v_u_5 = require(v2.Components.InterpolateSequenceOffset)
return {
    ["computed"] = function(p_u_6)
        -- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_3
        local v7 = p_u_6.Gradient
        local v_u_8 = v7.Color
        local v_u_9 = v7.Speed or 0
        if v_u_9 <= 0 then
            return v_u_4.Value(v_u_5.Color(v_u_8, 0)), function() end
        end
        local v_u_10 = v_u_4.Value(0)
        local v_u_11 = v_u_3.Heartbeat:Connect(function()
            -- upvalues: (copy) p_u_6, (copy) v_u_10
            if p_u_6.CanCalculate() then
                v_u_10:set(tick())
            end
        end)
        return v_u_4.Computed(function()
            -- upvalues: (copy) v_u_10, (copy) v_u_9, (ref) v_u_5, (copy) v_u_8
            local v12 = v_u_10:get() * v_u_9 % 1
            return v_u_5.Color(v_u_8, v12)
        end), function()
            -- upvalues: (copy) v_u_11
            v_u_11:Disconnect()
        end
    end
}