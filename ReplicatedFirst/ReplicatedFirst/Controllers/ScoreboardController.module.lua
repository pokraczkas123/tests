-- Decompiled game.ReplicatedFirst.Controllers.ScoreboardController

local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedFirst")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = game:GetService("StarterGui")
local v_u_5 = nil
local v_u_6 = nil
local v_u_7 = nil
local v_u_8 = require(v3.Packages.Knit)
local v_u_9 = require(v3.Packages.Fusion)
local v_u_10 = require(v2.Components.Button)
local v_u_11 = require(script.PlayerScore)
local v12 = v_u_8.CreateController({
    ["Name"] = "ScoreboardController",
    ["Player"] = v_u_1.LocalPlayer
})
function v12.KnitStart(p13)
    -- upvalues: (ref) v_u_5, (copy) v_u_8, (ref) v_u_6, (ref) v_u_7, (copy) v_u_9, (copy) v_u_4
    v_u_5 = v_u_8.GetController("InterfaceController")
    v_u_6 = v_u_8.GetController("InputController")
    v_u_7 = v_u_8.GetService("GameService")
    p13.Players = p13:GetPlayers()
    p13.IsVisible = v_u_9.Value(false)
    p13.Component = p13:LoadComponent()
    pcall(function()
        -- upvalues: (ref) v_u_4
        v_u_4:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
    end)
    p13:BindToInput()
end
function v12.BindToInput(p_u_14)
    -- upvalues: (ref) v_u_6
    v_u_6:Bind("Scoreboard")({
        ["Keys"] = v_u_6:GetKeybindForActionAsync("Scoreboard"),
        ["Action"] = function(p15, _)
            -- upvalues: (copy) p_u_14
            if p15 == Enum.UserInputState.Begin or p15 == Enum.UserInputState.End then
                p_u_14.IsVisible:set(p15 == Enum.UserInputState.Begin)
                return Enum.ContextActionResult.Sink
            end
        end
    })
end
function v12.GetPlayersOnTeams(p16)
    -- upvalues: (copy) v_u_1
    local v17 = {}
    p16.Players:set(v17)
    for _, v18 in ipairs(v_u_1:GetPlayers()) do
        table.insert(v17, v18)
    end
    return v17
end
function v12.GetPlayers(p_u_19)
    -- upvalues: (copy) v_u_9, (ref) v_u_7, (copy) v_u_1
    local v_u_20 = v_u_9.Value({})
    v_u_7.TeamsChanged:Connect(function()
        -- upvalues: (copy) v_u_20, (copy) p_u_19
        v_u_20:set(p_u_19:GetPlayersOnTeams())
    end)
    v_u_1.PlayerRemoving:Connect(function()
        -- upvalues: (copy) v_u_20, (copy) p_u_19
        v_u_20:set(p_u_19:GetPlayersOnTeams())
    end)
    v_u_1.PlayerAdded:Connect(function()
        -- upvalues: (copy) v_u_20, (copy) p_u_19
        v_u_20:set(p_u_19:GetPlayersOnTeams())
    end)
    return v_u_20
end
function v12.LoadComponent(p_u_21)
    -- upvalues: (copy) v_u_9, (ref) v_u_5, (ref) v_u_6, (copy) v_u_10, (copy) v_u_11
    local v_u_22 = v_u_9.Hydrate(v_u_5.App.Game.Leaderboard)({
        ["Visible"] = p_u_21.IsVisible
    })
    local v23 = v_u_5.App.Game.LeaderboardOpenerBtn
    local v_u_24 = v_u_6:GetKeybindForActionAsync("Scoreboard")
    p_u_21.IsVisible:set(false)
    local v25 = {
        ["Scale"] = {
            ["Base"] = 1,
            ["Hover"] = 1,
            ["Down"] = 1
        },
        ["OnActivated"] = function()
            -- upvalues: (copy) p_u_21
            p_u_21.IsVisible:set(not p_u_21.IsVisible:get())
        end
    }
    v_u_10(v23)(v25)
    v_u_9.Hydrate(v23.Key)({
        ["Image"] = v_u_9.Computed(function()
            -- upvalues: (ref) v_u_6, (copy) v_u_24
            local v26 = v_u_6
            local v27
            if v_u_6.InputType:get() == v_u_6.Type.Console then
                v27 = v_u_24[2]
            else
                v27 = v_u_24[1]
            end
            return v26:GetImageForKeycode(v27)
        end),
        ["Visible"] = v_u_9.Computed(function()
            -- upvalues: (ref) v_u_6
            return v_u_6.InputType:get() ~= v_u_6.Type.Mobile
        end)
    })
    v_u_9.Hydrate(v_u_22.BGFrame)({
        [v_u_9.Children] = v_u_9.ForPairs(p_u_21.Players, function(p28, p29)
            -- upvalues: (copy) p_u_21, (copy) v_u_22, (ref) v_u_11
            if p29.Team == nil then
                return p28, nil
            end
            local v30 = p29.Team == p_u_21.Player.Team
            local v31 = v_u_22.BGFrame[("%*Team"):format(v30 and "Home" or "Away")].BGFrame.List
            return p28, Instance.new("Folder"), v_u_11({
                ["Parent"] = v31,
                ["Component"] = v31.Template:Clone(),
                ["Player"] = p29
            })
        end, v_u_9.cleanup)
    })
    v_u_9.Hydrate(v_u_22.Players)({
        [v_u_9.Children] = v_u_9.ForPairs(p_u_21.Players, function(p32, p33)
            -- upvalues: (ref) v_u_9, (copy) v_u_22
            if p33.Team == nil then
                return p32, v_u_9.Hydrate(v_u_22.Players.NameTemp:Clone())({
                    ["Visible"] = true,
                    ["Text"] = p33.Name
                })
            else
                return p32
            end
        end, v_u_9.cleanup)
    })
    return v_u_22
end
return v12