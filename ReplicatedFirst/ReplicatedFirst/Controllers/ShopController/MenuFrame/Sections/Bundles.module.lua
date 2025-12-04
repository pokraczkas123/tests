-- Decompiled game.ReplicatedFirst.Controllers.ShopController.MenuFrame.Sections.Bundles

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Packages.Fusion)
local v_u_3 = require(v1.Content.Shop)
require(script.Parent.Parent.Types)
local v_u_4 = require(script.Template)
local v_u_5 = require(script.Parent.Parent.PromptPurchase)
return function(p_u_6)
    -- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_5, (copy) v_u_3
    local v_u_7 = p_u_6.MenuFrame.BGFrame.ShopCanvas.ScrollingFrame.Bundles
    local function v_u_8()
        -- upvalues: (copy) p_u_6
        return p_u_6.MenuFrame.Visible == true
    end
    local v9 = v_u_2.Computed(function()
        -- upvalues: (copy) p_u_6
        return #p_u_6.States.Shop.Bundles.Current:get() > 0
    end)
    v_u_2.Hydrate(p_u_6.MenuFrame.Categories.Bundles)({
        ["Visible"] = v9
    })
    v_u_2.Hydrate(v_u_7)({
        ["Visible"] = v9,
        [v_u_2.Children] = { v_u_2.ForPairs(p_u_6.States.Shop.Bundles.Current, function(p_u_10, p_u_11)
                -- upvalues: (ref) v_u_4, (copy) v_u_7, (ref) v_u_2, (copy) p_u_6, (ref) v_u_5, (ref) v_u_3, (copy) v_u_8
                return p_u_10, v_u_4({
                    ["Template"] = v_u_7.Template,
                    ["ShopBundle"] = p_u_11,
                    ["AmountPurchased"] = v_u_2.Computed(function()
                        -- upvalues: (ref) p_u_6, (copy) p_u_11
                        return p_u_6.States.Shop.Bundles.History:get()[p_u_11.Id] or 0
                    end),
                    ["OnPurchaseActivated"] = function()
                        -- upvalues: (ref) v_u_5, (ref) v_u_3, (copy) p_u_10, (copy) p_u_11
                        v_u_5({
                            ["SourceEnum"] = v_u_3.Source.BundleShop,
                            ["PurchaseIndex"] = p_u_10,
                            ["Cost"] = p_u_11.Cost,
                            ["RewardText"] = p_u_11.DisplayName
                        })
                    end,
                    ["CanSpecialEffectsPlay"] = v_u_8
                })
            end, v_u_2.cleanup) }
    })
    return v_u_7
end