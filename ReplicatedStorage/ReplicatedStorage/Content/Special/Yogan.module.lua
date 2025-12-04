-- Decompiled game.ReplicatedStorage.Content.Special.Yogan

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Parent)
local v_u_3 = require(script.Utility)
local v_u_4 = require(v1.Common.State)
require(v1.Common.Context)
local v_u_5 = require(v1.Common.SpecialLib.Action)
local v6 = v2.new
local v11 = {
    ["Id"] = script.Name,
    ["Type"] = v2.Type.ActionActivatable,
    ["DisplayName"] = "Rage",
    ["Description"] = { "Charge your <font color=\"rgb(255,125,0)\">RAGE</font> by Defending!", "<font color=\"rgb(255,125,0)\">RAGE</font> gives you all maxed stats!" },
    ["Icon"] = "rbxassetid://73886090726495",
    ["Move"] = v2.Move.All,
    ["ActionMove"] = v2.Move.All,
    ["Rules"] = {
        ["CanActivateFromRemote"] = true
    },
    ["CanRun"] = function(_, p7)
        -- upvalues: (copy) v_u_4
        p7.State.Events.SpecialActive = v_u_4.get(p7.Player, v_u_4.Id.Special, "ActivationState", false) == true
        return false
    end,
    ["PreAction"] = function()
        return false
    end,
    ["Callback"] = require(script.Callback),
    ["UpdateState"] = function(p8, p9, p10)
        -- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_4
        if not p10 then
            if v_u_5.UpdateState(p8, p9) then
                v_u_3.applyState(p9.Player, v_u_4.get(p9.Player, v_u_4.Id.Special, "ActivationState", false))
            end
            return true
        end
        v_u_3.applyState(p9.Player, false)
    end
}
return v6(v11)