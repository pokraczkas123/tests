-- Decompiled game.ReplicatedFirst.Controllers.ShopController.MenuFrame.RobuxButton

local v1 = game:GetService("ReplicatedFirst")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = nil
local v_u_4 = nil
local v_u_5 = require(v2.Content.Monetization)
local v_u_6 = require(v1.Components.Button)
local v_u_7 = require(v2.Packages.Fusion)
local v_u_8 = require(v2.Tools.Number)
local v_u_9 = require(v2.Packages.Knit)
require(script.Parent.Parent.MenuFrame.Types)
local v_u_20 = {
    ["_purchase"] = function(p10)
        -- upvalues: (ref) v_u_3, (copy) v_u_9
        v_u_3 = v_u_3 or v_u_9.GetService("MonetizationService")
        v_u_3:RequestPurchase(p10)
    end,
    ["_gift"] = function(p_u_11)
        -- upvalues: (ref) v_u_3, (copy) v_u_9, (ref) v_u_4
        v_u_3 = v_u_3 or v_u_9.GetService("MonetizationService")
        v_u_4 = v_u_4 or v_u_9.GetController("GiftController")
        v_u_4:Open({
            ["Id"] = p_u_11,
            ["Callback"] = function(p12)
                -- upvalues: (ref) v_u_3, (copy) p_u_11
                v_u_3:RequestPurchase(p_u_11, p12)
            end
        })
    end,
    ["bootstrap"] = function(p13)
        -- upvalues: (copy) v_u_20
        v_u_20._idsOwnedSet = p13.States.Passes.IdsOwnedSet
    end,
    ["bind"] = function(p14, p_u_15)
        -- upvalues: (copy) v_u_7, (copy) v_u_20, (copy) v_u_5, (copy) v_u_8, (copy) v_u_6
        local v_u_17 = v_u_7.Computed(function()
            -- upvalues: (copy) p_u_15, (ref) v_u_20
            if p_u_15.Product then
                return false
            end
            local v16 = v_u_20._idsOwnedSet:get()
            return v16[p_u_15.Id] or v16[p_u_15.GiftId]
        end)
        p14.Buy.Active = true
        v_u_7.Hydrate(p14.Buy.Text)({
            ["Text"] = v_u_7.Computed(function()
                -- upvalues: (copy) v_u_17, (ref) v_u_5, (ref) v_u_8, (copy) p_u_15
                return v_u_17:get() and "OWNED" or ("%* %*"):format(v_u_5.RobuxSymbol, (v_u_8.format(p_u_15.Cost)))
            end)
        })
        local v18 = {
            ["OnActivated"] = function()
                -- upvalues: (ref) v_u_20, (copy) p_u_15
                v_u_20._purchase(p_u_15.Id)
            end
        }
        v_u_6(p14.Buy)(v18)
        local v19 = {
            ["OnActivated"] = function()
                -- upvalues: (ref) v_u_20, (copy) p_u_15
                v_u_20._gift(p_u_15.Id)
            end
        }
        v_u_6(p14.Gift)(v19)
    end
}
return v_u_20