-- Decompiled game.ReplicatedFirst.Controllers.SettingsController

local v_u_1 = Color3.fromRGB(126, 255, 46)
local v_u_2 = Color3.fromRGB(255, 53, 56)
local v_u_3 = { UDim2.fromScale(0.21, 0.5), UDim2.fromScale(0.79, 0.5) }
local v4 = game:GetService("Players")
local v5 = game:GetService("ReplicatedFirst")
local v6 = game:GetService("ReplicatedStorage")
local v_u_7 = nil
local v_u_8 = nil
local v_u_9 = require(v6.Packages.Knit)
local v_u_10 = require(v6.Packages.Fusion)
local v_u_11 = require(v5.Components.FitScrollingFrame)
local v_u_12 = require(v5.Components.Button)
local v_u_13 = require(script.DisplayNameMap)
local v_u_14 = v_u_10.Children
local v15 = v_u_9.CreateController({
    ["Name"] = "SettingsController",
    ["Player"] = v4.LocalPlayer
})
function v15.KnitStart(p_u_16)
    -- upvalues: (ref) v_u_7, (copy) v_u_9, (ref) v_u_8, (copy) v_u_10
    v_u_7 = v_u_9.GetService("SettingsService")
    v_u_8 = v_u_9.GetController("InterfaceController")
    v_u_8.SettingsCallback = p_u_16:LoadSettingsCallbacksAsync()
    p_u_16.Component = p_u_16:LoadComponent()
    p_u_16.Loaded = true
    local v17 = v_u_10.Observer(v_u_8.Settings)
    v17:onChange(function()
        -- upvalues: (ref) v_u_8, (copy) p_u_16
        for v18, v19 in pairs(v_u_8.Settings:get()) do
            if typeof(v19) == "boolean" then
                p_u_16:ApplySetting(v18, v19)
            end
        end
    end)
    v17:update()
end
function v15.LoadSettingsCallbacksAsync(_)
    local v20 = {}
    for _, v21 in ipairs(script.Settings:GetChildren()) do
        v20[v21.Name] = require(v21)
    end
    return v20
end
function v15.LoadComponent(_)
    -- upvalues: (ref) v_u_8, (copy) v_u_12, (copy) v_u_11, (copy) v_u_10, (copy) v_u_14, (copy) v_u_13, (copy) v_u_1, (copy) v_u_2, (copy) v_u_3, (ref) v_u_7
    local v22 = v_u_8.App.Lobby.Settings
    local v23 = {
        ["OnActivated"] = function()
            -- upvalues: (ref) v_u_8
            v_u_8:SelectLobbyMenu("Settings", true)
        end
    }
    v_u_12(v22.BGFrame.CloseBtn)(v23)
    local v_u_24 = v22.BGFrame.Body.List
    v_u_11(v_u_24)
    v_u_10.Hydrate(v_u_24)({
        [v_u_14] = v_u_10.ForPairs(v_u_8.Settings, function(p_u_25, p_u_26)
            -- upvalues: (ref) v_u_10, (copy) v_u_24, (ref) v_u_13, (ref) v_u_1, (ref) v_u_2, (ref) v_u_12, (ref) v_u_3, (ref) v_u_7
            if typeof(p_u_26) ~= "boolean" then
                return p_u_25, nil
            end
            local v27 = v_u_10.Hydrate(v_u_24.A_Template:Clone())({
                ["Parent"] = v_u_24,
                ["Visible"] = true,
                ["Name"] = ("A_%*"):format(p_u_25)
            })
            v_u_10.Hydrate(v27.Setting)({
                ["Text"] = v_u_13[p_u_25] or p_u_25
            })
            local v28 = {
                ["BackgroundColor3"] = p_u_26 and v_u_1 or v_u_2
            }
            v_u_10.Hydrate(v27.BTNBg.Hitbox.Frame)(v28)
            local v29 = {
                ["Color"] = p_u_26 and v_u_1 or v_u_2
            }
            v_u_10.Hydrate(v27.BTNBg.UIStroke)(v29)
            v_u_12(v27.BTNBg.Hitbox)({
                ["Position"] = p_u_26 and v_u_3[2] or v_u_3[1],
                ["OnActivated"] = function()
                    -- upvalues: (ref) v_u_7, (copy) p_u_25, (copy) p_u_26
                    v_u_7:ChangeSetting(p_u_25, not p_u_26)
                end
            })
            return p_u_25, v27
        end, v_u_10.cleanup)
    })
    return v22
end
function v15.ApplySetting(_, p30, p31)
    -- upvalues: (ref) v_u_8
    if v_u_8.SettingsCallback[p30] then
        v_u_8.SettingsCallback[p30](p31)
    end
end
return v15