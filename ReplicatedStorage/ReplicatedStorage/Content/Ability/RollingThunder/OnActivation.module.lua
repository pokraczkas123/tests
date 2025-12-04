-- Decompiled game.ReplicatedStorage.Content.Ability.RollingThunder.OnActivation

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = nil
local v_u_3 = require(v1.Packages.Knit)
return function(_, p4)
    -- upvalues: (ref) v_u_2, (copy) v_u_3
    v_u_2 = v_u_2 or v_u_3.GetService("GameService")
    v_u_2.Client.Effect:FireAll("RollingThunder", {
        ["IsModuleEffect"] = true,
        ["Character"] = p4.Character
    })
    v_u_2.Client.Sound:FireAll("RollingThunder", {
        ["Parent"] = p4.Character.PrimaryPart
    })
end