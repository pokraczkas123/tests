-- Decompiled game.ReplicatedFirst.Controllers.ClassicProServerController

local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedFirst")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = nil
local v_u_5 = nil
local v_u_6 = nil
local v_u_7 = require(v3.Configuration.Game)
local v_u_8 = require(v3.Configuration.Place)()
local v_u_9 = require(v2.Components.Button)
local v_u_10 = require(v3.Packages.Knit)
local v_u_11 = require(v3.Common.State)
local v12 = v_u_10.CreateController({
    ["Name"] = "ClassicProServerController",
    ["Player"] = v1.LocalPlayer
})
function v12.KnitStart(p13)
    -- upvalues: (ref) v_u_4, (copy) v_u_10, (ref) v_u_5, (ref) v_u_6
    v_u_4 = v_u_10.GetController("InterfaceController")
    v_u_5 = v_u_10.GetController("GameController")
    v_u_6 = v_u_10.GetService("PartyService")
    p13.CanAccesInventory = false
    p13.IsPrompting = false
    p13.Component = p13:LoadComponent()
end
function v12.LoadComponent(p_u_14)
    -- upvalues: (ref) v_u_4, (copy) v_u_9, (copy) v_u_11, (copy) v_u_7, (ref) v_u_6, (ref) v_u_5, (copy) v_u_8
    local v15 = v_u_4.App.Lobby.JoinProServer
    local v16 = {
        ["OnActivated"] = function()
            -- upvalues: (ref) v_u_4
            v_u_4:SelectLobbyMenu("")
        end
    }
    v_u_9(v15.BGFrame.CloseBTN)(v16)
    local v17 = {
        ["OnActivated"] = function()
            -- upvalues: (ref) v_u_11, (copy) p_u_14, (ref) v_u_7, (ref) v_u_6, (ref) v_u_5
            if v_u_11.get(p_u_14.Player, v_u_11.Id.User, "Level", 0) >= v_u_7.ClassicProServerLevelRequirement then
                v_u_6:RequestTeleport("ClassicPro")
            else
                v_u_5:Notify({
                    ["Body"] = ("You need to be level %* to join the Classic Pro server."):format(v_u_7.ClassicProServerLevelRequirement)
                })
            end
        end
    }
    v_u_9(v15.BGFrame.GoMenu.EnterButton)(v17)
    local v18 = {
        ["OnActivated"] = function()
            -- upvalues: (ref) v_u_6
            v_u_6:RequestTeleport("Default")
        end
    }
    v_u_9(v15.BGFrame.ReturnMenu.EnterButton)(v18)
    v15.BGFrame.GoMenu.Subheader.Text = ("Level %* Required"):format(v_u_7.ClassicProServerLevelRequirement)
    v15.BGFrame.ReturnMenu.Visible = v_u_8.Current == v_u_8.ClassicPro
    v15.BGFrame.GoMenu.Visible = v_u_8.Current ~= v_u_8.ClassicPro
    return v15
end
return v12