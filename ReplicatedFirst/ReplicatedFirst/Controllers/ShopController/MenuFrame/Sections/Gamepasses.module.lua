-- Decompiled game.ReplicatedFirst.Controllers.ShopController.MenuFrame.Sections.Gamepasses

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Content.Monetization)
local v_u_3 = require(script.Parent.Parent.RobuxButton)
require(script.Parent.Parent.Types)
return function(p4)
    -- upvalues: (copy) v_u_2, (copy) v_u_3
    local v5 = p4.MenuFrame.BGFrame.ShopCanvas.ScrollingFrame.Gamepasses
    local v6 = v5.Template
    local v7 = v_u_2:GetDataFromName("VIP")
    v_u_3.bind(v6, v7)
    return v5
end