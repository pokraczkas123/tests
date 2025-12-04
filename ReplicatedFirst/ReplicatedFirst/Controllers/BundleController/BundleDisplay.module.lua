-- Decompiled game.ReplicatedFirst.Controllers.BundleController.BundleDisplay

local v1 = game:GetService("ReplicatedFirst")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = nil
local v_u_4 = nil
local v_u_5 = nil
local v_u_6 = require(v2.Packages.Knit)
local v_u_7 = require(v2.Packages.Fusion)
local v_u_8 = require(v2.Content.Bundle)
local v_u_9 = require(v2.Content.Reward)
local v_u_10 = require(v2.Content.Item)
local v_u_11 = require(v2.Content.Monetization)
local v_u_12 = require(v2.Tools.Number)
local v_u_13 = require(v1.Components.Button)
return function(p_u_14)
    -- upvalues: (ref) v_u_3, (copy) v_u_6, (ref) v_u_4, (ref) v_u_5, (copy) v_u_8, (copy) v_u_11, (copy) v_u_7, (copy) v_u_9, (copy) v_u_10, (copy) v_u_12, (copy) v_u_13
    v_u_3 = v_u_6.GetService("MonetizationService")
    v_u_4 = v_u_6.GetController("InterfaceController")
    v_u_5 = v_u_6.GetController("GiftController")
    local v_u_15 = v_u_8:Get(p_u_14.BundleId)
    local v_u_16 = v_u_11:GetDataFromName(p_u_14.BundleId)
    local v17 = v_u_7.Value(true)
    local v18 = v_u_7.Hydrate(p_u_14.Template)({
        ["Parent"] = p_u_14.Parent,
        ["Visible"] = v17,
        ["LayoutOrder"] = v_u_16.Cost
    })
    local v19 = v18.Container.Content.Template
    v18.Container.Content.UIGridLayout.FillDirectionMaxCells = #v_u_15.Rewards > 2 and 2 or 1
    for _, v20 in v_u_15.Rewards do
        local v21 = v19:Clone()
        v21.Parent = v18.Container.Content
        if v20.Type ~= v_u_9.Type.Item then
            v21.Button.Quantity.Text = ("x%*"):format((v_u_12.format(v20.Value)))
            goto l11
        end
        local v22 = v_u_10:Get(v20.Value)
        if v22.Type == v_u_10.Type.PlayerCard then
            v21:Destroy()
        else
            if v22 ~= nil then
                v21.Button.ImageColor3 = v_u_10.Rarity.Data[v22.Rarity].BackgroundColor
                v21.Button.Stroke.ImageColor3 = v_u_10.Rarity.Data[v22.Rarity].Color
                v21.Button.Quantity.Text = ("x%*"):format((v_u_12.format(not v20.Quantity and 1 or v20.Quantity)))
            end
            ::l11::
            v21.Button.Image = ""
            v_u_9.setIcon(v20, v21.Button.ItemDisplay.ImageLabel)
            v21.Visible = true
        end
    end
    local v23 = {
        ["OnActivated"] = function()
            -- upvalues: (ref) v_u_8, (copy) v_u_15, (ref) v_u_4, (copy) p_u_14, (ref) v_u_3
            if v_u_8.isActive(v_u_15) then
                if not v_u_4.Rewards:get()[("Bundle%*"):format(p_u_14.BundleId)] then
                    v_u_3:RequestPurchaseName(p_u_14.BundleId)
                    return
                end
            else
                v_u_4:SelectLobbyMenu("")
            end
        end
    }
    v_u_13(v18.Container.Buttons.Buy)(v23)
    local v25 = {
        ["OnActivated"] = function()
            -- upvalues: (ref) v_u_8, (copy) v_u_15, (ref) v_u_5, (copy) p_u_14, (ref) v_u_3, (ref) v_u_4
            if v_u_8.isActive(v_u_15) then
                v_u_5:Open({
                    ["Name"] = p_u_14.BundleId,
                    ["Callback"] = function(p24)
                        -- upvalues: (ref) v_u_3, (ref) p_u_14
                        v_u_3:RequestPurchaseName(p_u_14.BundleId, p24)
                    end
                })
            else
                v_u_4:SelectLobbyMenu("")
            end
        end
    }
    v_u_13(v18.Container.Buttons.Gift)(v25)
    v_u_7.Hydrate(v18.Container.Buttons.Buy.Text)({
        ["Text"] = v_u_7.Computed(function()
            -- upvalues: (ref) v_u_11, (ref) v_u_12, (copy) v_u_16
            return ("%* %*"):format(v_u_11.RobuxSymbol, (v_u_12.format(v_u_16.Cost)))
        end)
    })
    return v18
end