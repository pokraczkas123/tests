-- Decompiled game.ReplicatedFirst.Controllers.RankedRejoinController

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = nil
local v_u_3 = nil
local v_u_4 = nil
local v_u_5 = require(v1.Packages.Knit)
local v6 = v_u_5.CreateController({
    ["Name"] = "RankedRejoinController"
})
function v6.KnitStart(_)
    -- upvalues: (ref) v_u_2, (copy) v_u_5, (ref) v_u_3, (ref) v_u_4
    v_u_2 = v_u_5.GetService("RankedService")
    v_u_3 = v_u_5.GetController("PromptController")
    v_u_4 = v_u_5.GetService("StreakService")
    v_u_2.PromptRankedRejoin:Connect(function()
        -- upvalues: (ref) v_u_3, (ref) v_u_2, (ref) v_u_4
        v_u_3:Open({
            ["Header"] = "REJOIN RANKED?",
            ["Body"] = "You disconnected from an active ranked match. Do you want to rejoin?",
            ["Option1"] = "YES",
            ["Option2"] = "NO",
            ["Callback1"] = function()
                -- upvalues: (ref) v_u_2
                v_u_2:RejoinRankedGame()
            end,
            ["Callback2"] = function()
                -- upvalues: (ref) v_u_4
                v_u_4:RequestStreakBuyback()
            end
        })
    end)
end
return v6