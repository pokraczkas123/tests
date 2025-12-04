-- Decompiled game.ReplicatedFirst.Controllers.SeasonController

local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedFirst")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = nil
local v_u_5 = nil
local v_u_6 = nil
local v_u_7 = nil
local v_u_8 = require(v3.Packages.Knit)
local v_u_9 = require(v3.Tools.Number)
local v_u_10 = require(v3.Packages.Fusion)
local v_u_11 = require(v3.Content.Monetization)
local v_u_12 = require(v3.Tools.Utility).applyToAllTagged
local v_u_13 = require(v3.Tools.Logger).new(script.Name)
local v_u_14 = require(v3.Configuration.Place)()
local v_u_15 = require(v2.Components.Button)
local v_u_16 = require(v3.Common.State)
local v_u_17 = require(v3.Tools.Sound)
local v_u_18 = require(v3.Tools.Time)
local v_u_19 = require(script.CurrencyShop)
local v_u_20 = require(script.PremiumPass)
local v_u_21 = require(script.SeasonPass)
local v_u_22 = require(script.TierSkips)
local v_u_23 = require(script.Rebirth)
local v_u_24 = require(script.Quests)
local v_u_25 = require(script.Crates)
local v_u_26 = require(script.Header)
local v27 = v_u_8.CreateController({
    ["Name"] = "SeasonController",
    ["Player"] = v1.LocalPlayer
})
function v27.KnitStart(p28)
    -- upvalues: (ref) v_u_5, (copy) v_u_8, (ref) v_u_4, (ref) v_u_6, (ref) v_u_7, (copy) v_u_10, (copy) v_u_20, (copy) v_u_22, (copy) v_u_23, (copy) v_u_26, (copy) v_u_21, (copy) v_u_19, (copy) v_u_24, (copy) v_u_25, (copy) v_u_17
    v_u_5 = v_u_8.GetService("SeasonService")
    v_u_4 = v_u_8.GetController("InterfaceController")
    v_u_6 = v_u_8.GetService("DataService")
    v_u_7 = v_u_8.GetService("PartyService")
    if v_u_4.IsMatchmaking then
        return
    else
        p28.Season = v_u_4.Season
        local v29 = p28.Season
        if v29 then
            v29 = p28.Season:IsLive()
        end
        p28.IsLive = v29
        p28:BindLobbyInteractions()
        if p28.IsLive then
            p28.ShowPremiumMenu = v_u_10.Value(false)
            p28.ShowSkipsMenu = v_u_10.Value(false)
            p28.CurrentPage = v_u_10.Value(1)
            p28.Quests = p28:BindToQuestsAsync()
            p28.SelectedMenu = v_u_10.Value("Main")
            p28.IsLive = p28:BindToSeasonLive()
            p28.Component = p28:LoadComponent()
            p28.CurrentTier = p28:BindToCurrentTier()
            p28.PremiumPass = v_u_20({
                ["Component"] = p28.Component.Container.PremiumPass,
                ["Visibility"] = p28.ShowPremiumMenu,
                ["Seasonal"] = v_u_4.Seasonal
            })
            p28.TierSkips = v_u_22({
                ["Component"] = p28.Component.Container.Skips,
                ["Visibility"] = p28.ShowSkipsMenu,
                ["Season"] = p28.Season,
                ["CurrentPage"] = p28.CurrentPage,
                ["CurrentTier"] = p28.CurrentTier
            })
            p28.Rebirth = v_u_23({
                ["Component"] = p28.Component.Container.Rebirth,
                ["Seasonal"] = v_u_4.Seasonal,
                ["Season"] = p28.Season
            })
            v_u_26({
                ["Component"] = p28.Component.Container.Header,
                ["Header"] = p28.Component.Container.Title,
                ["SelectedMenu"] = p28.SelectedMenu,
                ["Season"] = p28.Season
            })
            v_u_21({
                ["Component"] = p28.Component.Container.SeasonPass,
                ["Seasonal"] = v_u_4.Seasonal,
                ["SelectedMenu"] = p28.SelectedMenu,
                ["Season"] = p28.Season,
                ["CurrentTier"] = p28.CurrentTier,
                ["PremiumMenuVisibility"] = p28.ShowPremiumMenu,
                ["SkipsVisible"] = p28.ShowSkipsMenu
            })
            v_u_19({
                ["Component"] = p28.Component.Container.CurrencyShop,
                ["SelectedMenu"] = p28.SelectedMenu,
                ["Season"] = p28.Season
            })
            v_u_24({
                ["Component"] = p28.Component.Container.Quests,
                ["SelectedMenu"] = p28.SelectedMenu,
                ["Seasonal"] = v_u_4.Seasonal,
                ["Season"] = p28.Season,
                ["Quests"] = p28.Quests
            })
            v_u_25({
                ["Component"] = p28.Component.Container.Crates,
                ["SelectedMenu"] = p28.SelectedMenu,
                ["Season"] = p28.Season
            })
            v_u_5.Reward:Connect(function()
                -- upvalues: (ref) v_u_17
                v_u_17.fromName("SeasonalReward")({})
            end)
        end
    end
