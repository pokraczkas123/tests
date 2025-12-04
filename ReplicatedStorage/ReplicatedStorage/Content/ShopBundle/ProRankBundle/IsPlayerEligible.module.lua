-- Decompiled game.ReplicatedStorage.Content.ShopBundle.ProRankBundle.IsPlayerEligible

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = nil
local v_u_3 = nil
local v_u_4 = require(v1.Packages.Knit)
local v_u_5 = require(v1.Configuration.Ranks)
return function(p6)
    -- upvalues: (ref) v_u_2, (copy) v_u_4, (ref) v_u_3, (copy) v_u_5
    v_u_2 = v_u_2 or v_u_4.GetService("DataService")
    v_u_3 = v_u_3 or v_u_4.GetService("PlayFabMatchmakingService")
    local v7 = v_u_3.SeasonId
    local v8 = v_u_2:Get(p6, "Seasonal")[v7]
    if not v8 then
        return false
    end
    local v9 = v8[v7]
    if not v9 then
        return false
    end
    local v10 = v_u_5.Type.Pro * v_u_5.EloPerRank
    for _, v11 in v9.Ranked do
        if v10 < v11.Elo then
            return true
        end
    end
    return false
end