-- Decompiled game.ReplicatedFirst.Controllers.RankedRewardsController.RankedRewards.Rewards

local v1 = game:GetService("ReplicatedStorage")
require(v1.Packages.Fusion)
local v_u_2 = require(v1.Configuration.Ranks)
require(v1.Content.Season)
require(v1.Content.Reward)
local v_u_3 = require(script.MilestoneReward)
local v_u_4 = require(script.SeasonReward)
return function(p5, p6)
    -- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_3
    if p6.Season and p6.Season:IsLive() then
        for v7 = v_u_2.Type.Bronze1, v_u_2.Type.Pro do
            local v8 = p6.Season.RankedRewards[v7]
            local v9 = p5[v7]
            if v8 then
                if v7 % 3 == 0 then
                    v_u_4(v9, {
                        ["CurrentRank"] = p6.Rank,
                        ["Reward"] = v8,
                        ["Rank"] = v7
                    })
                else
                    v_u_3(v9, {
                        ["CurrentRank"] = p6.Rank,
                        ["Reward"] = v8,
                        ["Rank"] = v7,
                        ["ClaimedRewards"] = p6.ClaimedRewards
                    })
                end
            else
                v9.Visible = false
            end
        end
    else
        p5.Visible = false
    end
end