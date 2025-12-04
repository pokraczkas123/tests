-- Decompiled game.ReplicatedFirst.Controllers.ChangelogController

local v_u_1 = Color3.fromRGB(68, 255, 0)
local v_u_2 = Color3.fromRGB(207, 90, 0)
local v3 = game:GetService("ReplicatedFirst")
local v4 = game:GetService("ReplicatedStorage")
local v_u_5 = nil
local v_u_6 = nil
local v_u_7 = nil
local v_u_8 = require(v4.Common.State)
local v_u_9 = require(v4.Packages.Knit)
local v_u_10 = require(v4.Tools.Logger)
local v_u_11 = require(v4.Content.Update)
local v_u_12 = require(v4.Packages.Fusion)
local v_u_13 = require(v3.Components.Button)
local v_u_14 = require(v4.Configuration.Game)
local v_u_15 = require(v3.Components.FitScrollingFrame)
local v16 = v_u_9.CreateController({
    ["Name"] = "ChangelogController"
})
function v16.KnitStart(p_u_17)
    -- upvalues: (ref) v_u_5, (copy) v_u_9, (ref) v_u_6, (ref) v_u_7, (copy) v_u_12, (copy) v_u_11
    v_u_5 = v_u_9.GetController("InterfaceController")
    v_u_6 = v_u_9.GetController("InputController")
    v_u_7 = v_u_9.GetService("GameService")
    p_u_17.IsVisible = v_u_12.Value(false)
    p_u_17.IsHelpVisible = v_u_12.Value(false)
    p_u_17.Id = p_u_17:BindToUpdateId()
    p_u_17.Update = v_u_12.Computed(function()
        -- upvalues: (ref) v_u_11, (copy) p_u_17
        return v_u_11:Get(p_u_17.Id:get())
    end)
    p_u_17.Component = p_u_17:LoadComponent()
end
function v16.Show(p18)
    -- upvalues: (ref) v_u_5, (ref) v_u_7
    local v19 = ("Update%*"):format(p18.Update:get().Id)
    if v_u_5.Flags:get()[v19] ~= true then
        p18.IsVisible:set(true)
        v_u_5:SelectLobbyMenu("")
        v_u_7:SetFlag(v19)
    end
end
function v16.BindToUpdateId(_)
    -- upvalues: (copy) v_u_12, (copy) v_u_11
    return v_u_12.Value(v_u_11:GetCurrent().Id)
