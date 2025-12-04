-- Decompiled game.ReplicatedFirst.Controllers.MasteryController.SkipMenu

local v1 = game:GetService("ReplicatedFirst")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = nil
local v_u_4 = nil
local v_u_5 = nil
local v_u_6 = require(v2.Tools.Sound)
local v_u_7 = require(v2.Packages.Knit)
local v_u_8 = require(v2.Tools.Number)
local v_u_9 = require(v1.Components.Button)
local v_u_10 = require(v2.Packages.Fusion)
local v_u_11 = require(v2.Tools.Logger).new(script.Name)
local v_u_19 = {
    ["new"] = function()
        -- upvalues: (copy) v_u_19, (copy) v_u_11, (ref) v_u_3, (copy) v_u_7, (ref) v_u_4, (ref) v_u_5, (copy) v_u_10, (copy) v_u_9, (copy) v_u_8
        if v_u_19._component then
            v_u_11:Warn("SkipMenu component already exists, returning existing component.")
            return v_u_19
        end
        v_u_3 = v_u_3 or v_u_7.GetService("MasteryService")
        v_u_4 = v_u_4 or v_u_7.GetController("InterfaceController")
        v_u_5 = v_u_5 or v_u_7.GetController("InventoryController")
        local v_u_12 = v_u_5:BindToInventoryAsync()
        v_u_19._component = v_u_4.App.Lobby.SkipMastery
        v_u_19._skipItemCount = v_u_10.Computed(function()
            -- upvalues: (copy) v_u_12
            return v_u_12:get().MasteryChallengeSkipIngredient or 0
        end)
        local v13 = v_u_19._component.BGFrame.Body
        v_u_9(v13.NoBtn)({
            ["OnActivated"] = v_u_19._close
        })
        v_u_9(v13.YesBtn)({
            ["OnActivated"] = v_u_19._use
        })
        v_u_9(v_u_19._component.BGFrame.CloseBTN)({
            ["OnActivated"] = v_u_19._close
        })
        v_u_10.Hydrate(v13.SkipCount)({
            ["Text"] = v_u_10.Computed(function()
                -- upvalues: (ref) v_u_8, (ref) v_u_19
                return ("You have: %*"):format((v_u_8.format(v_u_19._skipItemCount:get())))
            end)
        })
        return v_u_19
    end,
    ["prompt"] = function(p14, p15)
        -- upvalues: (copy) v_u_19, (ref) v_u_4
        if v_u_19._canShow() then
            v_u_19._index = p14
            v_u_19._productPromptCallback = p15
            v_u_4:SelectLobbyMenu(v_u_19._component.Name, false, true)
        else
            task.spawn(p15)
        end
    end,
    ["_close"] = function()
        -- upvalues: (ref) v_u_4, (copy) v_u_19
        v_u_4:SelectLobbyMenu("Masteries")
        if v_u_19._productPromptCallback then
            task.spawn(v_u_19._productPromptCallback)
            v_u_19._productPromptCallback = nil
            v_u_19._index = nil
        end
    end,
    ["_use"] = function()
        -- upvalues: (ref) v_u_4, (copy) v_u_19, (copy) v_u_11, (ref) v_u_3, (copy) v_u_6
        v_u_4:SelectLobbyMenu("Masteries")
        if v_u_19._index then
            local v16 = v_u_19._index
            v_u_19._index = nil
            v_u_19._productPromptCallback = nil
            local v17, v18 = v_u_3:RequestSkipItemRedeem(v16):expect()
            if v17 then
                v_u_6.fromName("LevelUpReward")({})
            else
                v_u_11:Warn((("Failed to redeem mastery skip item: %*"):format(v18)))
            end
        else
            v_u_11:Warn("Failed to use skip: Index not found.")
            return
        end
    end,
    ["_canShow"] = function()
        -- upvalues: (copy) v_u_19
        return v_u_19._skipItemCount:get() > 0
    end
}
return v_u_19