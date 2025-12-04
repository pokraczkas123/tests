-- Decompiled game.ReplicatedFirst.Controllers.ChallengeController.Hint

local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("ReplicatedFirst")
local v_u_3 = nil
local v_u_4 = require(v1.Packages.Knit)
local v_u_5 = require(v2.Components.Button)
return function(p6)
    -- upvalues: (ref) v_u_3, (copy) v_u_4, (copy) v_u_5
    v_u_3 = v_u_3 or v_u_4.GetController("PromptController")
    local v7 = {
        ["OnActivated"] = function()
            -- upvalues: (ref) v_u_3
            v_u_3:Open({
                ["Header"] = "Challenge Mode",
                ["Body"] = "Win as many 1v1s as you can before you get 3 strikes! \n\tEach loss adds a strike. \n\tEarn a new reward for every win.",
                ["Option1"] = "OK",
                ["Option2"] = "BACK",
                ["Option1Visibility"] = false
            })
        end
    }
    v_u_5(p6.Component)(v7)
end