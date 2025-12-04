-- Decompiled game.ReplicatedFirst.Controllers.MatchmakingController

local v_u_1 = Color3.fromRGB(34, 255, 0)
local v_u_2 = Color3.fromRGB(255, 106, 0)
local v_u_3 = Color3.fromRGB(122, 122, 122)
local v_u_4 = game:GetService("Players")
local v5 = game:GetService("ReplicatedFirst")
local v_u_6 = game:GetService("ReplicatedStorage")
local v_u_7 = nil
local v_u_8 = nil
local v_u_9 = nil
local v_u_10 = nil
local v_u_11 = nil
local v_u_12 = require(v_u_6.Packages.Knit)
local v_u_13 = require(v_u_6.Packages.Fusion)
local v_u_14 = require(v_u_6.Tools.Time)
local v_u_15 = require(v5.Components.Button)
local v_u_16 = require(v_u_6.Tools.Sound)
local v_u_17 = require(v_u_6.Tools.Utility).getHeadshot
local v_u_18 = require(v_u_6.Configuration.Matchmaking)
local v_u_19 = require(v_u_6.Configuration.Game)
local v_u_20 = require(v_u_6.Configuration.Place)()
local v_u_21 = require(script.ServerRetryVote)
local v22 = v_u_12.CreateController({
    ["Name"] = "MatchmakingController"
})
function v22.KnitStart(p23)
    -- upvalues: (ref) v_u_7, (copy) v_u_12, (ref) v_u_8, (ref) v_u_9, (ref) v_u_10, (ref) v_u_11
    v_u_7 = v_u_12.GetService("PlayFabMatchmakingService")
    v_u_8 = v_u_12.GetController("InterfaceController")
    v_u_9 = v_u_12.GetController("GameController")
    v_u_10 = v_u_12.GetService("GameService")
    v_u_11 = v_u_12.GetService("RankedService")
    p23.IsMatchmaking = p23:BindToMatchmakingState()
    p23.Timer = p23:BindToTimer()
    p23.IsMatchFound = p23:BindToMatchFound()
    p23.RoundState = p23:BindToRoundState()
    p23.RankedQueue = v_u_8:BindToPlayerAttribute("RankedGameMode")
    p23.Component = p23:LoadComponent()
    p23.Teammates = p23:BindToTeamates()
    p23:BindToServerRetryVote()
end
function v22.BindToMatchmakingState(_)
    -- upvalues: (copy) v_u_13, (ref) v_u_7, (copy) v_u_16, (ref) v_u_9
    local v_u_24 = v_u_13.Value(false)
    v_u_7.JoinedQueue:Connect(function()
        -- upvalues: (copy) v_u_24, (ref) v_u_16
        v_u_24:set(true)
        v_u_16.fromName("Queue_Join")({})
    end)
    v_u_7.LeftQueue:Connect(function(p25)
        -- upvalues: (copy) v_u_24, (ref) v_u_9
        v_u_24:set(false)
        v_u_9:Notify({
            ["Body"] = ("Left matchmaking queue%* "):format(not p25 and "" or (": %*"):format(p25))
        })
    end)
    return v_u_24
end
function v22.BindToTimer(p26)
    -- upvalues: (copy) v_u_13
    local v_u_27 = v_u_13.Value(0)
    local v28 = v_u_13.Observer(p26.IsMatchmaking)
    v28:onChange(function()
        -- upvalues: (copy) v_u_27
        v_u_27:set(game.Workspace:GetServerTimeNow())
    end)
    v28:update()
    return v_u_27
end
function v22.BindToMatchFound(_)
    -- upvalues: (copy) v_u_13, (ref) v_u_7, (copy) v_u_16
    local v_u_29 = v_u_13.Value(false)
    v_u_7.OnMatchFound:Connect(function()
        -- upvalues: (ref) v_u_16, (copy) v_u_29
        v_u_16.fromName("Queue_Match_Found")({})
        v_u_29:set(true)
    end)
    return v_u_29
