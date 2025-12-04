-- Decompiled game.ReplicatedFirst.Controllers.MatchmakingController.ServerRetryVote

local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("ReplicatedFirst")
local v_u_3 = require(v1.Packages.Knit)
local v_u_4 = require(v1.Packages.Fusion)
local v_u_5 = require(v2.Components.Button)
return function(p_u_6)
    -- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
    local v_u_7 = v_u_3.GetService("RankedService")
    v_u_4.Hydrate(p_u_6.Component.AcceptButton.Action)({
        ["Text"] = v_u_4.Computed(function()
            -- upvalues: (copy) p_u_6
            return ("Yes: %* / %*"):format(p_u_6.VoteData:get().Votes, p_u_6.AmountNeeded)
        end)
    })
    v_u_4.Hydrate(p_u_6.Component.DenyButton.Action)({
        ["Text"] = v_u_4.Computed(function()
            -- upvalues: (copy) p_u_6
            return ("No: %*"):format(p_u_6.VoteData:get().TotalVotes - p_u_6.VoteData:get().Votes)
        end)
    })
    v_u_5(p_u_6.Component.AcceptButton)({
        ["OnActivated"] = function()
            -- upvalues: (copy) v_u_7
            v_u_7:RetryServerVote(true)
        end
    })
    v_u_5(p_u_6.Component.DenyButton)({
        ["OnActivated"] = function()
            -- upvalues: (copy) v_u_7
            v_u_7:RetryServerVote(false)
        end
    })
    v_u_4.Hydrate(p_u_6.Component)({
        ["Visible"] = p_u_6.ActiveVote
    })
end