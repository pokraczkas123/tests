-- Decompiled game.ReplicatedFirst.Controllers.RankedRewardsController

local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = nil
local v_u_4 = require(v2.Packages.Knit)
local v_u_5 = require(v2.Packages.Fusion)
local v_u_6 = require(v2.Configuration.Matchmaking)
local v_u_7 = require(script.RankedRewards)
local v8 = v_u_4.CreateController({
    ["Name"] = "RankedRewardsController",
    ["Player"] = v1.LocalPlayer
})
function v8.KnitStart(p9)
    -- upvalues: (ref) v_u_3, (copy) v_u_4
    v_u_3 = v_u_4.GetController("InterfaceController")
    if not v_u_3.IsMatchmaking then
        p9.HighestQueueData = p9:BindToHighestQueueData()
        p9.Component = p9:LoadComponent()
    end
end
function v8.BindToHighestQueueData(_)
    -- upvalues: (copy) v_u_5, (ref) v_u_3, (copy) v_u_6
    return v_u_5.Computed(function()
        -- upvalues: (ref) v_u_3, (ref) v_u_6
        local v10 = 0
        local v11 = 0
        for _, v12 in v_u_3.Ranked:get() do
            if v10 < (v12.Elo or 0) and (v12.Games or 0) >= v_u_6.PlacementMatches then
                local v13 = v12.Elo or 0
                v10 = math.max(v10, v13)
                v11 = v12.Games or 0
            end
        end
        return {
            ["Elo"] = v10,
            ["IsPlacement"] = v11 < v_u_6.PlacementMatches
        }
    end)
end
function v8.LoadComponent(p14)
    -- upvalues: (ref) v_u_3, (copy) v_u_7
    local v15 = v_u_3.App.Lobby.RankedRewards
    v_u_7(v15, {
        ["HighestQueueData"] = p14.HighestQueueData
    })
    return v15
end
return v8