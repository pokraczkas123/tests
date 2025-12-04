-- Decompiled game.ReplicatedFirst.Controllers.LevelRewardsController

local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedFirst")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = nil
local v_u_5 = nil
local v_u_6 = nil
local v_u_7 = nil
local v_u_8 = require(v2.Components.FitScrollingFrame)
local v_u_9 = require(v3.Configuration.Game)
local v_u_10 = require(v3.Content.Level)
local v_u_11 = require(v3.Packages.Fusion)
local v_u_12 = require(v2.Components.Button)
local v_u_13 = require(v3.Content.Reward)
local v_u_14 = require(v3.Tools.Number)
local v_u_15 = require(v3.Common.State)
local v_u_16 = require(v3.Packages.Knit)
local v_u_17 = require(v3.Tools.Sound)
local v_u_18 = require(v3.Content.Item)
local v_u_19 = require(script.LevelDisplay)
local v20 = v_u_16.CreateController({
    ["Name"] = "LevelRewardsController",
    ["Player"] = v1.LocalPlayer
})
function v20.KnitStart(p21)
    -- upvalues: (ref) v_u_4, (copy) v_u_16, (ref) v_u_5, (ref) v_u_6, (ref) v_u_7, (copy) v_u_10, (copy) v_u_11, (copy) v_u_15
    v_u_4 = v_u_16.GetController("InterfaceController")
    v_u_5 = v_u_16.GetService("LevelService")
    v_u_6 = v_u_16.GetService("DataService")
    v_u_7 = v_u_16.GetController("GameController")
    if not v_u_4.IsMatchmaking then
        p21.Rewards = v_u_10.getRewards()
        p21.Experience = v_u_4.Experience
        p21.CurrentPage = v_u_11.Value(1)
        p21.ClientLevelRewardsClaimed = v_u_11.Value(0)
        p21.LevelRewardsClaimed = p21:BindToClaimedLevelRewardsChange()
        p21.Level = v_u_4:BindToPlayerAttribute(v_u_15.getKey(v_u_15.Id.User, "Level"))
        p21.IsBusy = v_u_11.Value(false)
        p21.Component = p21:LoadComponent()
    end
end
function v20.UpdateClientRewards(p22)
    -- upvalues: (copy) v_u_17, (copy) v_u_13, (copy) v_u_18, (ref) v_u_7, (copy) v_u_14, (copy) v_u_9
    local v23 = p22.LevelRewardsClaimed:get()
    local v24 = #p22.Rewards
    local v25 = math.min(v23, v24)
    local v26 = p22.ClientLevelRewardsClaimed:get()
    local v27 = #p22.Rewards
    local v28 = math.min(v26, v27)
    for v29 = 1, v25 - v28 do
        local v30 = v28 + v29
        local v31 = p22.Rewards[v30]
        p22.ClientLevelRewardsClaimed:set(v30)
        v_u_17.fromName("LevelUpReward")({})
        if v31 then
            local v32
            if v31.Type == v_u_13.Type.Item then
                v32 = v_u_18:Get(v31.Value)
            else
                v32 = nil
            end
            local v33 = v_u_7
            local v34 = {}
            local v35 = "+ %* %*"
            local v36
            if v32 then
                v36 = v32.DisplayName
            else
                local v37 = v31.Value
                if typeof(v37) == "number" then
                    v36 = v_u_14.format(v31.Value)
                else
                    v36 = v31.Value
                end
            end
            v34.Body = v35:format(v36, (v_u_13.getString(v31)))
            v34.Color = v_u_9.Notification.Color.Blue
            v33:Notify(v34)
        end
        task.wait(0.2)
    end