end
function v27.BindLobbyInteractions(p_u_30)
    -- upvalues: (copy) v_u_12, (copy) v_u_10, (ref) v_u_4, (copy) v_u_18
    v_u_12("SeasonPass", function(p31)
        -- upvalues: (copy) p_u_30
        if not p_u_30.IsLive then
            p31:Destroy()
        end
    end)
    if p_u_30.IsLive then
        v_u_12("SeasonPassClock", function(p32)
            -- upvalues: (ref) v_u_10, (ref) v_u_4, (copy) p_u_30, (ref) v_u_18
            local v_u_33 = p32:GetAttribute("StringTemplate") or "%s"
            local v_u_34 = p32:GetAttribute("Shorten") or false
            v_u_10.Hydrate(p32)({
                ["Text"] = v_u_10.Computed(function()
                    -- upvalues: (ref) v_u_4, (ref) p_u_30, (copy) v_u_33, (copy) v_u_34, (ref) v_u_18
                    local v35 = v_u_4.DynamicTimestamp:get()
                    local v36 = p_u_30.Season.Timestamp.End - v35
                    if v36 <= 0 then
                        return "SEASON HAS ENDED"
                    end
                    local v37 = string.format
                    local v38 = v_u_33
                    local v39
                    if v_u_34 then
                        v39 = v_u_18.toDHMS(v36)
                    else
                        v39 = v_u_18.format(v36, "dd:hh:mm:ss")
                    end
                    return v37(v38, v39)
                end)
            })
        end)
    end
end
function v27.BindToQuestsAsync(_)
    -- upvalues: (copy) v_u_10, (ref) v_u_6
    local v_u_40 = v_u_10.Value(v_u_6:Get("Quests"):expect() or {})
    v_u_6.ProfileUpdated:Connect(function(p41, p42)
        -- upvalues: (copy) v_u_40
        if p41 == "Quests" then
            v_u_40:set(p42 or {})
        end
    end)
    return v_u_40
end
function v27.BindToCurrentTier(p_u_43)
    -- upvalues: (copy) v_u_10, (ref) v_u_4
    return v_u_10.Computed(function()
        -- upvalues: (ref) v_u_4, (copy) p_u_43
        local v44 = v_u_4.Seasonal:get() or {
            ["Experience"] = 0,
            ["Rebirths"] = 0
        }
        return p_u_43.Season:GetTierFromExperience(v44.Experience, v44.Rebirths)
    end)
