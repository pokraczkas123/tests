-- Decompiled game.ReplicatedFirst.Controllers.PartyController.Player

local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedFirst")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = nil
local v_u_5 = nil
local v_u_6 = nil
local v_u_7 = nil
local v_u_8 = nil
local v_u_9 = require(v3.Packages.Knit)
local v_u_10 = require(v3.Packages.Fusion)
local v_u_11 = require(v3.Configuration.Game)
local v_u_12 = require(v2.Components.Button)
local v_u_13 = require(v3.Common.State)
return function(p_u_14)
    -- upvalues: (ref) v_u_4, (copy) v_u_9, (ref) v_u_5, (ref) v_u_6, (ref) v_u_7, (ref) v_u_8, (copy) v_u_10, (copy) v_u_1, (copy) v_u_13, (copy) v_u_12, (copy) v_u_11
    v_u_4 = v_u_9.GetController("PlayerController")
    v_u_5 = v_u_9.GetController("InterfaceController")
    v_u_6 = v_u_9.GetService("PartyService")
    v_u_7 = v_u_9.GetController("GameController")
    v_u_8 = v_u_9.GetController("InputController")
    local v_u_18 = v_u_10.Computed(function()
        -- upvalues: (ref) v_u_5, (copy) p_u_14
        local v15 = v_u_5.Party:get() or {}
        local v16 = p_u_14.Player
        local v17
        if typeof(v16) == "table" then
            v17 = p_u_14.Player:get()
        else
            v17 = p_u_14.Player
        end
        if v17 then
            return table.find(v15, v17) ~= nil
        else
            return false
        end
    end)
    local v_u_20 = v_u_10.Computed(function()
        -- upvalues: (copy) v_u_18, (ref) v_u_5, (ref) v_u_1
        local v19 = v_u_18:get()
        if v19 then
            v19 = v_u_5.Party:get()[1] == v_u_1.LocalPlayer
        end
        return v19
    end)
    local v_u_23 = v_u_10.Computed(function()
        -- upvalues: (copy) p_u_14, (ref) v_u_4, (ref) v_u_13
        local v21 = p_u_14.Player
        local v22
        if typeof(v21) == "table" then
            v22 = p_u_14.Player:get()
        else
            v22 = p_u_14.Player
        end
        return not v22 and {} or v_u_4.Players:get()[v22.UserId] or {
            ["Name"] = "NOT_LOADED",
            ["DisplayName"] = "NOT_LOADED",
            ["Instance"] = v22,
            ["Headshot"] = v_u_13.get(v22, v_u_13.Id.Cache, ("Headshot%*"):format(Enum.ThumbnailSize.Size100x100.Name), "")
        }
    end)
    local v24 = v_u_10.Computed(function()
        -- upvalues: (copy) v_u_20, (copy) v_u_23, (ref) v_u_1
        return v_u_20:get() and v_u_23:get().Instance ~= v_u_1.LocalPlayer and "KICK" or "LEAVE"
    end)
    local v26 = v_u_10.Hydrate(p_u_14.Component:Clone())({
        ["Name"] = p_u_14.Player and (p_u_14.Player.DisplayName or "Empty") or "Empty",
        ["Visible"] = v_u_10.Computed(function()
            -- upvalues: (copy) p_u_14
            local v25 = p_u_14.Player
            if typeof(v25) == "table" then
                return p_u_14.Player:get()
            else
                return p_u_14.Player
            end
        end, v_u_10.doNothing),
        ["Parent"] = p_u_14.Parent
    })
    v_u_12(v26.InviteButton)({
        ["Visible"] = v_u_10.Computed(function()
            -- upvalues: (copy) v_u_18, (copy) v_u_20, (ref) v_u_1
            local v27 = not v_u_18:get()
            if v27 then
                v27 = v_u_20:get() ~= v_u_1.LocalPlayer
            end
            return v27
        end),
        ["OnActivated"] = function()
            -- upvalues: (copy) p_u_14, (ref) v_u_6, (ref) v_u_7, (ref) v_u_11
            local v28 = p_u_14.Player
            local v29
            if typeof(v28) == "table" then
                v29 = p_u_14.Player:get()
            else
                v29 = p_u_14.Player
            end
            if v29 then
                local v30 = v_u_6:RequestPartyInvitation(v29.UserId):expect()
                local v31 = v_u_7
                local v32 = {
                    ["Body"] = v30 or ("Invited %* to the party!"):format(v29.Name)
                }
                local v33
                if v30 then
                    v33 = nil
                else
                    v33 = v_u_11.Notification.Color.Green
                end
                v32.Color = v33
                v31:Notify(v32)
            end
        end
    })
    v_u_12(v26.KickButton)({
        ["Visible"] = v_u_10.Computed(function()
            -- upvalues: (copy) v_u_18, (ref) v_u_5, (copy) v_u_20, (copy) v_u_23, (ref) v_u_1
            local v34 = v_u_18:get()
            if v34 then
                v34 = #v_u_5.Party:get() or {} <= 1 or v_u_20:get() or v_u_23:get().Instance == v_u_1.LocalPlayer
            end
            return v34
        end),
        ["Text"] = v24,
        ["OnActivated"] = function()
            -- upvalues: (copy) p_u_14, (ref) v_u_6, (ref) v_u_7
            local v35 = p_u_14.Player
            local v36
            if typeof(v35) == "table" then
                v36 = p_u_14.Player:get()
            else
                v36 = p_u_14.Player
            end
            local v37 = v36 and v_u_6:RequestPartyKick(v36.UserId):expect()
            if v37 then
                v_u_7:Notify({
                    ["Body"] = v37
                })
            end
        end
    })
    v_u_10.Hydrate(v26.KickButton.Action)({
        ["Text"] = v24
    })
    v_u_10.Hydrate(v26.AvatarFrame)({
        ["Image"] = v_u_10.Computed(function()
            -- upvalues: (copy) v_u_23
            return v_u_23:get().Headshot or ""
        end)
    })
    v_u_10.Hydrate(v26.PlayerName)({
        ["Text"] = v_u_10.Computed(function()
            -- upvalues: (copy) v_u_23
            return v_u_23:get().DisplayName or ""
        end)
    })
    v_u_10.Hydrate(v26.PlayerUser)({
        ["Text"] = v_u_10.Computed(function()
            -- upvalues: (copy) v_u_23
            return v_u_23:get().Name or ""
        end)
    })
    v_u_10.Hydrate(v26.PlayerName.PlatformIcon)({
        ["Image"] = v_u_10.Computed(function()
            -- upvalues: (copy) v_u_23, (ref) v_u_8, (ref) v_u_13
            local v38 = (v_u_23:get() or {}).Instance
            if v38 then
                return v_u_8.Icon[v_u_13.get(v38, v_u_13.Id.User, "InputType")] or v_u_8.Icon.Computer
            else
                return v_u_8.Icon.Computer
            end
        end)
    })
    return v26
end