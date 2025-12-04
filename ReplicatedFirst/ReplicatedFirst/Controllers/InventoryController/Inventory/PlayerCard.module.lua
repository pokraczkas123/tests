-- Decompiled game.ReplicatedFirst.Controllers.InventoryController.Inventory.PlayerCard

local v_u_1 = Color3.fromRGB(7, 7, 7)
local v_u_2 = Color3.fromRGB(53, 0, 0)
local v_u_3 = Color3.fromRGB(3, 38, 0)
local v4 = game:GetService("ReplicatedFirst")
local v5 = game:GetService("ReplicatedStorage")
local v_u_6 = require(v5.Packages.Fusion)
local v_u_7 = require(v5.Content.Item)
local v_u_8 = require(v4.Components.Button)
local v_u_9 = require(v5.Configuration.Palette)
local v_u_10 = require(v5.Tools.Sprite)
local v_u_11 = require(script.Info)
return function(p_u_12)
    -- upvalues: (copy) v_u_6, (copy) v_u_11, (copy) v_u_7, (copy) v_u_3, (copy) v_u_1, (copy) v_u_2, (copy) v_u_9, (copy) v_u_8, (copy) v_u_10
    local v_u_13 = v_u_6.Value(p_u_12.Equipped:get().PlayerCard)
    v_u_6.Hydrate(p_u_12.Component)({
        ["Visible"] = v_u_6.Computed(function()
            -- upvalues: (copy) p_u_12
            return p_u_12.SelectedPage:get() == p_u_12.ItemType
        end)
    })
    v_u_11({
        ["Component"] = p_u_12.Component:FindFirstChild("InfoContainer"),
        ["Selected"] = v_u_13,
        ["ItemCount"] = p_u_12.ItemCount,
        ["Equipped"] = p_u_12.Equipped,
        ["Inventory"] = p_u_12.Inventory
    })
    local v14 = p_u_12.Component:FindFirstChild("List")
    local v15 = v_u_7:GetAllIdsFromType(p_u_12.ItemType)
    v14.UIGridLayout.SortOrder = Enum.SortOrder.Name
    for _, v_u_16 in v15 do
        local v_u_17 = v_u_7:Get(v_u_16)
        if v_u_17 then
            local v_u_19 = v_u_6.Computed(function()
                -- upvalues: (copy) p_u_12, (copy) v_u_16
                local v18 = p_u_12.Equipped:get().PlayerCard
                return ((not v18 or v18 == "") and "Classic1PlayerCard" or v18) == v_u_16
            end)
            local v20 = not (v_u_17.Metadata and v_u_17.Metadata.Objective) and {
                ["Type"] = "None",
                ["Value"] = 0
            } or v_u_17.Metadata.Objective
            local v21 = v_u_17.Metadata and v_u_17.Metadata.Objective and v_u_17.Metadata.Objective.IsHidden and "___" or ("%*_%*"):format(v20.Type, v20.Value)
            local v22 = v_u_6.Hydrate(v14.Template:Clone())({
                ["Name"] = ("%*_%*_%*"):format(v_u_17.Metadata.LayoutOrder or 9, v21, v_u_17.Id),
                ["Parent"] = v14,
                ["Visible"] = v_u_6.Computed(function()
                    -- upvalues: (copy) v_u_17, (copy) p_u_12, (copy) v_u_16
                    return (not v_u_17.Metadata or not v_u_17.Metadata.IsHiddenFromInventory or (p_u_12.Inventory:get()[v_u_16] or 0) > 0) and true or false
                end),
                ["BackgroundColor3"] = v_u_6.Computed(function()
                    -- upvalues: (copy) v_u_19, (ref) v_u_3, (copy) p_u_12, (copy) v_u_16, (ref) v_u_1, (ref) v_u_2
                    if v_u_19:get() then
                        return v_u_3
                    elseif (p_u_12.Inventory:get()[v_u_16] or 0) > 0 then
                        return v_u_1
                    else
                        return v_u_2
                    end
                end)
            })
            v_u_6.Hydrate(v22.Lock)({
                ["Visible"] = v_u_6.Computed(function()
                    -- upvalues: (copy) p_u_12, (copy) v_u_16, (copy) v_u_19
                    local v23
                    if (p_u_12.Inventory:get()[v_u_16] or 0) <= 0 then
                        v23 = not v_u_19:get()
                    else
                        v23 = false
                    end
                    return v23
                end)
            })
            local v24 = v22.Lock.Lock
            local v25
            if v_u_17.Metadata and v_u_17.Metadata.Objective and v_u_17.Metadata.Objective.IsHidden then
                v25 = v_u_9.SpecialPink
            else
                v25 = v_u_9.Locked
            end
            v24.ImageColor3 = v25
            v_u_6.Hydrate(v22.Equipped)({
                ["Visible"] = v_u_19
            })
            v_u_6.Hydrate(v22.UIStroke)({
                ["Enabled"] = v_u_6.Computed(function()
                    -- upvalues: (copy) v_u_19, (copy) v_u_13, (copy) v_u_16
                    return v_u_19:get() and true or v_u_13:get() == v_u_16
                end),
                ["Color"] = v_u_6.Computed(function()
                    -- upvalues: (copy) v_u_13, (copy) v_u_16, (copy) v_u_19
                    if v_u_13:get() == v_u_16 and not v_u_19:get() then
                        return Color3.fromRGB(246, 152, 0)
                    else
                        return Color3.fromRGB(25, 246, 0)
                    end
                end)
            })
            local v26 = v_u_8(v22.Button)({
                ["OnActivated"] = function()
                    -- upvalues: (copy) v_u_13, (copy) v_u_16
                    v_u_13:set(v_u_16)
                end,
                ["OnHoverStart"] = function() end,
                ["OnHoverEnd"] = function() end
            })
            local v27 = v_u_17.Metadata and v_u_17.Metadata.Stat and true or false
            v26.CardHolder.Stat.Visible = v27
            v26.CardHolder.StatValue.Visible = v27
            if v27 then
                v26.CardHolder.Stat.Text = v_u_17.Metadata.Stat:upper()
                v26.CardHolder.StatValue.Text = "999"
            end
            local v28 = v_u_10.play(v26.CardHolder, v_u_17.Asset)
            v_u_6.Hydrate(v26.CardHolder)({
                [v_u_6.Cleanup] = { v28 }
            })
            if v_u_17.Metadata and v_u_17.Metadata.BaseColor then
                v26.CardHolder.ImageColor3 = v_u_17.Metadata.BaseColor
            end
        end
    end
    v_u_6.Hydrate(v14)({
        ["Name"] = p_u_12.ItemType,
        ["Parent"] = p_u_12.Component,
        ["Visible"] = v_u_6.Computed(function()
            -- upvalues: (copy) p_u_12
            return p_u_12.SelectedPage:get() == ("%*"):format(p_u_12.ItemType)
        end)
    })
    return v14
end