end
function v16.LoadComponent(p_u_20)
    -- upvalues: (copy) v_u_12, (ref) v_u_5, (copy) v_u_10, (ref) v_u_6, (copy) v_u_13, (copy) v_u_8, (copy) v_u_14, (copy) v_u_15, (copy) v_u_11, (copy) v_u_1, (copy) v_u_2
    local v_u_21 = v_u_12.Hydrate(v_u_5.App.Lobby.Changelog)({
        ["Visible"] = p_u_20.IsVisible
    })
    local v22 = v_u_12.Hydrate(v_u_5.App.Lobby.HowToPlay)({
        ["Visible"] = p_u_20.IsHelpVisible
    })
    task.spawn(function()
        -- upvalues: (ref) v_u_5, (ref) v_u_10, (ref) v_u_12, (ref) v_u_6
        for v23 = 1, 3 do
            local v_u_24 = v_u_5.App.Lobby.HowToPlay.BGFrame.Gradient:FindFirstChild((("Body%*"):format(v23)))
            if v_u_24 then
                v_u_12.Hydrate(v_u_24.Key)({
                    ["Visible"] = v_u_12.Computed(function()
                        -- upvalues: (ref) v_u_6
                        return v_u_6.InputType:get() ~= v_u_6.Type.Mobile
                    end),
                    ["Image"] = v_u_12.Computed(function()
                        -- upvalues: (ref) v_u_6, (ref) v_u_10, (copy) v_u_24
                        local v25 = v_u_6.CustomKeybinds:get().Bump
                        if v25 then
                            return v_u_6:GetImageForKeycode(v_u_6.InputType:get() == v_u_6.Type.Console and v25.Console or v25.Keyboard)
                        end
                        v_u_10:Warn("No keybinds found for Bump")
                        return v_u_24.Key.Image
                    end)
                })
                local v_u_26 = v_u_24.Text
                v_u_12.Hydrate(v_u_24)({
                    ["Text"] = v_u_12.Computed(function()
                        -- upvalues: (ref) v_u_6, (copy) v_u_26
                        if v_u_6.InputType:get() == v_u_6.Type.Mobile then
                            return v_u_26:gsub("Click", "Tap")
                        else
                            return v_u_26
                        end
                    end)
                })
            else
                v_u_10:Warn("Key not found")
            end
        end
    end)
    local v_u_27 = v_u_12.Computed(function()
        -- upvalues: (copy) p_u_20
        return p_u_20.Update:get().Header
    end)
    local v28 = v_u_12.Computed(function()
        -- upvalues: (copy) p_u_20
        return p_u_20.Update:get().Content
    end)
    local v_u_29 = v_u_12.Computed(function()
        -- upvalues: (copy) p_u_20
        return ("UPDATE %*"):format(p_u_20.Update:get().Id):upper()
    end)
    local v_u_30 = v_u_12.Computed(function()
        -- upvalues: (copy) p_u_20
        return p_u_20.Update:get().SplashImage
    end)
    v_u_13(v_u_21.BGFrame.CloseBtn)({
        ["OnActivated"] = function()
            -- upvalues: (copy) p_u_20
            p_u_20.IsVisible:set(false)
        end
    })
    v_u_13(v_u_21.BGFrame.Body.Log.ImageButton)({
        ["OnActivated"] = function()
            -- upvalues: (copy) p_u_20
            p_u_20.IsHelpVisible:set(true)
        end
    })
    v_u_13(v22.BGFrame.CloseBtn)({
        ["OnActivated"] = function()
            -- upvalues: (copy) p_u_20
            p_u_20.IsHelpVisible:set(false)
        end
    })
    v_u_12.Hydrate(v_u_21.BGFrame.Body.Log.Title)({
        ["Text"] = v_u_12.Computed(function()
            -- upvalues: (copy) v_u_27
            return v_u_27:get()
        end)
    })
    v_u_12.Hydrate(v_u_21.BGFrame.Body.Log.ChangelogBody)({
        [v_u_12.Children] = v_u_12.ForPairs(v28, function(p31, p32)
            -- upvalues: (copy) v_u_21, (ref) v_u_12
            local v33 = p32.Type
            local v34 = p32.Body
            local v35 = v_u_21.BGFrame.Body.Log.ChangelogBody[v33]:Clone()
            v35.UpdateSlot.TextLabel.Text = v34
            v_u_12.Hydrate(v35)({
                ["Visible"] = true,
                ["Parent"] = v_u_21.BGFrame.Body.Log.ChangelogBody
            })
            return p31, v35
        end, v_u_12.cleanup)
    })
    v_u_12.Hydrate(v_u_21.BGFrame.Body.Showcase.Version.TextLabel)({
        ["Text"] = v_u_12.Computed(function()
            -- upvalues: (copy) v_u_29
            return v_u_29:get()
        end)
    })
    v_u_12.Hydrate(v_u_21.BGFrame.Body.Showcase.ShowcaseImage)({
        ["Image"] = v_u_12.Computed(function()
            -- upvalues: (copy) v_u_30
            return v_u_30:get()
        end)
    })
    local v36 = v_u_21.History.List.Template
    local v_u_37 = v_u_5:BindToPlayerAttribute(v_u_8.getKey(v_u_8.Id.User, "Level"), 0)
    v_u_12.Hydrate(v_u_21.History)({
        ["Visible"] = v_u_12.Computed(function()
            -- upvalues: (copy) v_u_37, (ref) v_u_14
            return v_u_37:get() >= v_u_14.AdvancedInterfaceRequirement
        end)
    })
    v_u_15(v_u_21.History.List, 60, Enum.SizeConstraint.RelativeYY)
    for _, v_u_38 in v_u_11:GetHistory() do
        local v39 = v36:Clone()
        v39.Name = ("%*"):format(v_u_38.Id)
        local v40 = v_u_38.Id
        v39.LayoutOrder = -tonumber(v40)
        v39.Update.Text = ("UPDATE %*"):format(v_u_38.Id)
        v39.Date.Text = DateTime.fromUnixTimestamp(v_u_38.Timestamp):FormatLocalTime("LL", "en-us")
        v_u_13(v39)({
            ["Visible"] = true,
            ["Parent"] = v_u_21.History.List,
            ["OnActivated"] = function()
                -- upvalues: (copy) p_u_20, (copy) v_u_38
                p_u_20.Id:set(v_u_38.Id)
            end
        })
        v_u_12.Hydrate(v39.UIStroke)({
            ["Color"] = v_u_12.Computed(function()
                -- upvalues: (copy) v_u_38, (copy) p_u_20, (ref) v_u_1, (ref) v_u_2
                if v_u_38.Id == p_u_20.Update:get().Id then
                    return v_u_1
                else
                    return v_u_2
                end
            end)
        })
        v_u_12.Hydrate(v39.Date)({
            ["TextColor3"] = v_u_12.Computed(function()
                -- upvalues: (copy) v_u_38, (copy) p_u_20, (ref) v_u_1, (ref) v_u_2
                if v_u_38.Id == p_u_20.Update:get().Id then
                    return v_u_1
                else
                    return v_u_2
                end
            end)
        })
        v_u_12.Hydrate(v39.Update)({
            ["TextColor3"] = v_u_12.Computed(function()
                -- upvalues: (copy) v_u_38, (copy) p_u_20, (ref) v_u_1, (ref) v_u_2
                if v_u_38.Id == p_u_20.Update:get().Id then
                    return v_u_1
                else
                    return v_u_2
                end
            end)
        })
    end
    v_u_13(v_u_5.App.Persistant.UpdateOpenerBtn)({
        ["Visible"] = v_u_12.Computed(function()
            -- upvalues: (ref) v_u_5
            return not v_u_5.InGame:get()
        end),
        ["OnActivated"] = function()
            -- upvalues: (copy) p_u_20, (ref) v_u_5
            p_u_20.IsVisible:set(not p_u_20.IsVisible:get())
            v_u_5:SelectLobbyMenu("")
        end
    })
    task.delay(3, function()
        -- upvalues: (copy) p_u_20
        p_u_20:Show()
    end)
    return v_u_21
end
return v16