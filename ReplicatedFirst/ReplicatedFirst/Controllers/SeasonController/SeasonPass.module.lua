-- Decompiled game.ReplicatedFirst.Controllers.SeasonController.SeasonPass

local v1 = game:GetService("ReplicatedFirst")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Packages.Fusion)
local v_u_4 = require(v1.Components.Button)
local v_u_5 = require(v2.Packages.Knit)
local v_u_6 = require(script.Experience)
local v_u_7 = require(script.EndReward)
local v_u_8 = require(script.Rebirths)
local v_u_9 = require(script.Rewards)
return function(p_u_10)
    -- upvalues: (copy) v_u_5, (copy) v_u_8, (copy) v_u_6, (copy) v_u_9, (copy) v_u_7, (copy) v_u_3, (copy) v_u_4
    local v_u_11 = v_u_5.GetService("MonetizationService")
    local v_u_12 = v_u_5.GetController("GiftController")
    v_u_8({
        ["Component"] = p_u_10.Component.RebirthBarBack,
        ["Seasonal"] = p_u_10.Seasonal,
        ["Season"] = p_u_10.Season
    })
    v_u_6({
        ["Component"] = p_u_10.Component.XPBarBack,
        ["Seasonal"] = p_u_10.Seasonal,
        ["Season"] = p_u_10.Season
    })
    v_u_9({
        ["Component"] = p_u_10.Component.Rewards.ScrollingFrame,
        ["Seasonal"] = p_u_10.Seasonal,
        ["Season"] = p_u_10.Season,
        ["CurrentTier"] = p_u_10.CurrentTier,
        ["SkipsVisible"] = p_u_10.SkipsVisible
    })
    v_u_7({
        ["Component"] = p_u_10.Component.EndReward,
        ["Seasonal"] = p_u_10.Seasonal,
        ["Season"] = p_u_10.Season,
        ["CurrentTier"] = p_u_10.CurrentTier
    })
    v_u_3.Hydrate(p_u_10.Component)({
        ["Visible"] = v_u_3.Computed(function()
            -- upvalues: (copy) p_u_10
            return p_u_10.SelectedMenu:get() == "Main"
        end)
    })
    v_u_4(p_u_10.Component.PremiumLane.PurchaseButton)({
        ["OnActivated"] = function()
            -- upvalues: (copy) p_u_10
            p_u_10.PremiumMenuVisibility:set(true)
        end
    })
    v_u_4(p_u_10.Component.PremiumLane.Gift)({
        ["OnActivated"] = function()
            -- upvalues: (copy) v_u_12, (copy) v_u_11
            v_u_12:Open({
                ["Name"] = "SeasonalPremium",
                ["Callback"] = function(p13)
                    -- upvalues: (ref) v_u_11
                    v_u_11:RequestPurchaseName("SeasonalPremium", p13)
                end
            })
        end
    })
    v_u_3.Hydrate(p_u_10.Component.PremiumLane.PurchaseButton.Text)({
        ["Text"] = v_u_3.Computed(function()
            -- upvalues: (copy) p_u_10
            return (p_u_10.Seasonal:get() or {
                ["IsPremium"] = true
            }).IsPremium and "\240\159\142\129 GIFT!" or "\240\159\148\147 UNLOCK!"
        end)
    })
end