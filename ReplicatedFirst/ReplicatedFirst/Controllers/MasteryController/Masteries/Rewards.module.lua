-- Decompiled game.ReplicatedFirst.Controllers.MasteryController.Masteries.Rewards

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Packages.Fusion)
require(v1.Content.Mastery)
local v_u_3 = require(script.Level)
return function(p_u_4)
    -- upvalues: (copy) v_u_2, (copy) v_u_3
    local v_u_5 = p_u_4.Component.Template
    local v6 = v_u_2.Computed(function()
        -- upvalues: (copy) p_u_4
        return p_u_4.MasteryEntity:get().Levels
    end)
    v_u_2.Hydrate(p_u_4.Component)({
        [v_u_2.Children] = v_u_2.ForPairs(v6, function(p7, p8)
            -- upvalues: (copy) v_u_5, (ref) v_u_3, (copy) p_u_4
            return p7, v_u_3({
                ["Component"] = v_u_5:Clone(),
                ["MasteryLevel"] = p8,
                ["Index"] = p7,
                ["Level"] = p_u_4.CurrentLevel,
                ["CompletedQuests"] = p_u_4.CompletedQuests,
                ["Parent"] = p_u_4.Component
            })
        end, v_u_2.cleanup)
    })
end