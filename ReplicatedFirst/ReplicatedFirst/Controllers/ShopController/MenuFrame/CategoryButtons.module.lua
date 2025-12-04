-- Decompiled game.ReplicatedFirst.Controllers.ShopController.MenuFrame.CategoryButtons

local v1 = game:GetService("ReplicatedFirst")
local v_u_2 = require(v1.Components.Button)
local v_u_3 = require(script.Parent.Sections)
require(script.Parent.Types)
return {
    ["bootstrap"] = function(p4)
        -- upvalues: (copy) v_u_2, (copy) v_u_3
        local v5 = {}
        for _, v6 in p4.MenuFrame.Categories:GetChildren() do
            if v6.ClassName == "ImageButton" then
                table.insert(v5, v6)
            end
            if v6.Name == "Currency" then
                v6.Visible = not p4.States.Player.ArePaidRandomItemsRestricted
            end
        end
        for _, v_u_7 in v5 do
            local v8 = {
                ["OnActivated"] = function()
                    -- upvalues: (ref) v_u_3, (copy) v_u_7
                    v_u_3.moveScrollingFrameTo(v_u_7.Name)
                end
            }
            v_u_2(v_u_7)(v8)
        end
    end
}