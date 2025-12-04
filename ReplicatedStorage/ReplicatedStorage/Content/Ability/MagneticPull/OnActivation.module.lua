-- Decompiled game.ReplicatedStorage.Content.Ability.MagneticPull.OnActivation

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = nil
local v_u_3 = nil
local v_u_4 = nil
require(script.Parent.Parent)
local v_u_5 = require(v_u_1.Packages.Knit)
local v_u_6 = require(v_u_1.Common.Physics)
local v_u_7 = require(v_u_1.Configuration.Place)()
return function(p8, p9)
    -- upvalues: (ref) v_u_2, (copy) v_u_5, (ref) v_u_3, (ref) v_u_4, (copy) v_u_1, (copy) v_u_6, (copy) v_u_7
    v_u_2 = v_u_2 or v_u_5.GetService("GameService")
    v_u_3 = v_u_3 or v_u_5.GetService("BallService")
    v_u_4 = v_u_4 or v_u_5.GetService("AbilityService")
    local v10 = p9.Character
    v_u_2.Client.Effect:FireAll("MagneticPull", {
        ["Character"] = p9.Character,
        ["IsModuleEffect"] = true,
        ["Props"] = {
            ["Duration"] = p8.Conditions.TimeActive + p8.Metadata.Lifetime,
            ["Range"] = p8.Metadata.Range
        }
    })
    local v11 = 0
    local v12 = nil
    local v13 = nil
    local v14 = nil
    while true do
        local v15
        if v11 >= p8.Conditions.TimeActive or not (p9 and v10 and v10.Parent) then
            v15 = v12
            break
        end
        v14 = v10:GetPivot().Position
        local v16 = v_u_1:GetAttribute("ServedByPlayer")
        if v_u_1:GetAttribute("ServedByTeam") == nil and (v16 == nil or v16 == p9.Name) and (p9.Team == nil or v_u_1:GetAttribute("LastHitter") ~= p9.Name or #p9.Team:GetPlayers() <= 1) then
            local v17 = (1 / 0)
            v15 = nil
            for _, v18 in pairs(v_u_3.Ball.Class.All) do
                local v19 = v18:GetCFrame().Position
                local v20 = (v14 - v19).Magnitude
                if p8.Metadata.Range >= v20 and v_u_6.isPointOnTeamSide(p9, v19) and v18:GetVelocity().Magnitude <= p8.Metadata.MaxBallGrabVelocity and v20 < v17 then
                    v13 = v19
                    v15 = v18
                    v17 = v20
                end
            end
            if v15 then
                break
            end
        end
        v11 = v11 + task.wait(0.1)
    end
    v_u_4.Client.AuraDelete:FireAll(p9)
    if v15 and v13 and v14 and v11 < p8.Conditions.TimeActive then
        v15.Timer = p8.Metadata.Lifetime
        v15:SetTarget({
            ["Goal"] = v10,
            ["MaxVelocity"] = p8.Metadata.MaxTargetVelocity,
            ["MaxAcceleration"] = p8.Metadata.MaxTargetAcceleration,
            ["Offset"] = Vector3.new(0, 2, -2)
        })
        if v_u_7.Current ~= v_u_7.Seasonal and v_u_7.Current ~= v_u_7.Training and v_u_1:GetAttribute("ServedByPlayer") ~= p9.Name then
            local v21 = v_u_1:GetAttribute("LastHitTeam") ~= p9.Team.Name
            v15.LastHitters = {}
            v_u_1:SetAttribute("PreviousHitter", v_u_1:GetAttribute("LastHitter"))
            v_u_1:SetAttribute("LastHitter", p9.Name)
            v_u_1:SetAttribute("LastHitTeam", p9.Team.Name)
            v_u_1:SetAttribute("LastHitTimestamp", workspace:GetServerTimeNow())
            v_u_1:SetAttribute("LastHitPosition", v13)
            v_u_1:SetAttribute("TeamHitStreak", v21 and 0 or v_u_1:GetAttribute("TeamHitStreak") or 0)
            if v21 or (v_u_1:GetAttribute("TeamHitStreak") or 0) < 3 then
                v_u_1:SetAttribute("HitBypass", p9.Name)
            end
        end
    end
end