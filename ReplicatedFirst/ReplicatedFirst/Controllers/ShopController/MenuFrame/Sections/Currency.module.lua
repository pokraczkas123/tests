-- Decompiled game.ReplicatedFirst.Controllers.ShopController.MenuFrame.Sections.Currency

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Content.Monetization)
local v_u_3 = require(script.Parent.Parent.RobuxButton)
local v_u_4 = require(v1.Content.Reward)
local v_u_5 = require(v1.Tools.Number)
require(script.Parent.Parent.Types)
return function(p6)
    -- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_4, (copy) v_u_3
    local v7 = p6.MenuFrame.BGFrame.ShopCanvas.ScrollingFrame.Currency
    v7.Visible = not p6.States.Player.ArePaidRandomItemsRestricted
    for v8 = 1, 4 do
        local v9 = v_u_2.Products.Currency[v8]
        local v10 = v7.Body:FindFirstChild((("Buy%*"):format(v8)))
        v10.DisplayName.Text = ("%* %*"):format(v_u_5.format(v9.Product.Reward.Value), v_u_4.String[v_u_4.Type.Currency])
        v_u_3.bind(v10, v9)
    end
    return v7
end