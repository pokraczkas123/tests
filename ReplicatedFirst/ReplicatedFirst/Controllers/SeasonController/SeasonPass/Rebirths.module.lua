-- Decompiled game.ReplicatedFirst.Controllers.SeasonController.SeasonPass.Rebirths

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Packages.Fusion)
return function(p_u_3)
    -- upvalues: (copy) v_u_2
    v_u_2.Hydrate(p_u_3.Component)({
        ["Visible"] = p_u_3.Season.Rebirth
    })
    if p_u_3.Season.Rebirth then
        local v_u_4 = p_u_3.Season.Rebirth.Requirement or 1
        v_u_2.Hydrate(p_u_3.Component.Amount)({
            ["Text"] = v_u_2.Computed(function()
                -- upvalues: (copy) p_u_3, (copy) v_u_4
                return ("%* / %*"):format(p_u_3.Seasonal:get().Rebirths or "NAN", v_u_4)
            end)
        })
        v_u_2.Hydrate(p_u_3.Component.Bar)({
            ["Visible"] = v_u_2.Computed(function()
                -- upvalues: (copy) p_u_3
                return (p_u_3.Seasonal:get().Rebirths or 0) > 0
            end),
            ["Size"] = v_u_2.Computed(function()
                -- upvalues: (copy) p_u_3, (copy) v_u_4
                return UDim2.fromScale((p_u_3.Seasonal:get().Rebirths or 0) / v_u_4, 1)
            end)
        })
    end
end