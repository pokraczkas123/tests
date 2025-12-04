-- Decompiled game.ReplicatedFirst.Controllers.SeasonController.SeasonPass.Experience

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Packages.Fusion)
return function(p_u_3)
    -- upvalues: (copy) v_u_2
    local v_u_4 = p_u_3.Season.ExperiencePerTier
    local v_u_6 = v_u_2.Computed(function()
        -- upvalues: (copy) p_u_3
        local v5 = p_u_3.Seasonal:get() or {
            ["Experience"] = 0,
            ["Rebirths"] = 0
        }
        return p_u_3.Season:GetExperience(v5.Experience, v5.Rebirths) or 0
    end)
    v_u_2.Hydrate(p_u_3.Component.Amount)({
        ["Text"] = v_u_2.Computed(function()
            -- upvalues: (copy) v_u_6, (copy) v_u_4
            return ("%*/%*"):format(v_u_6:get() % v_u_4, v_u_4)
        end)
    })
    v_u_2.Hydrate(p_u_3.Component.Level)({
        ["Text"] = v_u_2.Computed(function()
            -- upvalues: (copy) v_u_6, (copy) v_u_4
            local v7 = v_u_6:get() / v_u_4
            return ("LVL %*"):format((math.floor(v7)))
        end)
    })
    v_u_2.Hydrate(p_u_3.Component.Bar)({
        ["Visible"] = v_u_2.Computed(function()
            -- upvalues: (copy) v_u_6, (copy) v_u_4
            return (v_u_6:get() or 0) % v_u_4 > 0
        end),
        ["Size"] = v_u_2.Computed(function()
            -- upvalues: (copy) v_u_6, (copy) v_u_4
            return UDim2.fromScale((v_u_6:get() or 0) % v_u_4 / v_u_4, 1)
        end)
    })
end