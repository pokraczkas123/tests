-- Decompiled game.ReplicatedFirst.Controllers.GameSelectController

local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedFirst")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = nil
local v_u_5 = nil
local v_u_6 = nil
local v_u_7 = require(v3.Tools.Utility).applyToAllTagged
local v_u_8 = require(v2.Components.FitScrollingFrame)
local v_u_9 = require(script.GameModeSelectionButton)
local v_u_10 = require(v3.Packages.Fusion)
local v_u_11 = require(v2.Components.Button)
local v_u_12 = require(v3.Packages.Knit)
local v_u_13 = require(v3.Common.State)
local v14 = v_u_12.CreateController({
    ["Name"] = "GameSelectController",
    ["Player"] = v1.LocalPlayer
})
function v14.KnitStart(p_u_15)
    -- upvalues: (ref) v_u_4, (copy) v_u_12, (ref) v_u_5, (ref) v_u_6, (copy) v_u_7, (copy) v_u_9, (copy) v_u_11
    v_u_4 = v_u_12.GetController("InterfaceController")
    v_u_5 = v_u_12.GetController("PlayerController")
    v_u_6 = v_u_12.GetController("PromptController")
    p_u_15.Component = p_u_15:LoadComponent()
    v_u_7("GameModeSelectionButton", function(p16)
        -- upvalues: (ref) v_u_9, (copy) p_u_15, (ref) v_u_11, (ref) v_u_6
        v_u_9({
            ["Button"] = p16,
            ["YouAreHereFrame"] = p_u_15.Component.Body.Body.Here
        })
        if p16.Name == "ModeHardcore" then
            local v17 = p16:FindFirstChild("HelpBtn")
            if not v17 then
                return
            end
            local v18 = {
                ["OnActivated"] = function()
                    -- upvalues: (ref) v_u_6
                    v_u_6:Open({
                        ["Header"] = "Hardcore Mode",
                        ["Body"] = "- Backrow players can\'t jump in front of the attack line\n\n- You can\'t hit around antennas (Antenna Rule)\n\n- No abilities allowed",
                        ["Option1"] = "OK",
                        ["Option2"] = "BACK",
                        ["Option1Visibility"] = false
                    })
                end
            }
            v_u_11(v17)(v18)
        end
    end)
    p_u_15:LoadPartyPlayers()
end
function v14.LoadComponent(p_u_19)
    -- upvalues: (ref) v_u_4, (copy) v_u_10, (copy) v_u_8, (copy) v_u_11, (copy) v_u_13
    local v20 = v_u_4.App.Lobby.Gamemodes
    local v_u_21 = v_u_10.Value(false)
    v_u_8(v20.Body.Body.ScrollingFrame)
    local v22 = {
        ["OnActivated"] = function()
            -- upvalues: (ref) v_u_4
            v_u_4:SelectLobbyMenu("Gamemodes", true)
        end
    }
    v_u_11(v20.Body.Body.CloseBtn)(v22)
    v_u_10.Hydrate(v20)({
        [v_u_10.Out("Visible")] = v_u_21
    })
    v_u_10.Observer(v_u_21):onChange(function()
        -- upvalues: (ref) v_u_4, (copy) v_u_21, (ref) v_u_13, (copy) p_u_19
        if v_u_4.App.Parent ~= nil then
            local v23 = v_u_21:get()
            local v24 = v_u_4.App.Stats
            local v25
            if v_u_13.get(p_u_19.Player, v_u_13.Id.Gameplay, "InGame") then
                v25 = false
            else
                v25 = not v23
            end
            v24.Visible = v25
        end
    end)
    local v26 = {
        ["OnActivated"] = function()
            -- upvalues: (ref) v_u_4
            v_u_4:SelectLobbyMenu("Party", true)
        end
    }
    v_u_11(v20.Body.Party.AddParty)(v26)
    return v20
end
function v14.LoadPartyPlayers(_)
    -- upvalues: (ref) v_u_4, (copy) v_u_10, (ref) v_u_5
    local v_u_27 = v_u_4.App.Lobby.Gamemodes.Body.Party.Template
    v_u_10.Hydrate(v_u_27.Parent)({
        [v_u_10.Children] = v_u_10.ForPairs(v_u_4.Party, function(p28, p29)
            -- upvalues: (ref) v_u_10, (copy) v_u_27, (ref) v_u_5
            return p28, v_u_10.Hydrate(v_u_27:Clone())({
                ["Name"] = p29.Name,
                ["Visible"] = true,
                ["LayoutOrder"] = p28,
                ["Image"] = (v_u_5.Players:get()[p29.UserId] or {}).Headshot or ""
            })
        end, v_u_10.cleanup)
    })
end
return v14