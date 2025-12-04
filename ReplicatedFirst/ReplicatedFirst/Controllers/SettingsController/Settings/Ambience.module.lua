-- Decompiled game.ReplicatedFirst.Controllers.SettingsController.Settings.Ambience

local v_u_1 = game:GetService("SoundService"):WaitForChild("Ambience")
return function(p2)
    -- upvalues: (copy) v_u_1
    v_u_1.Volume = p2 and 0.5 or 0
end