-- Decompiled game.ReplicatedFirst.Controllers.LeaderboardRewardsController

local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedFirst")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = nil
local v_u_5 = nil
local v_u_6 = require(script.ItemDisplay)
local v_u_7 = require(v3.Packages.Knit)
local v_u_8 = require(v3.Content.Season)
local v_u_9 = require(v3.Packages.Fusion)
local v_u_10 = require(v2.Components.Button)
local v_u_11 = require(v3.Tools.Utility).applyToAllTagged
local v_u_12 = require(v2.Components.FitScrollingFrame)
local v_u_13 = require(v3.Content.LeaderboardReward)
local v14 = v_u_7.CreateController({
    ["Name"] = "LeaderboardRewardsController",
    ["Player"] = v1.LocalPlayer
})
function v14.KnitStart(p15)
    -- upvalues: (ref) v_u_4, (copy) v_u_7, (ref) v_u_5, (copy) v_u_8
    v_u_4 = v_u_7.GetController("InterfaceController")
    v_u_5 = v_u_7.GetService("LeaderboardRewardService")
    if not v_u_4.IsMatchmaking then
        p15.CurrentRankings = p15:BindToCurrentRankings()
        p15.CurrentLeaderboard = p15:BindToPrompts()
        local v16 = v_u_8.getCurrent().Id
        local v17 = tonumber(v16) - 1
        p15.TargetSeason = tostring(v17)
        p15.SeasonEndDate = DateTime.fromUnixTimestamp(v_u_8.get(p15.TargetSeason).Timestamp.End):FormatUniversalTime("MMMM D", "en-us")
        p15:LoadComponent()
    end
end
function v14.BindToCurrentRankings(_)
    -- upvalues: (copy) v_u_9, (ref) v_u_5
    local v_u_18 = v_u_9.Value({})
    v_u_5.Rankings:Observe(function(p19)
        -- upvalues: (copy) v_u_18
        v_u_18:set(p19)
    end)
    return v_u_18
end
function v14.BindToPrompts(_)
    -- upvalues: (copy) v_u_9, (copy) v_u_11, (ref) v_u_4
    local v_u_20 = v_u_9.Value("Twos")
    v_u_11("LeaderboardPrompt", function(p21)
        -- upvalues: (copy) v_u_20, (ref) v_u_4
        local v_u_22 = p21:GetAttribute("Menu")
        local v_u_23 = Instance.new("ProximityPrompt")
        v_u_23.RequiresLineOfSight = false
        v_u_23.KeyboardKeyCode = Enum.KeyCode.E
        v_u_23.GamepadKeyCode = Enum.KeyCode.ButtonX
        v_u_23.UIOffset = Vector2.new(0, -60)
        v_u_23.ObjectText = p21:GetAttribute("ObjectText")
        v_u_23.ActionText = p21:GetAttribute("ActionText")
        v_u_23.MaxActivationDistance = p21:GetAttribute("MaxActivationDistance") or 30
        v_u_23.Triggered:Connect(function()
            -- upvalues: (ref) v_u_20, (copy) v_u_23, (ref) v_u_4, (copy) v_u_22
            v_u_20:set(v_u_23.Parent.Parent:GetAttribute("Leaderboard"))
            v_u_4:SelectLobbyMenu(v_u_22, true)
        end)
        v_u_23.Parent = p21.PrimaryPart
    end)
    return v_u_20
end
function v14.LoadComponent(p_u_24)
    -- upvalues: (ref) v_u_4, (copy) v_u_10, (copy) v_u_9, (copy) v_u_13, (copy) v_u_12, (copy) v_u_6
    local v_u_25 = v_u_4.App.Lobby.LeaderboardRewards
    local v26 = {
        ["OnActivated"] = function()
            -- upvalues: (ref) v_u_4
            v_u_4:SelectLobbyMenu("")
        end
    }
    v_u_10(v_u_25.BGFrame.CloseBtn)(v26)
    v_u_9.Hydrate(v_u_25.BGFrame.Body.Hint)({
        ["Text"] = v_u_9.Computed(function()
            -- upvalues: (ref) v_u_13, (copy) p_u_24
            local v27 = v_u_13.Replacements[p_u_24.CurrentLeaderboard:get() or ""] or ""
            return ("Season %* %* Rewards!  |  Season ended on %*"):format(p_u_24.TargetSeason, v_u_13.Replacements[v27] or "", p_u_24.SeasonEndDate)
        end)
    })
    v_u_12(v_u_25.BGFrame.Body.List)
    v_u_9.Hydrate(v_u_25.BGFrame.Body.List)({
        [v_u_9.Children] = v_u_9.Computed(function()
            -- upvalues: (ref) v_u_13, (copy) p_u_24, (ref) v_u_6, (copy) v_u_25
            local v28 = v_u_13.get(p_u_24.CurrentLeaderboard:get() or "", p_u_24.TargetSeason)
            local v29 = {}
            if not v28 then
                return {}
            end
            for v30, v31 in pairs(v28) do
                local v32 = v_u_6
                local v33 = {
                    ["Template"] = v_u_25.BGFrame.Body.List.RewardTemp:Clone(),
                    ["Rewards"] = v31,
                    ["Number"] = v30,
                    ["Season"] = p_u_24.TargetSeason,
                    ["CurrentLeaderboard"] = p_u_24.CurrentLeaderboard,
                    ["CurrentRankings"] = p_u_24.CurrentRankings
                }
                table.insert(v29, v32(v33))
            end
            return v29
        end, v_u_9.cleanup)
    })
end
return v14