end
function v20.BindToClaimedLevelRewardsChange(p_u_38)
    -- upvalues: (copy) v_u_11, (ref) v_u_6
    local v_u_39 = v_u_11.Value(v_u_6:Get("Statistics"):expect().LevelRewardsClaimed)
    v_u_6.ProfileUpdated:Connect(function(p40, p41)
        -- upvalues: (copy) v_u_39, (copy) p_u_38
        if p40 == "Statistics" then
            v_u_39:set(p41.LevelRewardsClaimed)
            p_u_38:UpdateClientRewards()
        end
    end)
    p_u_38.ClientLevelRewardsClaimed:set(v_u_39:get())
    return v_u_39
end
function v20.LoadComponent(p_u_42)
    -- upvalues: (ref) v_u_4, (copy) v_u_12, (copy) v_u_11, (copy) v_u_10, (copy) v_u_8, (copy) v_u_19, (ref) v_u_5
    local v_u_43 = v_u_4.App.Lobby.LevelRewards
    v_u_12(v_u_4.App.Stats.LeftSidePanel.PlayerLevelButton.LevelRewards)({
        ["OnActivated"] = function()
            -- upvalues: (ref) v_u_4
            v_u_4:SelectLobbyMenu("LevelRewards")
        end,
        ["Visible"] = v_u_11.Computed(function()
            -- upvalues: (copy) p_u_42
            local v44 = p_u_42.Level:get()
            local v45 = #p_u_42.Rewards
            return math.min(v44, v45) > p_u_42.ClientLevelRewardsClaimed:get()
        end)
    })
    v_u_11.Hydrate(v_u_4.App.Stats.LeftSidePanel.PlayerLevelButton.LevelRewards.Count.Amount)({
        ["Text"] = v_u_11.Computed(function()
            -- upvalues: (copy) p_u_42
            local v46 = p_u_42.Level:get()
            local v47 = #p_u_42.Rewards
            return math.min(v46, v47) - p_u_42.ClientLevelRewardsClaimed:get()
        end)
    })
    local v48 = {
        ["OnActivated"] = function()
            -- upvalues: (ref) v_u_4
            v_u_4:SelectLobbyMenu("")
        end
    }
    v_u_12(v_u_43.BGFrame.CloseBtn)(v48)
    v_u_11.Hydrate(v_u_43.BGFrame.Tabs.ScrollingFrame)({
        [v_u_11.Children] = v_u_11.Computed(function()
            -- upvalues: (ref) v_u_10, (ref) v_u_12, (copy) v_u_43, (copy) p_u_42
            local v49 = v_u_10.Amount / v_u_10.PageSize
            local v50 = {}
            for v_u_51 = 1, math.round(v49) do
                local v52 = {
                    ["OnActivated"] = function()
                        -- upvalues: (ref) p_u_42, (copy) v_u_51
                        p_u_42.CurrentPage:set(v_u_51)
                    end,
                    ["Visible"] = true
                }
                local v53 = v_u_12(v_u_43.BGFrame.Tabs.ScrollingFrame.PageBtn:Clone())(v52)
                v53.TextLabel.Text = v_u_10.PageSize * v_u_51 + 1 - v_u_10.PageSize .. "\226\172\134"
                table.insert(v50, v53)
            end
            return v50
        end, v_u_11.cleanup)
    })
    v_u_8(v_u_43.BGFrame.Tabs.ScrollingFrame, Vector2.new(30, 0), Enum.SizeConstraint.RelativeXX)
    v_u_19({
        ["Template"] = v_u_43.BGFrame.Body.Ranks.Template,
        ["Parent"] = v_u_43.BGFrame.Body.Ranks,
        ["Level"] = p_u_42.Level,
        ["CurrentPage"] = p_u_42.CurrentPage,
        ["ClientLevelRewardsClaimed"] = p_u_42.ClientLevelRewardsClaimed,
        ["ServerLevelRewardsClaimed"] = p_u_42.LevelRewardsClaimed,
        ["Component"] = v_u_43
    })
    local v54 = {
        ["OnActivated"] = function()
            -- upvalues: (ref) v_u_5
            v_u_5:ClaimLevelRewards()
        end
    }
    v_u_12(v_u_43.BGFrame.Tabs.ClaimBtn)(v54)
    return v_u_43
end
return v20