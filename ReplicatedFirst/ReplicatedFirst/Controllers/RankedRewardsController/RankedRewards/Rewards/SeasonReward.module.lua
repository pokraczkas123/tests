-- Decompiled game.ReplicatedFirst.Controllers.RankedRewardsController.RankedRewards.Rewards.SeasonReward

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Packages.Fusion)
local v_u_3 = require(v1.Content.Reward)
local v_u_4 = require(v1.Configuration.Ranks)
return function(p5, p_u_6)
    -- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_3
    local v7 = p5.Template
    if not p_u_6.Reward then
        v7.Visible = false
    end
    v_u_2.Hydrate(v7.EligibilityStatus)({
        ["Text"] = v_u_2.Computed(function()
            -- upvalues: (copy) p_u_6, (ref) v_u_4
            return (p_u_6.CurrentRank:get() or v_u_4.Type.Unranked) >= p_u_6.Rank and "UNLOCKS AT SEASON END" or "RANK UP TO UNLOCK"
        end),
        ["TextColor3"] = v_u_2.Computed(function()
            -- upvalues: (copy) p_u_6, (ref) v_u_4
            if (p_u_6.CurrentRank:get() or v_u_4.Type.Unranked) >= p_u_6.Rank then
                return Color3.fromRGB(0, 255, 0)
            else
                return Color3.fromRGB(255, 37, 37)
            end
        end)
    })
    v_u_2.Hydrate(v7.UIStroke.UIGradient)({
        ["Color"] = v_u_2.Computed(function()
            -- upvalues: (copy) p_u_6, (ref) v_u_4
            local v8 = (p_u_6.CurrentRank:get() or v_u_4.Type.Unranked) >= p_u_6.Rank
            return ColorSequence.new(Color3.fromHex("#4a00ba"), Color3.fromHex(v8 and "#2ffe00" or "#fe0087"))
        end)
    })
    v_u_3.setIcon(p_u_6.Reward, v7.Icon)
end