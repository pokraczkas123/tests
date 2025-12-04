-- Decompiled game.ReplicatedStorage.Content.Mastery.Entities.Hakka.OnAquired

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = nil
local v_u_3 = require(v1.Packages.Knit)
return function(p4)
    -- upvalues: (ref) v_u_2, (copy) v_u_3
    v_u_2 = v_u_2 or v_u_3.GetService("PlayerCardService")
    v_u_2:GivePlayerCard(p4, "HakkaOnePlayerCard")
end