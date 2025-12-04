-- Decompiled game.ReplicatedFirst.Controllers.SeasonController.Rebirth

local v1 = game:GetService("ReplicatedFirst")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Packages.Knit)
local v_u_4 = require(v2.Packages.Fusion)
local v_u_5 = require(v2.Tools.Number)
local v_u_6 = require(v2.Content.Monetization)
local v_u_7 = require(v1.Components.Button)
return function(p_u_8)
    -- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_7, (copy) v_u_5, (copy) v_u_6
    local v_u_9 = v_u_3.GetService("MonetizationService")
    local v_u_10 = v_u_3.GetService("SeasonService")
    local v_u_11 = v_u_4.Value(false)
    local v12 = v_u_4.Hydrate(p_u_8.Component)({
        ["Visible"] = v_u_11,
        [v_u_4.Out("Visible")] = v_u_11
    })
    local v_u_13 = v12.Blackout.BackgroundTransparency
    v_u_4.Hydrate(v12.Blackout)({
        ["BackgroundTransparency"] = v_u_4.Spring(v_u_4.Computed(function()
            -- upvalues: (copy) v_u_11, (copy) v_u_13
            return not v_u_11:get() and 1 or v_u_13
        end), 15, 2),
        [v_u_4.OnEvent("Activated")] = function()
            -- upvalues: (copy) v_u_11
            v_u_11:set(false)
        end
    })
    local v_u_14 = v12.Position
    local v17 = v_u_4.Hydrate(v12.Container)({
        ["Position"] = v_u_4.Spring(v_u_4.Computed(function()
            -- upvalues: (copy) v_u_14, (copy) v_u_11
            local v15 = v_u_14
            local v16
            if v_u_11:get() then
                v16 = UDim2.new()
            else
                v16 = UDim2.fromOffset(0, 30)
            end
            return v15 + v16
        end), 20, 2)
    })
    v_u_7(v17.CloseBtn)({
        ["OnActivated"] = function()
            -- upvalues: (copy) v_u_11
            v_u_11:set(false)
        end
    })
    local v18 = v17.Body
    local v_u_19 = v_u_4.Computed(function()
        -- upvalues: (copy) p_u_8
        return (p_u_8.Seasonal:get().Rebirths or 0) < p_u_8.Season.Rebirth.MaximumAllowedWithCurrency
    end)
    v_u_4.Hydrate(v18.Hint)({
        ["Visible"] = v_u_19,
        ["Text"] = ("Use YEN until rebirth %*!"):format(p_u_8.Season.Rebirth.MaximumAllowedWithCurrency)
    })
    v_u_7(v18.RebirthYen)({
        ["Visible"] = v_u_19,
        ["OnActivated"] = function()
            -- upvalues: (copy) v_u_11, (copy) v_u_10
            v_u_11:set(false)
            v_u_10:RequestCurrencyRebirth()
        end
    })
    v_u_4.Hydrate(v18.GlowYellow)({
        ["Visible"] = v_u_19
    })
    local v_u_20 = v18.GlowGreen.Position
    v_u_4.Hydrate(v18.GlowGreen)({
        ["Position"] = v_u_4.Computed(function()
            -- upvalues: (copy) v_u_19, (copy) v_u_20
            if v_u_19:get() then
                return v_u_20
            else
                return UDim2.fromScale(0.5, v_u_20.Y.Scale)
            end
        end)
    })
    v18.RebirthYen.Amount.Text = v_u_5.format(p_u_8.Season.Rebirth.CurrencyCost)
    local v_u_21 = v18.RebirthRobux.Position
    v_u_7(v18.RebirthRobux)({
        ["Position"] = v_u_4.Computed(function()
            -- upvalues: (copy) v_u_19, (copy) v_u_21
            if v_u_19:get() then
                return v_u_21
            else
                return UDim2.fromScale(0.5, v_u_21.Y.Scale)
            end
        end),
        ["OnActivated"] = function()
            -- upvalues: (copy) v_u_11, (copy) v_u_9
            v_u_11:set(false)
            v_u_9:RequestPurchaseName("SeasonalRebirth")
        end
    })
    v18.RebirthRobux.Text.Text = ("%* %*"):format(v_u_6.RobuxSymbol, v_u_6.Products.Seasonal.Rebirth.Cost)
    v_u_4.Hydrate(v18.Or)({
        ["Visible"] = v_u_19
    })
    return v12
end