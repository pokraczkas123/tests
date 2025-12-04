-- Decompiled game.ReplicatedFirst.Controllers.AbilityController.Abilities

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Packages.Fusion)
local v_u_3 = require(v1.Content.Ability)
return function(p_u_4)
    -- upvalues: (copy) v_u_2, (copy) v_u_3
    local v_u_7 = v_u_2.Computed(function()
        -- upvalues: (copy) p_u_4, (ref) v_u_3
        local v5 = p_u_4.Abilities:get()[p_u_4.CurrentAbilitySlot:get()]
        if p_u_4.IsSpinning:get() == true then
            v5 = p_u_4.SpinArray:get()[p_u_4.SpinIndex:get()]
        end
        if v5 then
            local v6 = v_u_3:Get(v5)
            if v6 then
                return v6
            end
        end
    end)
    v_u_2.Hydrate(p_u_4.Component.DisplayName)({
        ["Text"] = v_u_2.Computed(function()
            -- upvalues: (copy) v_u_7
            local v8 = v_u_7:get()
            return v8 and v8.DisplayName or "No Style"
        end),
        ["TextColor3"] = v_u_2.Computed(function()
            -- upvalues: (copy) v_u_7, (ref) v_u_3
            local v9 = v_u_7:get()
            return v9 and v_u_3.Rarity.Data[v9.Rarity].Color or Color3.fromRGB(255, 255, 255)
        end)
    })
    v_u_2.Hydrate(p_u_4.Component.Description)({
        ["Text"] = v_u_2.Computed(function()
            -- upvalues: (copy) v_u_7
            local v10 = v_u_7:get()
            return v10 and v10.Description or "No Description"
        end)
    })
end