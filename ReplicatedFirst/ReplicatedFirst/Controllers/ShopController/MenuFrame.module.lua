-- Decompiled game.ReplicatedFirst.Controllers.ShopController.MenuFrame

local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("ReplicatedFirst")
local v_u_3 = nil
local v_u_4 = require(v1.Packages.Knit)
local v_u_5 = require(v2.Components.Button)
local v_u_6 = require(script.CategoryButtons)
local v_u_7 = require(script.Sections)
local v_u_8 = require(script.RobuxButton)
require(script.Types)
return {
    ["bootstrap"] = function(p9)
        -- upvalues: (copy) v_u_5, (ref) v_u_3, (copy) v_u_4, (copy) v_u_8, (copy) v_u_6, (copy) v_u_7
        local v10 = {
            ["OnActivated"] = function()
                -- upvalues: (ref) v_u_3, (ref) v_u_4
                v_u_3 = v_u_3 or v_u_4.GetController("InterfaceController")
                v_u_3:SelectLobbyMenu("Shop", true)
            end
        }
        v_u_5(p9.MenuFrame.BGFrame.CloseBtn)(v10)
        v_u_8.bootstrap(p9)
        v_u_6.bootstrap(p9)
        v_u_7.bootstrap(p9)
    end,
    ["scrollTo"] = function(p11)
        -- upvalues: (copy) v_u_7
        v_u_7.moveScrollingFrameTo(p11)
    end
}