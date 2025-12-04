-- Decompiled game.ReplicatedFirst.Controllers.ChallengeController.RewardsTrack

local v1 = game:GetService("ReplicatedStorage")
require(v1.Packages.Fusion)
local v_u_2 = require(v1.Content.ChallengeRewards)
local v_u_3 = require(script.ItemBtn)
return function(p4)
    -- upvalues: (copy) v_u_2, (copy) v_u_3
    local v5 = p4.Component.ScrollingFrame.Template
    for v6 = 1, v_u_2.MaxLevel do
        v_u_3({
            ["Component"] = v5:Clone(),
            ["ChallengesData"] = p4.ChallengesData,
            ["LevelIndex"] = v6
        }).Parent = p4.Component.ScrollingFrame
    end
end