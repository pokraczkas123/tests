-- Decompiled game.ReplicatedFirst.Controllers.ShopController.StatesFromServer.Statistics

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = nil
local v_u_3 = require(v1.Packages.Knit)
local v_u_4 = require(v1.Packages.Fusion)
require(script.Parent.Parent.MenuFrame.Types)
return function()
    -- upvalues: (ref) v_u_2, (copy) v_u_3, (copy) v_u_4
    v_u_2 = v_u_2 or v_u_3.GetService("DataService")
    local v_u_5 = {
        ["PremiumCurrency"] = v_u_4.Value(0)
    }
    v_u_2.ProfileUpdated:Connect(function(p6, p7)
        -- upvalues: (copy) v_u_5
        if p6 == "Statistics" then
            v_u_5.PremiumCurrency:set(p7.PremiumCurrency)
        end
    end)
    task.defer(function()
        -- upvalues: (ref) v_u_2, (copy) v_u_5
        local v8 = v_u_2:Get("Statistics"):expect()
        v_u_5.PremiumCurrency:set(v8.PremiumCurrency)
    end)
    return v_u_5
end