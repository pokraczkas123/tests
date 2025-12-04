-- Decompiled game.ReplicatedFirst.Controllers.ShopController.MenuFrame.Sections.PremiumCurrency

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Content.Monetization)
local v_u_3 = require(script.Parent.Parent.RobuxButton)
local v_u_4 = require(v1.Content.Reward)
local v_u_5 = require(v1.Tools.Number)
require(script.Parent.Parent.Types)
return function(p6)
    -- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_4, (copy) v_u_3
    local v7 = p6.MenuFrame.BGFrame.ShopCanvas.ScrollingFrame.PremiumCurrency
    for v8 = 1, 4 do
        local v9 = v_u_2.Products.PremiumCurrency[v8]
        local v10 = v7.Body:FindFirstChild((("Buy%*"):format(v8)))
        v10.DisplayName.Text = ("%* %*"):format(v_u_5.format(v9.Product.Reward.Value), v_u_4.String[v_u_4.Type.PremiumCurrency])
        v_u_3.bind(v10, v9)
        local v11 = v10:FindFirstChild("Text")
        if v11 then
            local v12 = v_u_2.Products.PremiumCurrency[1]
            local v13 = v12.Product.Reward.Value
            local v14 = v9.Cost / v12.Cost
            local v15 = v13 * math.floor(v14)
            if v9.Product.Reward.Value <= v15 then
                v11.Visible = false
            else
                local v16 = v9.Product.Reward.Value - v15
                v11.Text = ("+%* Extra!"):format((v_u_5.format(v16)))
                v11.Visible = true
            end
        end
    end
    return v7
end