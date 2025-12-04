-- Decompiled game.ReplicatedFirst.Controllers.MasteryController.Masteries.DisplayName

local v1 = game:GetService("ReplicatedFirst")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = nil
local v_u_4 = require(v2.Packages.Knit)
local v_u_5 = require(v2.Packages.Fusion)
local v_u_6 = require(v2.Content.Style)
local v_u_7 = require(v1.Components.UltraDisplay)
return function(p_u_8)
    -- upvalues: (ref) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_7, (copy) v_u_6
    v_u_3 = v_u_3 or v_u_4.GetController("StyleController")
    local _, v_u_9 = v_u_3:BindToStylesAsync()
    local v10 = v_u_5.Observer(v_u_9)
    v10:onChange(function()
        -- upvalues: (ref) v_u_7, (copy) p_u_8, (copy) v_u_9, (ref) v_u_6
        v_u_7.clear(p_u_8.Component)
        local v11 = v_u_9:get()
        if v11.Rarity == v_u_6.Rarity.Type.Ultra then
            v_u_7.new(p_u_8.Component, v11.DisplayNameOverride or v11.DisplayName or "Unknown")
        end
    end)
    v10:update()
    v_u_5.Hydrate(p_u_8.Component)({
        ["Text"] = v_u_5.Computed(function()
            -- upvalues: (copy) v_u_9
            local v12 = v_u_9:get() or {}
            return v12.DisplayNameOverride or v12.DisplayName or "Unknown"
        end),
        ["TextColor3"] = v_u_5.Computed(function()
            -- upvalues: (copy) v_u_9, (ref) v_u_6
            local v13 = v_u_9:get()
            if v13 then
                if (v13.Metadata and (v13.Metadata.Nametag or {}) or {}).Gradient then
                    return Color3.new(1, 1, 1)
                else
                    return v13 and v_u_6.Rarity.Data[v13.Rarity].Color or Color3.new(1, 1, 1)
                end
            else
                return Color3.new(1, 1, 1)
            end
        end)
    })
    local v_u_14 = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(184, 184, 184)) })
    v_u_5.Hydrate(p_u_8.Component.UIGradient)({
        ["Color"] = v_u_5.Computed(function()
            -- upvalues: (copy) v_u_9, (copy) v_u_14
            local v15 = v_u_9:get()
            if v15 then
                local v16 = v15.Metadata and v15.Metadata.Nametag or {}
                if v16.Gradient and v16.Gradient.Color then
                    return v16.Gradient.Color
                else
                    return v_u_14
                end
            else
                return v_u_14
            end
        end),
        ["Offset"] = v_u_5.Computed(function()
            -- upvalues: (copy) v_u_9
            local v17 = v_u_9:get()
            if v17 then
                local v18 = v17.Metadata and v17.Metadata.Nametag or {}
                if v18.Gradient and v18.Gradient.Offset then
                    return v18.Gradient.Offset
                else
                    return Vector2.new(0, 0)
                end
            else
                return Vector2.new(0, 0)
            end
        end),
        ["Rotation"] = v_u_5.Computed(function()
            -- upvalues: (copy) v_u_9
            local v19 = v_u_9:get()
            if not v19 then
                return 90
            end
            local v20 = v19.Metadata and v19.Metadata.Nametag or {}
            return not (v20.Gradient and v20.Gradient.Rotation) and 90 or v20.Gradient.Rotation
        end)
    })
end