-- Decompiled game.ReplicatedFirst.Controllers.SettingsController.Settings.Haptics

local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Common.State)
return function(p4)
    -- upvalues: (copy) v_u_3, (copy) v_u_1
    v_u_3.set(v_u_1.LocalPlayer, v_u_3.Id.Settings, "Haptics", p4)
end