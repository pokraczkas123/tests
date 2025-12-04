-- Decompiled game.ReplicatedFirst.Controllers.JoinIdleServerCo

local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedFirst")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = game:GetService("TeleportService")
local v_u_5 = nil
local v_u_6 = require(v3.Packages.Knit)
local v_u_7 = require(v3.Configuration.Place)()
local v_u_8 = require(v2.Components.Button)
local v9 = v_u_6.CreateController({
    ["Name"] = "JoinIdleServerController",
    ["Player"] = v1.LocalPlayer
})
function v9.KnitStart(p10)
    -- upvalues: (ref) v_u_5, (copy) v_u_6
    v_u_5 = v_u_6.GetController("InterfaceController")
    p10.CanAccesInventory = false
    p10.IsPrompting = false
    p10.Component = p10:LoadComponent()
end
function v9.LoadComponent(_)
    -- upvalues: (ref) v_u_5, (copy) v_u_8, (copy) v_u_4, (copy) v_u_7
    local v11 = v_u_5.App.Lobby.JoinAfkServer
    local v12 = {
        ["OnActivated"] = function()
            -- upvalues: (ref) v_u_5
            v_u_5:SelectLobbyMenu("")
        end
    }
    v_u_8(v11.BGFrame.CloseBTN)(v12)
    local v13 = {
        ["OnActivated"] = function()
            -- upvalues: (ref) v_u_4, (ref) v_u_7
            v_u_4:Teleport(v_u_7.Idle)
        end
    }
    v_u_8(v11.BGFrame.GoMenu.EnterButton)(v13)
    return v11
end
return v9