-- Decompiled game.ReplicatedFirst.Controllers.RankedRewardsController.RankedRewards.Bar

local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Packages.Fusion)
local v_u_4 = require(v2.Tools.Utility).getHeadshot
local v_u_5 = require(v2.Configuration.Ranks)
return function(p6, p_u_7)
    -- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_4, (copy) v_u_1
    local v8 = p6.BGFrame.Body.ScrollingFrame.Container.Bar
    local v9 = p6.BGFrame.Body.ScrollingFrame.Container.PlayerIcon
    v_u_3.Hydrate(v8.Pointer)({
        ["Visible"] = v_u_3.Computed(function()
            -- upvalues: (copy) p_u_7, (ref) v_u_5
            return p_u_7.CurrentRank:get() > v_u_5.Type.Unranked
        end),
        ["Position"] = v_u_3.Computed(function()
            -- upvalues: (copy) p_u_7
            return UDim2.fromScale(p_u_7.Progress:get(), 5.644)
        end)
    })
    v_u_3.Hydrate(v9)({
        ["Visible"] = v_u_3.Computed(function()
            -- upvalues: (copy) p_u_7, (ref) v_u_5
            return p_u_7.CurrentRank:get() > v_u_5.Type.Unranked
        end),
        ["Image"] = v_u_4(v_u_1.LocalPlayer),
        ["Position"] = v_u_3.Computed(function()
            -- upvalues: (copy) p_u_7
            return UDim2.fromScale(p_u_7.Progress:get(), 0.333)
        end)
    })
    v_u_3.Hydrate(v8.Fill)({
        ["Size"] = v_u_3.Computed(function()
            -- upvalues: (copy) p_u_7
            return UDim2.fromScale(p_u_7.Progress:get(), 1)
        end)
    })
end