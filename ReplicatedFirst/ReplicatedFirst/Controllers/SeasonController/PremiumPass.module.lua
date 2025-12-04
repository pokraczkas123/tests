-- Decompiled game.ReplicatedFirst.Controllers.SeasonController.PremiumPass

local v1 = game:GetService("ReplicatedFirst")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Packages.Knit)
local v_u_4 = require(v2.Packages.Fusion)
local v_u_5 = require(v2.Content.Monetization)
local v_u_6 = require(v1.Components.Button)
return function(p_u_7)
    -- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_6, (copy) v_u_5
    local v_u_8 = v_u_3.GetService("MonetizationService")
    local v_u_9 = v_u_3.GetController("GiftController")
    local v10 = v_u_4.Hydrate(p_u_7.Component)({
        ["Visible"] = p_u_7.Visibility,
        [v_u_4.Out("Visible")] = p_u_7.Visibility
    })
    local v_u_11 = v10.Blackout.BackgroundTransparency
    v_u_4.Hydrate(v10.Blackout)({
        ["BackgroundTransparency"] = v_u_4.Spring(v_u_4.Computed(function()
            -- upvalues: (copy) p_u_7, (copy) v_u_11
            return not p_u_7.Visibility:get() and 1 or v_u_11
        end), 15, 2),
        [v_u_4.OnEvent("Activated")] = function()
            -- upvalues: (copy) p_u_7
            p_u_7.Visibility:set(false)
        end
    })
    local v_u_12 = v10.Container.Position
    v_u_4.Hydrate(v10.Container)({
        ["Position"] = v_u_4.Spring(v_u_4.Computed(function()
            -- upvalues: (copy) v_u_12, (copy) p_u_7
            local v13 = v_u_12
            local v14
            if p_u_7.Visibility:get() then
                v14 = UDim2.new()
            else
                v14 = UDim2.fromOffset(0, 30)
            end
            return v13 + v14
        end), 20, 2)
    })
    local v_u_15 = v_u_4.Computed(function()
        -- upvalues: (copy) p_u_7
        return (p_u_7.Seasonal:get() or {
            ["IsPremium"] = true
        }).IsPremium
    end)
    local function v_u_19(p_u_16, p17)
        -- upvalues: (copy) v_u_9, (copy) v_u_8, (copy) v_u_15
        if p17 then
            v_u_9:Open({
                ["Name"] = p_u_16,
                ["Callback"] = function(p18)
                    -- upvalues: (ref) v_u_8, (copy) p_u_16
                    v_u_8:RequestPurchaseName(p_u_16, p18)
                end
            })
            return
        elseif not v_u_15:get() then
            v_u_8:RequestPurchaseName(p_u_16)
        end
    end
    v_u_6(v10.CloseBtn)({
        ["OnActivated"] = function()
            -- upvalues: (copy) p_u_7
            p_u_7.Visibility:set(false)
        end
    })
    v_u_6(v10.Container.TemplateSmall.Container.Buttons.Buy)({
        ["OnActivated"] = function()
            -- upvalues: (copy) v_u_19
            v_u_19("SeasonalPremium", false)
        end,
        ["Interactable"] = v_u_4.Computed(function()
            -- upvalues: (copy) v_u_15
            v_u_15:get()
            return true
        end)
    })
    v_u_6(v10.Container.TemplateSmall.Container.Buttons.Gift)({
        ["OnActivated"] = function()
            -- upvalues: (copy) v_u_19
            v_u_19("SeasonalPremium", true)
        end
    })
    v_u_6(v10.Container.TemplateLarge.Container.Buttons.Buy)({
        ["OnActivated"] = function()
            -- upvalues: (copy) v_u_19
            v_u_19("SeasonalUltra", false)
        end,
        ["Interactable"] = v_u_4.Computed(function()
            -- upvalues: (copy) v_u_15
            v_u_15:get()
            return true
        end)
    })
    v_u_6(v10.Container.TemplateLarge.Container.Buttons.Gift)({
        ["OnActivated"] = function()
            -- upvalues: (copy) v_u_19
            v_u_19("SeasonalUltra", true)
        end
    })
    v_u_4.Hydrate(v10.Container.TemplateSmall.Container.Buttons.Buy.Text)({
        ["Text"] = v_u_4.Computed(function()
            -- upvalues: (copy) v_u_15, (ref) v_u_5
            return v_u_15:get() and "PURCHASED" or ("%*%*"):format(v_u_5.RobuxSymbol, v_u_5:GetDataFromName("SeasonalPremium").Cost)
        end)
    })
    v_u_4.Hydrate(v10.Container.TemplateLarge.Container.Buttons.Buy.Text)({
        ["Text"] = v_u_4.Computed(function()
            -- upvalues: (copy) v_u_15, (ref) v_u_5
            return v_u_15:get() and "PURCHASED" or ("%*%*"):format(v_u_5.RobuxSymbol, v_u_5:GetDataFromName("SeasonalUltra").Cost)
        end)
    })
    return v10
end