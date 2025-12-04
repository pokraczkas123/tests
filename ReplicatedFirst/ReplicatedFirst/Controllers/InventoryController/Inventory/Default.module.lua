-- Decompiled game.ReplicatedFirst.Controllers.InventoryController.Inventory.Default

local v1 = game:GetService("ReplicatedFirst")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = nil
local v_u_4 = require(v1.Components.DisplayItem)
local v_u_5 = require(script.Parent.Parent.SortOrders)
local v_u_6 = require(v1.Components.Button)
local v_u_7 = require(v2.Packages.Fusion)
local v_u_8 = require(v2.Content.Rarity)
local v_u_9 = require(v2.Tools.Number)
local v_u_10 = require(v2.Packages.Knit)
local v_u_11 = require(v2.Content.Item)
local v_u_12 = {
    v_u_11.Type.Ball,
    v_u_11.Type.PlayerCard,
    v_u_11.Type.Emote,
    v_u_11.Type.ScoreEffect,
    v_u_11.Type.Title,
    "Misc"
}
return function(p_u_13)
    -- upvalues: (ref) v_u_3, (copy) v_u_10, (copy) v_u_7, (copy) v_u_11, (copy) v_u_12, (copy) v_u_5, (copy) v_u_6, (copy) v_u_8, (copy) v_u_9, (copy) v_u_4
    v_u_3 = v_u_10.GetController("TooltipController")
    v_u_7.Hydrate(p_u_13.Component)({
        ["Visible"] = v_u_7.Computed(function()
            -- upvalues: (copy) p_u_13
            return not table.find(p_u_13.Pages:get(), p_u_13.SelectedPage:get())
        end)
    })
    local v_u_14 = p_u_13.Component:FindFirstChild((("%*List"):format(p_u_13.ItemType))) or p_u_13.Component:FindFirstChild("List"):Clone()
    v_u_7.Hydrate(v_u_14)({
        ["Name"] = p_u_13.ItemType,
        ["Parent"] = p_u_13.Component,
        ["Visible"] = v_u_7.Computed(function()
            -- upvalues: (copy) p_u_13
            return p_u_13.SelectedPage:get() == ("%*"):format(p_u_13.ItemType)
        end),
        [v_u_7.Children] = v_u_7.ForPairs(p_u_13.Inventory, function(p_u_15, p_u_16)
            -- upvalues: (ref) v_u_11, (copy) p_u_13, (ref) v_u_12, (ref) v_u_7, (copy) v_u_14, (ref) v_u_5, (ref) v_u_6, (ref) v_u_8, (ref) v_u_3, (ref) v_u_9, (ref) v_u_4
            if p_u_16 <= 0 then
                return p_u_15
            end
            local v_u_17 = v_u_11:Get(p_u_15)
            if not v_u_17 then
                return p_u_15
            end
            if v_u_17.Type ~= p_u_13.ItemType and p_u_13.ItemType ~= "Misc" then
                return p_u_15
            end
            if p_u_13.ItemType == "Misc" and table.find(v_u_12, v_u_17.Type) then
                return p_u_15
            end
            local v18 = v_u_7.Hydrate(v_u_14.Template:Clone())({
                ["Name"] = ("%*"):format(v_u_17.DisplayName),
                ["LayoutOrder"] = v_u_7.Computed(function()
                    -- upvalues: (ref) p_u_13, (ref) v_u_5, (copy) v_u_17, (copy) p_u_16
                    return p_u_13.SortMode:get() == v_u_5.Types.Rarity and v_u_17.Rarity or -p_u_16
                end),
                ["Parent"] = p_u_13.Component,
                ["Visible"] = true
            })
            local v19 = v_u_6(v18.Button)({
                ["ImageColor"] = v_u_8.Data[v_u_17.Rarity].BackgroundColor,
                ["OnActivated"] = function()
                    -- upvalues: (ref) p_u_13, (copy) p_u_15
                    p_u_13.Selected:set(p_u_15)
                end,
                ["OnHoverStart"] = function()
                    -- upvalues: (ref) v_u_3, (copy) v_u_17
                    v_u_3:Set(v_u_17)
                end,
                ["OnHoverEnd"] = function()
                    -- upvalues: (ref) v_u_3, (copy) v_u_17
                    if v_u_3:IsHoveringOn(v_u_17) then
                        v_u_3:Set(nil)
                    end
                end
            })
            if v_u_17.Type == v_u_11.Type.Title then
                v18.Button.Flair.ImageColor3 = v_u_8.Data[v_u_17.Rarity].Color
                v18.Button.Title.Text = v_u_17.DisplayName
            else
                v18.Glow.ImageColor3 = v_u_8.Data[v_u_17.Rarity].Color
            end
            v18.Button.ImageColor3 = v_u_8.Data[v_u_17.Rarity].Color
            v_u_7.Hydrate(v19.Rarity)({
                ["Text"] = v_u_8.Data[v_u_17.Rarity].Name,
                ["TextColor3"] = v_u_8.Data[v_u_17.Rarity].Color
            })
            v_u_7.Hydrate(v19.Info)({
                ["Visible"] = v_u_7.Computed(function()
                    -- upvalues: (ref) p_u_13, (copy) p_u_15
                    local v20 = p_u_13.Equipped:get()
                    return ((v20.Ball or "ClassicBall") == p_u_15 or v20.ScoreEffect == p_u_15) and true or v20.Title == p_u_15
                end)
            })
            v_u_7.Hydrate(v19.Quantity)({
                ["Visible"] = v_u_7.Computed(function()
                    -- upvalues: (copy) p_u_16
                    return p_u_16 > 1
                end),
                ["Text"] = ("x%*"):format((v_u_9.format(p_u_16)))
            })
            if v_u_11.Type.Title ~= v_u_17.Type then
                v_u_4(v19.ItemDisplay, p_u_15)
            end
            return p_u_15, v18
        end, v_u_7.cleanup)
    })
    return v_u_14
end