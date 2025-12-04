-- Decompiled game.ReplicatedFirst.Controllers.ShopController.MenuFrame.Sections.StockShop.Template

local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("ReplicatedFirst")
local v_u_3 = require(v1.Packages.Fusion)
local v_u_4 = require(v1.Content.Reward)
local v_u_5 = require(v1.Tools.Number)
local v_u_6 = require(v2.Components.Button)
require(script.Parent.Parent.Parent.Types)
return function(p_u_7)
    -- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_5, (copy) v_u_6
    local v_u_8 = p_u_7.Reward
    local v_u_9 = p_u_7.Template:Clone()
    local v10 = v_u_8.Type
    local v11 = v_u_8.Value
    v_u_9.Name = ("StockItemButton_%*_%*"):format(v10, (tostring(v11)))
    v_u_9.Visible = true
    v_u_9.Active = true
    v_u_9.Count.Active = true
    v_u_9.Count.GemIcon.Image = v_u_4.Icons[v_u_4.Type.PremiumCurrency]
    v_u_3.Hydrate(v_u_9.Stock)({
        ["Text"] = v_u_3.Computed(function()
            -- upvalues: (ref) v_u_5, (copy) p_u_7
            return ("%*/%*"):format(v_u_5.format(p_u_7.Stock:get()), (v_u_5.format(p_u_7.TotalStock)))
        end)
    })
    if p_u_7.Discount then
        v_u_9.Hint.Visible = true
        local v12 = v_u_9.Hint
        local v13 = p_u_7.Discount * 100
        v12.Text = ("-%*%%"):format((math.floor(v13)))
    else
        v_u_9.Hint.Visible = false
    end
    v_u_9.Count.Price.Text = ("%*"):format((v_u_5.format(p_u_7.Cost)))
    if v_u_8.Type == v_u_4.Type.Item then
        v_u_9.Quantity.Visible = false
    else
        v_u_9.Quantity.Text = ("x%*"):format((v_u_5.format(v_u_8.Value)))
    end
    task.defer(function()
        -- upvalues: (ref) v_u_4, (copy) v_u_8, (copy) v_u_9
        task.wait()
        pcall(function()
            -- upvalues: (ref) v_u_4, (ref) v_u_8, (ref) v_u_9
            v_u_4.setIcon(v_u_8, v_u_9.Icon)
        end)
    end)
    v_u_6(v_u_9)({
        ["OnActivated"] = p_u_7.OnPurchaseActivated
    })
    v_u_6(v_u_9.Count)({
        ["OnActivated"] = p_u_7.OnPurchaseActivated
    })
    return v_u_9
end