end
function v27.PurchaseTiers(p45, p46)
    -- upvalues: (copy) v_u_13, (copy) v_u_11
    local v47 = #p45.Season.Rewards.Regular
    local v48 = (p46 or v47) - p45.CurrentTier:get()
    local v49 = math.clamp(v48, 0, v47)
    if v49 == 0 then
        v_u_13:Warn("Tiers needed is 0, returning")
        return
    elseif v_u_11.Products.Seasonal.Tiers[v49] then
        local v50 = p45.CurrentPage
        local v51 = v49 + 1
        v50:set((math.clamp(v51, 0, v47)))
        p45.ShowSkipsMenu:set(true)
    else
        v_u_13:Warn((("Product data for \'%*\' is nil, returning"):format(v49)))
    end
end
function v27.BindToSeasonLive(p_u_52)
    -- upvalues: (copy) v_u_10, (ref) v_u_4
    return v_u_10.Computed(function()
        -- upvalues: (ref) v_u_4, (copy) p_u_52
        local v53 = v_u_4.DynamicTimestamp:get()
        local v54 = p_u_52.Season
        if v54 then
            if p_u_52.Season.Timestamp.Start <= v53 then
                v54 = v53 <= p_u_52.Season.Timestamp.End
            else
                v54 = false
            end
        end
        return v54
    end)
end
function v27.LoadComponent(p_u_55)
    -- upvalues: (copy) v_u_10, (ref) v_u_4, (copy) v_u_16, (copy) v_u_15, (copy) v_u_9, (ref) v_u_7, (copy) v_u_14
    local v_u_56 = v_u_10.Value(false)
    local v57 = v_u_10.Hydrate(v_u_4.App.Lobby.SeasonPass)({
        [v_u_10.Out("Visible")] = v_u_56
    })
    v_u_10.Observer(v_u_56):onChange(function()
        -- upvalues: (ref) v_u_4, (copy) v_u_56, (ref) v_u_16, (copy) p_u_55
        if v_u_4.App.Parent ~= nil then
            local v58 = v_u_56:get()
            local v59 = v_u_4.App.Stats
            local v60
            if v_u_16.get(p_u_55.Player, v_u_16.Id.Gameplay, "InGame") then
                v60 = false
            else
                v60 = not v58
            end
            v59.Visible = v60
        end
    end)
    v_u_15(v57.Container.Currency.Plus)({
        ["OnActivated"] = function()
            -- upvalues: (copy) p_u_55
            p_u_55.SelectedMenu:set("CurrencyShop")
        end
    })
    v_u_10.Hydrate(v57.Container.Currency.Amount)({
        ["Text"] = v_u_10.Computed(function()
            -- upvalues: (ref) v_u_9, (ref) v_u_4
            return v_u_9.abbreviate(v_u_4.Seasonal:get().Currency or 0)
        end)
    })
    local v61 = {
        ["OnActivated"] = function()
            -- upvalues: (ref) v_u_4
            v_u_4:SelectLobbyMenu("")
        end
    }
    v_u_15(v57.Container.CloseBtn)(v61)
    local v62 = v_u_4.App.Lobby.JoinSeasonalServer
    local v63 = {
        ["OnActivated"] = function()
            -- upvalues: (ref) v_u_4
            v_u_4:SelectLobbyMenu("")
        end
    }
    v_u_15(v62.BGFrame.CloseBTN)(v63)
    local v64 = {
        ["OnActivated"] = function()
            -- upvalues: (ref) v_u_7
            v_u_7:RequestTeleport("Ones")
        end
    }
    v_u_15(v62.BGFrame.GoMenu.EnterButton)(v64)
    local v65 = {
        ["OnActivated"] = function()
            -- upvalues: (ref) v_u_7
            v_u_7:RequestTeleport("Default")
        end
    }
    v_u_15(v62.BGFrame.ReturnMenu.EnterButton)(v65)
    v62.BGFrame.ReturnMenu.Visible = v_u_14.Current == v_u_14.Seasonal
    v62.BGFrame.GoMenu.Visible = v_u_14.Current ~= v_u_14.Seasonal
    return v57
end
return v27