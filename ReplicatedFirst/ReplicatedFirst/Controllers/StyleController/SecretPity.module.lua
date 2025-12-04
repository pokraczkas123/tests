-- Decompiled game.ReplicatedFirst.Controllers.StyleController.SecretPity

local v_u_1 = Color3.fromRGB(0, 255, 17)
local v_u_2 = Color3.fromRGB(255, 0, 76)
local v3 = game:GetService("ReplicatedFirst")
local v4 = game:GetService("ReplicatedStorage")
local v_u_5 = require(v4.Packages.Knit)
local v_u_6 = require(v4.Packages.Fusion)
local v_u_7 = require(v3.Components.Button)
local v_u_8 = require(v4.Content.Style)
local v_u_9 = require(v4.Tools.Time)
return function(p_u_10)
    -- upvalues: (copy) v_u_5, (copy) v_u_8, (copy) v_u_6, (copy) v_u_7, (copy) v_u_9, (copy) v_u_1, (copy) v_u_2
    local v_u_11 = v_u_5.GetService("StyleService")
    local v_u_12 = v_u_5.GetController("InterfaceController")
    local v13 = p_u_10.Component
    local v14 = v_u_8:GetActive(v_u_8.Rarity.Type.Secret)
    v13.BGFrame.Body.List.SOON.Visible = #v14 < 3
    for _, v_u_15 in pairs(v14) do
        local v16 = v13.BGFrame.Body.List.Template:Clone()
        local v17
        if v_u_15.DisplayNameOverride then
            v17 = v_u_15.DisplayNameOverride
        else
            v17 = v_u_15.DisplayName
        end
        v16.Parent = v13.BGFrame.Body.List
        v16.Visible = true
        v16.DisplayName.Text = v17
        v_u_6.Hydrate(v16.SelectedText)({
            ["Visible"] = v_u_6.Computed(function()
                -- upvalues: (copy) v_u_12, (copy) v_u_15
                local v18 = (v_u_12.BoostedChances:get() or {}).SecretStyle
                if v18 then
                    return v_u_15.Id == v18
                else
                    return false
                end
            end)
        })
        v_u_7(v16)({
            ["OnActivated"] = function()
                -- upvalues: (copy) v_u_15, (copy) p_u_10, (copy) v_u_11
                if v_u_15.Id ~= p_u_10.PreferredSecret:get() then
                    v_u_11:SelectChance(v_u_15.Id, true)
                end
            end
        })
        if v_u_15.Metadata and v_u_15.Metadata.Timestamp then
            v16.TimerFrame.Visible = true
            v_u_6.Hydrate(v16.TimerFrame.Timer)({
                ["Text"] = v_u_6.Computed(function()
                    -- upvalues: (copy) v_u_15, (copy) v_u_12, (ref) v_u_9
                    local v19 = v_u_15.Metadata.Timestamp - v_u_12.DynamicTimestamp:get()
                    return tonumber(v19) < 0 and "" or v_u_9.toDHMS(v19)
                end),
                ["Visible"] = true
            })
        end
    end
    local v26 = v_u_6.Computed(function()
        -- upvalues: (copy) v_u_12, (copy) p_u_10
        local v20 = v_u_12.RollData:get().RequiredSecretPity + 1
        local v21 = p_u_10.SecretPity:get()
        local v22 = p_u_10.SecretPitySpun:get()
        local v23 = 0
        if v22 < 1 then
            local v24 = v21 / v20 * 0.5
            v23 = math.min(v24, 0.5)
        elseif v22 == 1 then
            local v25 = 0.5 + v21 / v20 * 0.5
            v23 = math.max(v25, 0.5)
        end
        return UDim2.fromScale(math.clamp(v23, 0, 1), 0.8)
    end)
    v_u_6.Hydrate(v13.BGFrame.Body.Progress.Bar)({
        ["Size"] = v_u_6.Spring(v26, 20, 0.95)
    })
    for v_u_27 = 1, 2 do
        local v28 = v13.BGFrame.Body["Stage" .. v_u_27]
        v_u_6.Hydrate(v28.Check)({
            ["BackgroundColor3"] = v_u_6.Spring(v_u_6.Computed(function()
                -- upvalues: (copy) p_u_10, (copy) v_u_27, (ref) v_u_1, (ref) v_u_2
                local v29 = p_u_10.SecretPitySpun:get()
                if v29 < 2 and v_u_27 <= v29 then
                    return v_u_1
                else
                    return v_u_2
                end
            end), 20, 0.95)
        })
        v_u_6.Hydrate(v28.Title)({
            ["TextColor3"] = v_u_8.Rarity.Data[v_u_8.Rarity.Type.Secret].Color,
            ["Text"] = v_u_6.Computed(function()
                -- upvalues: (copy) p_u_10, (ref) v_u_8
                local v30 = p_u_10.PreferredSecret:get()
                local v31
                if v30 then
                    v31 = v_u_8:Get(v30)
                else
                    v31 = nil
                end
                return not (v30 and v31) and "No Style Selected" or v31.DisplayNameOverride or v31.DisplayName
            end)
        })
        v_u_6.Hydrate(v28.Check.Tick)({
            ["Visible"] = v_u_6.Computed(function()
                -- upvalues: (copy) p_u_10, (copy) v_u_27
                local v32 = p_u_10.SecretPitySpun:get()
                local v33
                if v32 < 2 then
                    v33 = v_u_27 <= v32
                else
                    v33 = false
                end
                return v33
            end)
        })
    end
end