end
function v22.BindToRoundState(_)
    -- upvalues: (copy) v_u_13, (copy) v_u_6
    local v_u_30 = v_u_13.Value(v_u_6:GetAttribute("RoundState"))
    v_u_6:GetAttributeChangedSignal("RoundState"):Connect(function()
        -- upvalues: (copy) v_u_30, (ref) v_u_6
        v_u_30:set(v_u_6:GetAttribute("RoundState"))
    end)
    return v_u_30
end
function v22.BindToTeamates(p_u_31)
    -- upvalues: (ref) v_u_10, (copy) v_u_4, (copy) v_u_17, (copy) v_u_3, (copy) v_u_13, (copy) v_u_18
    v_u_10.GameEnded:Connect(function(p32)
        -- upvalues: (copy) p_u_31, (ref) v_u_4, (ref) v_u_17, (ref) v_u_3, (ref) v_u_13, (ref) v_u_18
        if p32.Teammates then
            for v33, v34 in p32.Teammates do
                local v35 = p_u_31.Component.PlayerList.Template:Clone()
                local v36 = v_u_4:GetPlayerByUserId(v34.UserId)
                v35.Image = v_u_17(v34.UserId)
                v35.LayoutOrder = v33
                v35.Name = v34.UserId
                v35.Visible = true
                v35.Parent = p_u_31.Component.PlayerList
                if v36 then
                    local v_u_37 = p_u_31:BindToPlayerRequeued(v36)
                    v_u_13.Hydrate(v35.UIStroke)({
                        ["Enabled"] = v_u_13.Computed(function()
                            -- upvalues: (copy) v_u_37
                            return v_u_37:get()
                        end)
                    })
                    v_u_13.Hydrate(v35.Tick)({
                        ["Visible"] = v_u_13.Computed(function()
                            -- upvalues: (copy) v_u_37
                            return v_u_37:get()
                        end)
                    })
                else
                    v35.ImageColor3 = v_u_3
                end
            end
            p_u_31.Timer:set(game.Workspace:GetServerTimeNow() + v_u_18.TimeTillRequeue)
            v_u_4.PlayerRemoving:Connect(function(p38)
                -- upvalues: (ref) p_u_31, (ref) v_u_3
                local v39 = p_u_31.Component.PlayerList
                local v40 = p38.UserId
                local v41 = v39:FindFirstChild((tostring(v40)))
                if v41 then
                    v41.ImageColor3 = v_u_3
                end
            end)
        end
    end)
end
function v22.BindToPlayerRequeued(_, p_u_42)
    -- upvalues: (copy) v_u_13
    local v_u_43 = v_u_13.Value(p_u_42:GetAttribute("IsRequeued"))
    p_u_42:GetAttributeChangedSignal("IsRequeued"):Connect(function()
        -- upvalues: (copy) v_u_43, (copy) p_u_42
        v_u_43:set(p_u_42:GetAttribute("IsRequeued"))
    end)
    return v_u_43
end
function v22.BindToServerRetryVote(_)
    -- upvalues: (copy) v_u_13, (ref) v_u_11, (copy) v_u_21, (ref) v_u_8
    local v_u_44 = v_u_13.Value(v_u_11.RetryServerVotes:Get())
    local v_u_45 = v_u_13.Value(false)
    v_u_11.PromptRankedServerRetryVote:Connect(function(p46)
        -- upvalues: (copy) v_u_45, (ref) v_u_21, (ref) v_u_8, (copy) v_u_44
        if p46 then
            v_u_45:set(true)
            v_u_21({
                ["Component"] = v_u_8.App.Game.RetryServerVote,
                ["AmountNeeded"] = p46,
                ["VoteData"] = v_u_44,
                ["ActiveVote"] = v_u_45
            })
        else
            v_u_45:set(false)
        end
    end)
    v_u_11.RetryServerVotes:Observe(function(p47)
        -- upvalues: (copy) v_u_44
        v_u_44:set(p47)
    end)
