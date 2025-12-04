-- Decompiled game.ReplicatedFirst.Controllers.GameController.AbilityGlow

local v_u_1 = NumberRange.new(0.3, 0.6)
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Packages.Fusion)
local v_u_4 = require(v2.Content.Ability)
return function(p_u_5)
    -- upvalues: (copy) v_u_3, (copy) v_u_1, (copy) v_u_4
    local v6 = v_u_3.Value(v_u_1.Min)
    local v7 = v_u_3.Spring(v6, 5, 0)
    v6:set(v_u_1.Max)
    v_u_3.Hydrate(p_u_5.Component)({
        ["Visible"] = p_u_5.Visible,
        ["ImageTransparency"] = v7,
        ["ImageColor3"] = v_u_3.Computed(function()
            -- upvalues: (copy) p_u_5, (ref) v_u_4
            local v8 = p_u_5.Ability:get()
            if v8 then
                return v_u_4.Rarity.Data[v8.Rarity].Color
            else
                return Color3.new()
            end
        end)
    })
end