-- Decompiled game.ReplicatedFirst.Controllers.MasteryController.Opener

local v1 = game:GetService("ReplicatedFirst")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = nil
local v_u_4 = nil
local v_u_5 = require(v2.Packages.Knit)
local v_u_6 = require(v2.Packages.Fusion)
local v_u_7 = require(v1.Components.Button)
require(v2.Content.Mastery)
require(v2.Content.Reward)
local v_u_8 = require(v2.Tools.Number)
require(v2.Content.Quest)
require(script.Parent.Types)
local v_u_9 = require(script.Ranks)
return function(p_u_10)
    -- upvalues: (ref) v_u_3, (copy) v_u_5, (ref) v_u_4, (copy) v_u_7, (copy) v_u_6, (copy) v_u_8, (copy) v_u_9
    v_u_3 = v_u_3 or v_u_5.GetController("InterfaceController")
    v_u_4 = v_u_4 or v_u_5.GetService("MasteryService")
    local v11 = {
        ["OnActivated"] = function()
            -- upvalues: (ref) v_u_3, (ref) v_u_4
            v_u_3:SelectLobbyMenu("Masteries", true, true)
            v_u_4:ClearNotifications()
        end
    }
    v_u_7(p_u_10.Component.Body.ViewMasteryBtn)(v11)
    local v12 = v_u_6.Computed(function()
        -- upvalues: (copy) p_u_10
        return p_u_10.MasteryEntity:get().Levels
    end)
    local v_u_13 = v_u_6.Computed(function()
        -- upvalues: (copy) p_u_10
        return p_u_10.PhaseProfile:get().Notification or 0
    end)
    v_u_6.Hydrate(p_u_10.Component)({
        ["Visible"] = v_u_6.Computed(function()
            -- upvalues: (copy) p_u_10
            return #p_u_10.PhaseProfile:get().Quests > 0
        end)
    })
    v_u_6.Hydrate(p_u_10.Component.Body.ViewMasteryBtn.Notifications)({
        ["Visible"] = v_u_6.Computed(function()
            -- upvalues: (copy) v_u_13
            return v_u_13:get() > 0
        end),
        ["Text"] = v_u_6.Computed(function()
            -- upvalues: (ref) v_u_8, (copy) v_u_13
            return v_u_8.format(v_u_13:get())
        end)
    })
    v_u_9({
        ["Component"] = p_u_10.Component.Body.Ranks,
        ["MasteryLevels"] = v12,
        ["CurrentLevel"] = p_u_10.CurrentLevel,
        ["HasCompletedMastery"] = p_u_10.HasCompletedMastery
    })
    return p_u_10.Component
end