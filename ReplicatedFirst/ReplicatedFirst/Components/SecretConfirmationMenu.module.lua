-- Decompiled game.ReplicatedFirst.Components.SecretConfirmationMenu

local v1 = game:GetService("ReplicatedFirst")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Packages.Knit)
local v_u_4 = nil
local v_u_5 = require(v2.Packages.Fusion)
local v_u_6 = require(v2.Content.Style)
local v_u_7 = require(v1.Components.Button)
require(v2.Tools.Factory)
return function(p_u_8)
    -- upvalues: (ref) v_u_4, (copy) v_u_3, (copy) v_u_5, (copy) v_u_6, (copy) v_u_7
    v_u_4 = v_u_3.GetController("InterfaceController")
    v_u_5.Hydrate(p_u_8.Component.BGFrame.Container.Subheader)({
        ["Text"] = v_u_5.Computed(function()
            -- upvalues: (copy) p_u_8, (ref) v_u_6
            if not p_u_8.NewPreferred:get() then
                return ""
            end
            local v9 = p_u_8.Factory:Get(p_u_8.NewPreferred:get())
            if not v9 then
                return ""
            end
            local v10
            if v9 then
                v10 = v_u_6.Rarity.Data[v9.Rarity].Color
            else
                v10 = Color3.new(1, 1, 1)
            end
            return ("Are you sure you want to switch to <font color=\'#%*\'>%*</font>, and reset Pity Rolls?"):format(v10:ToHex(), v9.DisplayName)
        end)
    })
    v_u_5.Hydrate(p_u_8.Component.BGFrame.Container.Stage1.Info)({
        ["Text"] = v_u_5.Computed(function()
            -- upvalues: (copy) p_u_8, (ref) v_u_6
            if not p_u_8.NewPreferred:get() then
                return ""
            end
            local v11 = p_u_8.Factory:Get(p_u_8.NewPreferred:get())
            if not v11 then
                return ""
            end
            local v12
            if v11 then
                v12 = v_u_6.Rarity.Data[v11.Rarity].Color
            else
                v12 = Color3.new(1, 1, 1)
            end
            return ("<font color=\"rgb(255,125,50)\">50%% Chance</font> <font color=\'#%*\'>of %*</font>"):format(v12:ToHex(), v11.DisplayName)
        end)
    })
    v_u_5.Hydrate(p_u_8.Component.BGFrame.Container.Stage2.Info)({
        ["Text"] = v_u_5.Computed(function()
            -- upvalues: (copy) p_u_8, (ref) v_u_6
            if not p_u_8.NewPreferred:get() then
                return ""
            end
            local v13 = p_u_8.Factory:Get(p_u_8.NewPreferred:get())
            if not v13 then
                return ""
            end
            local v14
            if v13 then
                v14 = v_u_6.Rarity.Data[v13.Rarity].Color
            else
                v14 = Color3.new(1, 1, 1)
            end
            return ("<font color=\"rgb(255,125,50)\">100%% Chance</font> <font color=\'#%*\'>of %*</font>"):format(v14:ToHex(), v13.DisplayName)
        end)
    })
    v_u_5.Hydrate(p_u_8.Component.BGFrame.Container.PityCount)({
        ["Text"] = v_u_5.Computed(function()
            -- upvalues: (copy) p_u_8, (ref) v_u_4
            return ("KEEPS: %* / %* Secret Pity"):format(p_u_8.SecretPity:get(), v_u_4.RollData:get().RequiredSecretPity)
        end)
    })
    v_u_5.Hydrate(p_u_8.Component)({
        ["Visible"] = v_u_5.Computed(function()
            -- upvalues: (copy) p_u_8
            return p_u_8.Visible:get()
        end)
    })
    v_u_7(p_u_8.Component.BGFrame.CloseBtn)({
        ["OnActivated"] = function()
            -- upvalues: (copy) p_u_8
            p_u_8.Visible:set(false)
        end
    })
    v_u_7(p_u_8.Component.BGFrame.Container.Option2)({
        ["OnActivated"] = function()
            -- upvalues: (copy) p_u_8
            p_u_8.Visible:set(false)
        end
    })
    v_u_7(p_u_8.Component.BGFrame.Container.Option1)({
        ["OnActivated"] = function()
            -- upvalues: (copy) p_u_8
            p_u_8.Visible:set(false)
            p_u_8.SelectChance()
        end
    })
end