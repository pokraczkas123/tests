-- Decompiled game.ReplicatedFirst.Controllers.ShopController.MenuFrame.Sections.Bundles.Template

local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("ReplicatedFirst")
require(v1.Content.ShopBundle)
local v_u_3 = require(v1.Packages.Fusion)
local v_u_4 = require(v1.Content.Reward)
local v_u_5 = require(v1.Content.Item)
local v_u_6 = require(v1.Tools.Number)
local v_u_7 = require(v2.Components.Button)
require(script.Parent.Parent.Parent.Types)
local v_u_8 = require(script.Parent.MovingGradient)
return function(p_u_9)
    -- upvalues: (copy) v_u_3, (copy) v_u_6, (copy) v_u_8, (copy) v_u_4, (copy) v_u_5, (copy) v_u_7
    local v_u_10 = p_u_9.ShopBundle
    local v_u_13 = v_u_3.Computed(function()
        -- upvalues: (copy) p_u_9, (copy) v_u_10
        local v11 = p_u_9.AmountPurchased:get()
        local v12 = v_u_10.MaxPurchases - v11
        return math.max(0, v12)
    end)
    local v14 = p_u_9.Template:Clone()
    v14.Name = ("BundleFrame_%*"):format(v_u_10.Id)
    v14.Visible = true
    v14.DisplayName.Text = "\226\157\150 LIMITED OFFER \226\157\150"
    v14.DisplayName.TextColor3 = v_u_10.Metadata.TextColor
    v14.HeaderLabel.Text = v_u_10.DisplayName
    v14.HeaderLabel.Visible = true
    v14.HotLabel.Visible = v_u_10.IsHot
    v14.BuyButton.CostLabel.Text = v_u_6.format(v_u_10.Cost)
    local v15, v16 = v_u_8.computed({
        ["Gradient"] = v_u_10.Metadata.ColorGradient,
        ["CanCalculate"] = p_u_9.CanSpecialEffectsPlay
    })
    v_u_3.Hydrate(v14)({
        [v_u_3.Cleanup] = { v16 }
    })
    v_u_3.Hydrate(v14.Glow)({
        [v_u_3.Children] = { v_u_3.New("UIGradient")({
                ["Color"] = v15,
                ["Rotation"] = 5
            }) }
    })
    v_u_3.Hydrate(v14.UIStroke)({
        [v_u_3.Children] = { v_u_3.New("UIGradient")({
                ["Color"] = v15,
                ["Rotation"] = 5
            }) }
    })
    v_u_3.Hydrate(v14.BG1)({
        [v_u_3.Children] = { v_u_3.New("UIGradient")({
                ["Color"] = v15,
                ["Rotation"] = 5
            }) }
    })
    v_u_3.Hydrate(v14.BG2.UIGradient)({
        ["Color"] = v15
    })
    v14.StockLabel.TextColor3 = v_u_10.Metadata.TextColor
    v_u_3.Hydrate(v14.StockLabel)({
        ["Text"] = v_u_3.Computed(function()
            -- upvalues: (ref) v_u_6, (copy) v_u_13, (copy) v_u_10
            return ("%*/%* LEFT"):format(v_u_6.format(v_u_13:get()), v_u_10.MaxPurchases)
        end)
    })
    v_u_3.Hydrate(v14.SoldOutLabel)({
        ["Visible"] = v_u_3.Computed(function()
            -- upvalues: (copy) v_u_13
            return v_u_13:get() <= 0
        end)
    })
    for _, v_u_17 in v_u_10.Rewards do
        local v18
        if v_u_17.Quantity then
            v18 = v_u_17.Quantity
        else
            local v19 = v_u_17.Value
            if typeof(v19) == "number" then
                v18 = v_u_17.Value
            else
                v18 = nil
            end
        end
        local v20
        if v_u_17.Type == v_u_4.Type.Item then
            v20 = v_u_5:Get(v_u_17.Value)
        else
            v20 = nil
        end
        local v21 = v20 and v20.Type == v_u_5.Type.PlayerCard and "TemplateCard" or "Template"
        local v_u_22 = v14.RewardsContainer[v21]:Clone()
        v_u_22.Visible = true
        v_u_22.Active = true
        if v18 then
            v_u_22.QuantityLabel.Text = ("x%*"):format((v_u_6.format(v18)))
        else
            v_u_22.QuantityLabel.Visible = false
        end
        v_u_22.Parent = v14.RewardsContainer
        task.defer(function()
            -- upvalues: (ref) v_u_4, (copy) v_u_17, (copy) v_u_22
            task.wait()
            pcall(function()
                -- upvalues: (ref) v_u_4, (ref) v_u_17, (ref) v_u_22
                v_u_4.setIcon(v_u_17, v_u_22.Icon)
            end)
        end)
    end
    v14.BuyButton.GemIcon.Image = v_u_4.Icons[v_u_4.Type.PremiumCurrency]
    v_u_7(v14.BuyButton)({
        ["OnActivated"] = p_u_9.OnPurchaseActivated
    })
    return v14
end