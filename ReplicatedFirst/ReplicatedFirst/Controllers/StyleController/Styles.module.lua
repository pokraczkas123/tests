-- Decompiled game.ReplicatedFirst.Controllers.StyleController.Styles

local v1 = game:GetService("ReplicatedFirst")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("RunService")
local v_u_4 = require(script.ColorSequencer)
local v_u_5 = require(v2.Packages.Knit)
local v_u_6 = require(v2.Content.Style)
local v_u_7 = require(v2.Packages.Fusion)
local v_u_8 = require(v1.Components.Button)
local v_u_9 = require(v1.Components.UltraDisplay)
return function(p_u_10)
    -- upvalues: (copy) v_u_5, (copy) v_u_7, (copy) v_u_6, (copy) v_u_9, (copy) v_u_8, (copy) v_u_3, (copy) v_u_4
    local v_u_11 = v_u_5.GetService("StyleService")
    local v_u_12 = v_u_5.GetController("GameController")
    local v_u_13 = v_u_5.GetController("AnimationController")
    local v_u_14 = {}
    local v_u_17 = v_u_7.Computed(function()
        -- upvalues: (copy) p_u_10, (ref) v_u_14, (ref) v_u_6
        local v15 = p_u_10.Styles:get()[p_u_10.CurrentStyleSlot:get()]
        if p_u_10.IsSpinning:get() == true then
            v15 = p_u_10.SpinArray:get()[p_u_10.SpinIndex:get()]
        end
        if v15 == "" or v15 == nil then
            return v_u_14 or {}
        else
            local v16 = v_u_6:Get(v15)
            if v16 then
                v_u_14 = v16
                return v16
            else
                warn("Failed to get style. Style \'%s\' does not exist.", v15)
                return v_u_14 or {}
            end
        end
    end)
    local v18 = v_u_7.Observer(v_u_17)
    v18:onChange(function()
        -- upvalues: (copy) v_u_17, (ref) v_u_6, (ref) v_u_9, (copy) p_u_10
        local v19 = v_u_17:get()
        if v19 and v19.Rarity and v19.Rarity == v_u_6.Rarity.Type.Ultra then
            v_u_9.new(p_u_10.Component.DisplayName, v19.DisplayName)
        else
            v_u_9.clear(p_u_10.Component.DisplayName)
        end
    end)
    v18:update()
    v_u_7.Hydrate(p_u_10.Component.DisplayName)({
        ["Text"] = v_u_7.Computed(function()
            -- upvalues: (copy) v_u_17
            local v20 = v_u_17:get()
            return v20 and v20.DisplayName or "No Style"
        end),
        ["TextColor3"] = v_u_7.Computed(function()
            -- upvalues: (copy) v_u_17, (ref) v_u_6
            local v21 = v_u_17:get()
            if (v21.Metadata and (v21.Metadata.Nametag or {}) or {}).Gradient then
                return Color3.new(1, 1, 1)
            else
                return v21 and v_u_6.Rarity.Data[v21.Rarity].Color or Color3.new(1, 1, 1)
            end
        end)
    })
    v_u_7.Hydrate(p_u_10.Component.PriorIcon)({
        ["Visible"] = false
    })
    v_u_7.Hydrate(p_u_10.Component.DisplayName.UIGradient)({
        ["Color"] = v_u_7.Computed(function()
            -- upvalues: (copy) v_u_17
            local v22 = v_u_17:get()
            local v23 = v22.Metadata and v22.Metadata.Nametag or {}
            if v23.Gradient and v23.Gradient.Color then
                return v23.Gradient.Color
            else
                return ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                    ColorSequenceKeypoint.new(0.55, Color3.fromRGB(254, 254, 254)),
                    ColorSequenceKeypoint.new(0.583, Color3.fromRGB(217, 217, 217)),
                    ColorSequenceKeypoint.new(0.787, Color3.fromRGB(253, 253, 253)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(184, 184, 184))
                })
            end
        end),
        ["Offset"] = v_u_7.Computed(function()
            -- upvalues: (copy) v_u_17
            local v24 = v_u_17:get()
            local v25 = v24.Metadata and v24.Metadata.Nametag or {}
            if v25.Gradient and v25.Gradient.Offset then
                return v25.Gradient.Offset
            else
                return Vector2.new(0, 0)
            end
        end),
        ["Rotation"] = v_u_7.Computed(function()
            -- upvalues: (copy) v_u_17
            local v26 = v_u_17:get()
            local v27 = v26.Metadata and v26.Metadata.Nametag or {}
            return not (v27.Gradient and v27.Gradient.Rotation) and 90 or v27.Gradient.Rotation
        end)
    })
    v_u_8(p_u_10.Component.TwinToggle)({
        ["Visible"] = v_u_7.Computed(function()
            -- upvalues: (copy) p_u_10, (copy) v_u_17
            if p_u_10.IsSpinning:get() then
                return false
            end
            local v28 = v_u_17:get()
            return (v28.Id == "Twin1" or v28.Id == "Twin2" or v28.Id == "Twin1_2") and true or v28.Id == "Twin2_2"
        end),
        ["OnActivated"] = function()
            -- upvalues: (copy) v_u_11, (copy) v_u_13, (copy) v_u_12
            local v29, v30 = v_u_11:ToggleTwin():expect()
            if v29 then
                v_u_13:StopStyleAnimations("Pose")
                v_u_13:StopStyleAnimations("PoseStart")
                v_u_13:StopStyleAnimations("Idle")
                v_u_13:PlayAnimation("Pose")
                v_u_13:PlayAnimation("Idle")
            end
            if v30 then
                v_u_12:Notify({
                    ["Body"] = v30
                })
            end
        end
    })
    v_u_7.Hydrate(p_u_10.Component.TwinToggle.UIGradient)({
        ["Rotation"] = v_u_7.Computed(function()
            -- upvalues: (copy) v_u_17
            local v31 = v_u_17:get()
            return (v31.Id == "Twin1" or v31.Id == "Twin1_1") and -106 or 74
        end)
    })
    v_u_7.Hydrate(p_u_10.Component.TwinToggle.DisplayName)({
        ["Text"] = v_u_7.Computed(function()
            -- upvalues: (copy) v_u_17
            local v32 = v_u_17:get()
            return v32 and v32.DisplayName or "No Style"
        end)
    })
    local v_u_33 = v_u_7.Value(tick())
    v_u_3.Heartbeat:Connect(function()
        -- upvalues: (copy) v_u_33
        v_u_33:set(tick())
    end)
    for v_u_34, v_u_35 in pairs(v_u_6.MaximumStats) do
        local v36 = v_u_6.MinimumStats[v_u_34]
        local v37 = 1 - v_u_6.MaximumStats[v_u_34] - 1
        local v38 = math.min(v36, v37)
        local v_u_39 = v_u_6.SecretMultipliers[v_u_34] ~= nil
        local v_u_40 = v38 == v_u_35 and 0 or v38
        local v_u_42 = v_u_7.Computed(function()
            -- upvalues: (copy) v_u_17
            local v41 = v_u_17:get()
            return not (v41 and v41.Metadata) or v41.Metadata.Statistics or {}
        end)
        local v_u_45 = v_u_7.Computed(function()
            -- upvalues: (copy) v_u_42, (copy) v_u_34, (copy) v_u_17, (copy) v_u_35, (ref) v_u_40
            local v43 = v_u_42:get()[v_u_34] or {}
            if v43.Value then
                return v43.Value
            end
            local v44 = v_u_17:get()
            return ((v44 ~= nil and v44.Multipliers ~= nil and v44.Multipliers[v_u_34] or v_u_35 / 2) - v_u_40) / (v_u_35 - v_u_40)
        end)
        local v50 = v_u_7.Computed(function()
            -- upvalues: (copy) v_u_42, (copy) v_u_34, (copy) v_u_39, (copy) v_u_33, (ref) v_u_4, (copy) v_u_45
            local v46 = v_u_42:get()[v_u_34] or {}
            if v46.IsRainbow or v_u_39 then
                return Color3.fromHSV(v_u_33:get() % 3 / 3, 1, 1)
            end
            local v47 = v46.Color
            if not v47 then
                return v_u_4.strength(v_u_45:get())
            end
            if not v47.Period then
                return v47.Value
            end
            local v48 = v47.Value
            local v49
            if typeof(v48) == "ColorSequence" then
                v49 = v47.Value
            else
                v49 = ColorSequence.new(v_u_4.strength(v_u_45:get()), v47.Value)
            end
            return v_u_4.breathe(v49, v47.Period, v_u_33:get())
        end)
        local v52 = v_u_7.Hydrate(p_u_10.Component.Statistics.Template:Clone())({
            ["Name"] = v_u_34,
            ["Visible"] = v_u_7.Computed(function()
                -- upvalues: (copy) v_u_17, (copy) v_u_39, (copy) v_u_34
                local v51 = v_u_17:get()
                return not (v_u_39 and v51) and true or v51.Multipliers[v_u_34] > 1
            end),
            ["Parent"] = p_u_10.Component.Statistics
        })
        v_u_7.Hydrate(v52.StatName)({
            ["Text"] = v_u_7.Computed(function()
                -- upvalues: (copy) v_u_42, (copy) v_u_34
                local v53 = v_u_42:get()[v_u_34] or {}
                if v53.Text then
                    return v53.Text
                else
                    return v_u_34 == "DiveSpeed" and "Dive" or v_u_34:gsub("Power", "")
                end
            end)
        })
        v_u_7.Hydrate(v52.StatBar.UIStroke)({
            ["Color"] = v50
        })
        v_u_7.Hydrate(v52.StatBar.Bar)({
            ["BackgroundColor3"] = v50,
            ["Size"] = v_u_7.Computed(function()
                -- upvalues: (copy) v_u_42, (copy) v_u_34, (copy) v_u_33, (copy) v_u_45
                local v54 = (v_u_42:get()[v_u_34] or {}).Variable
                if not v54 then
                    return UDim2.fromScale(v_u_45:get(), 1)
                end
                local v55 = (v_u_33:get() / v54.Period or 2) * 3.141592653589793 * 2
                local v56 = (math.sin(v55) + 1) / 2
                local v57 = v_u_45:get()
                return UDim2.fromScale(v57 * (v54.Overshoot or 1) + (1 - v57) * v56, 1)
            end)
        })
        v_u_7.Hydrate(v52.StatBar.Bar.Arrows)({
            ["Visible"] = v_u_7.Computed(function()
                -- upvalues: (copy) v_u_42, (copy) v_u_34
                local v58 = (v_u_42:get()[v_u_34] or {}).Variable
                local v59
                if v58 == nil or v58.Overshoot == nil then
                    v59 = false
                else
                    v59 = v58.HideArrows == nil
                end
                return v59
            end)
        })
    end
end