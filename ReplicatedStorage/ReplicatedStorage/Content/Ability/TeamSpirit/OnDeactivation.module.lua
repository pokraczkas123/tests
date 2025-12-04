-- Decompiled game.ReplicatedStorage.Content.Ability.TeamSpirit.OnDeactivation

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = nil
local v_u_3 = nil
require(script.Parent.Parent)
local v_u_4 = require(v1.Packages.Knit)
return function(p5, p6)
    -- upvalues: (ref) v_u_3, (copy) v_u_4, (ref) v_u_2
    v_u_3 = v_u_3 or v_u_4.GetService("GameService")
    v_u_2 = v_u_2 or v_u_4.GetService("MultiplierService")
    local v7 = p6.Team
    for _, v8 in not v7 and { p6 } or v7:GetPlayers() do
        v_u_2:Remove(v8, "Speed", p5.Id)
        v_u_3.Client.Sound:FireAll("SpeedupDeactiveVer2", {
            ["Parent"] = v8.Character.PrimaryPart
        })
    end
end