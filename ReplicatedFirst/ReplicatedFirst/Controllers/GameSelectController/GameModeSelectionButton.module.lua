-- Decompiled game.ReplicatedFirst.Controllers.GameSelectController.GameModeSelectionButton

local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedFirst")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = require(v3.Packages.Fusion)
local v_u_5 = require(v3.Packages.Knit)
local v_u_6 = require(v3.Configuration.Game)
local v_u_7 = require(v3.Tools.Debounce).new("GameModeSelectionButton", 1)
local v_u_8 = require(v3.Configuration.Place)()
local v_u_9 = require(v2.Components.Transition)
local v_u_10 = require(v2.Components.Button)
local v_u_11 = require(v3.Common.State)
return function(p12)
    -- upvalues: (copy) v_u_5, (copy) v_u_8, (copy) v_u_6, (copy) v_u_11, (copy) v_u_4, (copy) v_u_10, (copy) v_u_7, (copy) v_u_1, (copy) v_u_9
    local v_u_13 = v_u_5.GetController("InterfaceController")
    local v_u_14 = v_u_5.GetService("PartyService")
    local v_u_15 = v_u_5.GetController("TeamSelectionController")
    local v_u_16 = v_u_5.GetController("GameController")
    if v_u_8.Current ~= v_u_8.Matchmaking then
        local v17 = {
            ["Twos"] = v_u_6.ProServerLevelRequirement,
            ["Threes"] = v_u_6.ProServerLevelRequirement,
            ["Fours"] = v_u_6.ProServerLevelRequirement,
            ["Sixes"] = v_u_6.ProServerLevelRequirement,
            ["ClassicPro"] = v_u_6.ClassicProServerLevelRequirement,
            ["Hardcore"] = v_u_6.HardcoreServerLevelRequirement
        }
        local v_u_18 = p12.Button:GetAttribute("TeleportPlace")
        local v_u_19 = v17[v_u_18] or 0
        local v_u_20 = v_u_13:BindToPlayerAttribute(v_u_11.getKey(v_u_11.Id.User, "Level"))
        local v_u_21 = v_u_4.Value(false)
        local v22 = v_u_8.Current == v_u_8[v_u_18]
        v_u_4.Hydrate(p12.YouAreHereFrame:Clone())({
            ["Visible"] = v22,
            ["Parent"] = p12.Button
        })
        local v_u_24 = v_u_4.Computed(function()
            -- upvalues: (ref) v_u_8, (copy) v_u_19, (copy) v_u_20
            local v23 = v_u_8.Current ~= v_u_8.Pro and v_u_19
            if v23 then
                v23 = (v_u_20:get() or 0) < v_u_19
            end
            return v23
        end)
        v_u_4.Hydrate(p12.Button.UIStroke)({
            ["Enabled"] = v_u_4.Computed(function()
                -- upvalues: (copy) v_u_24
                return not v_u_24:get()
            end),
            ["Color"] = v_u_4.Computed(function()
                -- upvalues: (copy) v_u_21
                return v_u_21:get() and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(255, 140, 0)
            end)
        })
        if p12.Button:FindFirstChild("Locked") then
            v_u_4.Hydrate(p12.Button.Locked)({
                ["Visible"] = v_u_4.Computed(function()
                    -- upvalues: (copy) v_u_24
                    return v_u_24:get()
                end)
            })
            v_u_4.Hydrate(p12.Button.Locked.TextLabel)({
                ["Text"] = ("\240\159\148\146 UNLOCKS AT LEVEL %*"):format(v_u_19)
            })
        end
        v_u_4.Hydrate(p12.Button.Shadow)({
            ["Visible"] = v_u_4.Computed(function()
                -- upvalues: (copy) v_u_24
                return not v_u_24:get()
            end)
        })
        v_u_4.Hydrate(p12.Button.ModeButton.UIGradient)({
            ["Rotation"] = v_u_4.Spring(v_u_4.Computed(function()
                -- upvalues: (copy) v_u_24
                return v_u_24:get() and -90 or 90
            end)),
            ["Color"] = v_u_4.Computed(function()
                -- upvalues: (copy) v_u_24
                return v_u_24:get() and ColorSequence.new(Color3.fromRGB(50, 50, 50)) or ColorSequence.new(Color3.fromRGB(255, 255, 255))
            end)
        })
        v_u_4.Hydrate(p12.Button)({
            ["BackgroundColor3"] = v_u_4.Spring(v_u_4.Computed(function()
                -- upvalues: (copy) v_u_24, (copy) v_u_21
                return v_u_24:get() and Color3.fromRGB(0, 0, 0) or v_u_21:get() and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(255, 140, 0)
            end))
        })
        local v30 = {
            ["Scale"] = {
                ["Hover"] = 1
            },
            ["OnActivated"] = function()
                -- upvalues: (copy) v_u_24, (ref) v_u_8, (copy) v_u_18, (copy) v_u_15, (ref) v_u_7, (ref) v_u_1, (copy) v_u_14, (copy) v_u_16, (ref) v_u_6, (ref) v_u_9, (copy) v_u_13
                if v_u_24:get() then
                    return
                else
                    local v25 = v_u_8[v_u_18] or v_u_8.Matchmaking
                    if (v_u_8.Current == v_u_8.Default or v_u_8.Current == v_u_8.ClassicPro or v_u_8.Current == v_u_8.Training or v_u_8.Current == v_u_8.Seasonal or v_u_8.Current == v_u_8.Hardcore) and v_u_8.Current == v25 then
                        v_u_15:Open()
                        return
                    elseif not v_u_7:Has(v_u_1.LocalPlayer) then
                        v_u_7:Set(v_u_1.LocalPlayer)
                        local v26 = v_u_14:RequestTeleport(v_u_18):expect()
                        if v25 ~= v_u_8.Matchmaking then
                            local v27 = v_u_16
                            local v28 = {
                                ["Body"] = v26 or ("Teleporting to %*"):format(v_u_18)
                            }
                            local v29
                            if v26 then
                                v29 = nil
                            else
                                v29 = v_u_6.Notification.Color.Green
                            end
                            v28.Color = v29
                            v27:Notify(v28)
                        end
                        if not v26 then
                            if v25 ~= v_u_8.Matchmaking then
                                v_u_9({
                                    ["HoldDuration"] = 5,
                                    ["CanYield"] = true,
                                    ["Duration"] = 1,
                                    ["Body"] = "Teleporting..."
                                })
                            end
                            v_u_13:SelectLobbyMenu("")
                            v_u_7:Remove(v_u_1.LocalPlayer)
                        end
                    end
                end
            end,
            ["OnHoverStart"] = function()
                -- upvalues: (copy) v_u_21
                v_u_21:set(true)
            end,
            ["OnHoverEnd"] = function()
                -- upvalues: (copy) v_u_21
                v_u_21:set(false)
            end
        }
        v_u_10(p12.Button)(v30)
    end
end