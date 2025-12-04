-- Decompiled game.ReplicatedFirst.Controllers.RankedQueueController.RankedQueueTeleportGui

local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("ReplicatedFirst")
local v_u_4 = game:GetService("TeleportService")
local v_u_5 = require(v2.Packages.Fusion)
local v_u_6 = require(v2.Configuration.Matchmaking)
local v_u_7 = require(v_u_3.Components.Transition)
return function(p_u_8)
    -- upvalues: (copy) v_u_3, (copy) v_u_1, (copy) v_u_5, (copy) v_u_4, (copy) v_u_7, (copy) v_u_6
    local v_u_9 = v_u_3.Assets.RankedQueueGui
    v_u_9.Parent = v_u_1.LocalPlayer.PlayerGui
    v_u_9.Enabled = false
    v_u_5.Observer(p_u_8.IsTeleporting):onChange(function()
        -- upvalues: (ref) v_u_4, (copy) v_u_9, (ref) v_u_7
        v_u_4:SetTeleportGui(v_u_9)
        v_u_7({
            ["Duration"] = 0.75,
            ["OnHidden"] = function()
                -- upvalues: (ref) v_u_9
                v_u_9.Enabled = true
            end
        })
    end)
    v_u_5.Hydrate(v_u_9.RankedQueue.Counter)({
        ["Text"] = "Match found!"
    })
    v_u_5.Hydrate(v_u_9.RankedQueue.Header)({
        ["Text"] = v_u_5.Computed(function()
            -- upvalues: (copy) p_u_8, (ref) v_u_6, (copy) v_u_9
            local v10 = p_u_8.GameMode:get()
            if v10 and v_u_6.Data[v10] then
                return ("Teleporting to Ranked %s"):format(v_u_6.Data[v10].DisplayName)
            else
                return v_u_9.RankedQueue.Header.Text
            end
        end)
    })
end