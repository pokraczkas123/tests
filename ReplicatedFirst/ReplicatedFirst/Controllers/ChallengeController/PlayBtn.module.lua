-- Decompiled game.ReplicatedFirst.Controllers.ChallengeController.PlayBtn

local v_u_1 = Color3.fromRGB(31, 171, 0)
local v_u_2 = Color3.fromRGB(164, 0, 230)
local v_u_3 = game:GetService("Players")
local v4 = game:GetService("ReplicatedStorage")
local v5 = game:GetService("ReplicatedFirst")
local v_u_6 = nil
local v_u_7 = nil
local v_u_8 = nil
local v_u_9 = nil
local v_u_10 = require(v4.Packages.Knit)
local v_u_11 = require(v4.Packages.Fusion)
local v_u_12 = require(v4.Tools.Logger).new(script.Name)
local v_u_13 = require(v4.Common.State)
local v_u_14 = require(v4.Content.ChallengeRewards)
local v_u_15 = require(v4.Configuration.Game)
local v_u_16 = require(v5.Components.Button)
return function(p_u_17)
    -- upvalues: (ref) v_u_6, (copy) v_u_10, (ref) v_u_7, (ref) v_u_8, (ref) v_u_9, (copy) v_u_11, (copy) v_u_14, (copy) v_u_16, (copy) v_u_13, (copy) v_u_3, (copy) v_u_15, (copy) v_u_12, (copy) v_u_2, (copy) v_u_1
    v_u_6 = v_u_6 or v_u_10.GetService("PartyService")
    v_u_7 = v_u_7 or v_u_10.GetService("ChallengeService")
    v_u_8 = v_u_8 or v_u_10.GetController("GameController")
    v_u_9 = v_u_9 or v_u_10.GetController("ShopController")
    local v_u_18 = v_u_11.Computed(function()
        -- upvalues: (copy) p_u_17, (ref) v_u_14
        return (p_u_17.ChallengesData:get().Strikes or 0) >= v_u_14.MaxStrikes
    end)
    v_u_16(p_u_17.Component)({
        ["OnActivated"] = function()
            -- upvalues: (ref) v_u_13, (ref) v_u_3, (ref) v_u_15, (ref) v_u_8, (copy) v_u_18, (ref) v_u_9, (ref) v_u_14, (ref) v_u_7, (ref) v_u_6, (ref) v_u_12
            if v_u_13.get(v_u_3.LocalPlayer, v_u_13.Id.User, "Level", 0) < v_u_15.ProServerLevelRequirement then
                v_u_8:Notify({
                    ["Body"] = ("You cannot play Challenges till level: %*"):format(v_u_15.ProServerLevelRequirement),
                    ["Duration"] = 5
                })
                return
            elseif v_u_18:get() then
                if v_u_9.States.Statistics.PremiumCurrency:get() < v_u_14.RetryCost then
                    local v19 = v_u_8
                    local v20 = {}
                    local v21 = v_u_14.RetryCost - v_u_9.States.Statistics.PremiumCurrency:get()
                    v20.Body = ("You need %* more Gems to retry!"):format((math.round(v21)))
                    v20.Duration = 5
                    v19:Notify(v20)
                else
                    v_u_7:Reset():expect()
                end
            else
                local v22 = v_u_6:RequestTeleport("Challenges"):expect()
                if v22 then
                    v_u_12:Warn((("Failed to teleport to Challenges: %*"):format(v22)))
                end
                return
            end
        end,
        ["Image"] = v_u_11.Computed(function()
            -- upvalues: (copy) v_u_18
            return v_u_18:get() and "rbxassetid://111285762375572" or "rbxassetid://90820493738858"
        end)
    })
    v_u_11.Hydrate(p_u_17.Component.TextLabel)({
        ["Text"] = v_u_11.Computed(function()
            -- upvalues: (copy) p_u_17, (ref) v_u_15, (copy) v_u_18, (ref) v_u_14
            if (p_u_17.Level:get() or 0) < v_u_15.ProServerLevelRequirement then
                return ("Required Level %*+"):format(v_u_15.ProServerLevelRequirement)
            else
                return not v_u_18:get() and "PLAY" or string.format("Retry? %s Gems", v_u_14.RetryCost)
            end
        end)
    })
    v_u_11.Hydrate(p_u_17.Component.TextLabel.UIStroke)({
        ["Color"] = v_u_11.Computed(function()
            -- upvalues: (copy) v_u_18, (ref) v_u_2, (ref) v_u_1
            if v_u_18:get() then
                return v_u_2
            else
                return v_u_1
            end
        end)
    })
end