-- Decompiled game.ReplicatedFirst.Controllers.MasteryController.CompletedNotif.CompletedNotif.story

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Packages.Maid)
local v_u_3 = require(v1.Tools.FusionControls)
local v_u_4 = require(v1.Content.Mastery)
local v_u_5 = require(v1.Content.Style)
local v_u_6 = require(script.Parent)
local v15 = {
    ["name"] = "MainShopFrame",
    ["controls"] = {
        ["Scale"] = 1,
        ["FlashFactor"] = 0,
        ["RevealFactor"] = 0,
        ["RewardTextFactor"] = 0,
        ["FadeFactor"] = 0,
        ["RewardFactor"] = 0
    },
    ["render"] = function(p7)
        -- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_6, (copy) v_u_4, (copy) v_u_5
        local v_u_8 = v_u_2.new()
        local v9, v10 = v_u_3(p7)
        v_u_8:GiveTask(v10)
        local v11 = {
            ["Flash"] = v9.FlashFactor,
            ["Reward"] = v9.RewardFactor,
            ["Reveal"] = v9.RevealFactor,
            ["RewardText"] = v9.RewardTextFactor,
            ["Fade"] = v9.FadeFactor
        }
        local v12 = v_u_6.player(v11)
        v_u_8:GiveTask(v12)
        local v13 = v_u_6.frame
        local v14 = {
            ["Parent"] = p7.target,
            ["Controls"] = {
                ["Scale"] = v9.Scale,
                ["Factors"] = v12.Factors
            },
            ["DisplayData"] = v_u_6.displayDataFromStyleProps({
                ["Mastery"] = v_u_4:Get("Hidari"),
                ["Style"] = v_u_5:Get("Hidari"),
                ["PrevLevel"] = 5
            })
        }
        v_u_8:GiveTask(v13(v14))
        v12.Play()
        return function()
            -- upvalues: (copy) v_u_8
            v_u_8:Destroy()
        end
    end
}
return v15