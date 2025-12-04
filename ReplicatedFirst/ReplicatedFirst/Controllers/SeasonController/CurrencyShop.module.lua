-- Decompiled game.ReplicatedFirst.Controllers.SeasonController.CurrencyShop

local v1 = game:GetService("ReplicatedFirst")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Packages.Knit)
local v_u_4 = require(v2.Packages.Fusion)
local v_u_5 = require(v2.Content.Monetization)
local v_u_6 = require(v2.Tools.Logger).new(script.Name)
local v_u_7 = require(v2.Tools.Number)
local v_u_8 = require(v1.Components.Button)
return function(p_u_9)
    -- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_6, (copy) v_u_7, (copy) v_u_8
    local v_u_10 = v_u_3.GetService("MonetizationService")
    v_u_4.Hydrate(p_u_9.Component)({
        ["Visible"] = v_u_4.Computed(function()
            -- upvalues: (copy) p_u_9
            return p_u_9.SelectedMenu:get() == p_u_9.Component.Name
        end)
    })
    for v11, v_u_12 in ipairs(v_u_5.Products.Seasonal.Currency) do
        local v13 = p_u_9.Component.Container:FindFirstChild((("Item%*"):format(v11)))
        if v13 then
            v13.Button.Price.Text = ("%*%*"):format(v_u_5.RobuxSymbol, (v_u_7.format(v_u_12.Cost)))
            v13.Button.Amount.Text = ("+%* %*"):format(v_u_7.format(v_u_12.Product.Reward.Value), p_u_9.Season.Currency.DisplayName)
            v13.LayoutOrder = v_u_12.Cost
            v_u_8(v13.Button)({
                ["OnActivated"] = function()
                    -- upvalues: (copy) v_u_10, (copy) v_u_12
                    v_u_10:RequestPurchase(v_u_12.Id)
                end
            })
        else
            v_u_6:Warn((("Container \'Item%*\' not found!"):format(v11)))
        end
    end
end