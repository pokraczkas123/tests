-- Decompiled game.ReplicatedStorage.Content.Ability.ShieldBreaker.PostAction

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = nil
local v_u_3 = nil
local v_u_4 = require(script.OnReceive)
require(script.Parent.Parent)
local v_u_5 = require(v1.Packages.Knit)
require(v1.Common.Context)
return function(p_u_6, p7)
    -- upvalues: (ref) v_u_2, (copy) v_u_5, (ref) v_u_3, (copy) v_u_4
    v_u_2 = v_u_2 or v_u_5.GetService("AbilityService")
    v_u_3 = v_u_3 or v_u_5.GetService("GameService")
    local v_u_8 = p7.Player.Team
    v_u_2.Client.AuraDelete:FireAll(p7.Player)
    v_u_3.Client.Effect:FireAll("CurveSpikeHit", {
        ["Character"] = p7.Player.Character,
        ["IsModuleEffect"] = true
    })
    p7.State.Ball.Timer = p_u_6.Metadata.Timer
    p7.State.Ball.Garbage = p7.State.Ball.Garbage or {}
    local v9 = p7.State.Ball.Garbage
    local function v11(p10)
        -- upvalues: (ref) v_u_4, (copy) p_u_6, (copy) v_u_8
        if p10 then
            v_u_4({
                ["Metadata"] = p_u_6.Metadata,
                ["Team"] = v_u_8
            }, p10)
        end
    end
    table.insert(v9, v11)
    return true
end