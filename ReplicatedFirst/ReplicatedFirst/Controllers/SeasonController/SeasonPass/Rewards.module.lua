-- Decompiled game.ReplicatedFirst.Controllers.SeasonController.SeasonPass.Rewards

local v1 = game:GetService("ReplicatedFirst")
local v2 = game:GetService("ReplicatedStorage")
require(v2.Packages.Fusion)
local v_u_3 = require(v1.Components.FitScrollingFrame)
local v_u_4 = require(script.Reward)
return function(p5)
    -- upvalues: (copy) v_u_3, (copy) v_u_4
    v_u_3(p5.Component, Vector2.new(60, 0), Enum.SizeConstraint.RelativeXX)
    for v6 = 1, #p5.Season.Rewards.Regular do
        v_u_4({
            ["Component"] = p5.Component.Template:Clone(),
            ["Tier"] = v6,
            ["Parent"] = p5.Component,
            ["Seasonal"] = p5.Seasonal,
            ["Season"] = p5.Season,
            ["CurrentTier"] = p5.CurrentTier,
            ["SkipsVisible"] = p5.SkipsVisible
        })
    end
end