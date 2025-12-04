-- Decompiled game.ReplicatedFirst.Controllers.BundleController.Bundle

local v1 = game:GetService("ReplicatedFirst")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Packages.Knit)
local v_u_4 = require(v2.Packages.Fusion)
local v_u_5 = require(v2.Content.Bundle)
local v_u_6 = require(v2.Tools.Time)
local v_u_7 = require(v1.Components.Button)
return function(p_u_8)
    -- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_4, (copy) v_u_7, (copy) v_u_6
    local v_u_9 = v_u_3.GetController("InterfaceController")
    local v_u_10 = v_u_5:Get(p_u_8.BundleId)
    local v11 = v_u_4.Hydrate(p_u_8.Template)({
        ["Parent"] = p_u_8.Parent,
        ["Image"] = v_u_10.Image
    })
    local v_u_12 = v_u_4.Computed(function()
        -- upvalues: (copy) v_u_10, (copy) v_u_9
        return v_u_10.Timestamp.End - v_u_9.DynamicTimestamp:get()
    end)
    v_u_7(v11)({
        ["OnActivated"] = function()
            -- upvalues: (ref) v_u_5, (copy) v_u_10, (copy) p_u_8, (copy) v_u_9
            if v_u_5.isActive(v_u_10) then
                p_u_8.SelectedBundleGroup:set(v_u_10.Group or v_u_10.Id)
                v_u_9:SelectLobbyMenu("Bundles")
            end
        end,
        ["Visible"] = v_u_4.Computed(function()
            -- upvalues: (copy) v_u_12
            return v_u_12:get() >= 0
        end)
    })
    v_u_4.Hydrate(v11.Duration)({
        ["TextColor3"] = v_u_10.Color,
        ["Text"] = v_u_4.Computed(function()
            -- upvalues: (ref) v_u_6, (copy) v_u_12
            return v_u_6.toDHMS(v_u_12:get())
        end)
    })
    v11.DisplayName.Text = v_u_10.DisplayName or ""
end