end
function v22.LoadComponent(p_u_48)
    -- upvalues: (ref) v_u_8, (copy) v_u_13, (copy) v_u_19, (copy) v_u_20, (copy) v_u_14, (copy) v_u_1, (copy) v_u_2, (copy) v_u_18, (copy) v_u_15, (ref) v_u_7
    local v49 = v_u_8.App.Matchmaking
    v_u_13.Hydrate(v49)({
        ["Visible"] = v_u_13.Computed(function()
            -- upvalues: (copy) p_u_48, (ref) v_u_19, (ref) v_u_20, (ref) v_u_8
            local v50 = p_u_48.IsMatchmaking:get()
            if not v50 then
                if p_u_48.RoundState:get() == v_u_19.State.End and v_u_20.Current == v_u_20.Pro then
                    v50 = not v_u_8.InGame:get()
                else
                    v50 = false
                end
            end
            return v50
        end)
    })
    v_u_13.Hydrate(v49.Timer)({
        ["Text"] = v_u_13.Computed(function()
            -- upvalues: (ref) v_u_14, (ref) v_u_8, (copy) p_u_48
            local v51 = v_u_14.format
            local v52 = v_u_8.DynamicTimestamp:get() - p_u_48.Timer:get()
            local v53 = math.abs(v52)
            return v51(math.floor(v53), "mm:ss")
        end),
        ["TextColor3"] = v_u_13.Computed(function()
            -- upvalues: (copy) p_u_48, (ref) v_u_1, (ref) v_u_2
            if p_u_48.IsMatchFound:get() then
                return v_u_1
            else
                return v_u_2
            end
        end)
    })
    v_u_13.Hydrate(v49.Info.Searching)({
        ["Text"] = v_u_13.Computed(function()
            -- upvalues: (copy) p_u_48
            return p_u_48.IsMatchFound:get() and "Match found!" or "Searching For Match..."
        end),
        ["TextColor3"] = v_u_13.Computed(function()
            -- upvalues: (copy) p_u_48, (ref) v_u_1, (ref) v_u_2
            if p_u_48.IsMatchFound:get() then
                return v_u_1
            else
                return v_u_2
            end
        end)
    })
    v_u_13.Hydrate(v49.Info.Icon)({
        ["Image"] = v_u_13.Computed(function()
            -- upvalues: (copy) p_u_48
            return p_u_48.IsMatchFound:get() and "rbxassetid://100456108320691" or "rbxassetid://77630955654393"
        end)
    })
    v_u_13.Hydrate(v49.Info.GameType)({
        ["Text"] = v_u_13.Computed(function()
            -- upvalues: (copy) p_u_48, (ref) v_u_18
            return p_u_48.RankedQueue:get() == nil and "" or ("Ranked %*"):format(v_u_18.Data[p_u_48.RankedQueue:get()].DisplayName)
        end)
    })
    v_u_13.Hydrate(v49.UIStroke)({
        ["Color"] = v_u_13.Computed(function()
            -- upvalues: (copy) p_u_48, (ref) v_u_1, (ref) v_u_2
            if p_u_48.IsMatchFound:get() then
                return v_u_1
            else
                return v_u_2
            end
        end)
    })
    local v54 = {
        ["OnActivated"] = function()
            -- upvalues: (ref) v_u_7
            v_u_7:CancelMatchmaking()
        end
    }
    v_u_15(v49.Cancel)(v54)
    v_u_13.Hydrate(v49.Info)({
        ["Visible"] = v_u_13.Computed(function()
            -- upvalues: (copy) p_u_48
            return p_u_48.IsMatchFound:get() or p_u_48.IsMatchmaking:get()
        end)
    })
    v_u_13.Hydrate(v49.PlayerList)({
        ["Visible"] = v_u_13.Computed(function()
            -- upvalues: (copy) p_u_48, (ref) v_u_19, (ref) v_u_20
            local v55 = p_u_48.RoundState:get() == v_u_19.State.End and v_u_20.Current == v_u_20.Pro and not p_u_48.IsMatchmaking:get()
            if v55 then
                v55 = not p_u_48.IsMatchFound:get()
            end
            return v55
        end)
    })
    return v49
end
return v22