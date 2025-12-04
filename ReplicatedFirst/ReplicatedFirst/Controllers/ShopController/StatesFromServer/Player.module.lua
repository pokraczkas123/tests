-- Decompiled game.ReplicatedFirst.Controllers.ShopController.StatesFromServer.Player

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = nil
local v_u_3 = require(v1.Packages.Knit)
require(v1.Packages.Fusion)
local v_u_4 = require(v1.Common.State)
require(script.Parent.Parent.MenuFrame.Types)
return function()
    -- upvalues: (ref) v_u_2, (copy) v_u_3, (copy) v_u_4
    v_u_2 = v_u_2 or v_u_3.GetController("InterfaceController")
    return {
        ["Level"] = v_u_2:BindToPlayerAttribute(v_u_4.getKey(v_u_4.Id.User, "Level"), 0),
        ["ArePaidRandomItemsRestricted"] = v_u_2.ArePaidRandomItemsRestricted
    }
end