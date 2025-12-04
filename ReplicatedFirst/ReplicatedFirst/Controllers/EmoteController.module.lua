-- Decompiled game.ReplicatedFirst.Controllers.EmoteController

local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedFirst")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = nil
local v_u_5 = nil
local v_u_6 = nil
local v_u_7 = require(v3.Packages.Knit)
local v_u_8 = require(v3.Packages.Fusion)
local v_u_9 = require(v2.Components.Button)
local v_u_10 = require(script.EmoteWheel)
local v11 = v_u_7.CreateController({
    ["Name"] = "EmoteController",
    ["Player"] = v1.LocalPlayer
})
function v11.KnitStart(p_u_12)
    -- upvalues: (ref) v_u_4, (copy) v_u_7, (ref) v_u_5, (ref) v_u_6, (copy) v_u_10, (copy) v_u_9, (copy) v_u_8
    v_u_4 = v_u_7.GetController("InterfaceController")
    v_u_5 = v_u_7.GetService("DataService")
    v_u_6 = v_u_7.GetController("InputController")
    p_u_12.Emotes = p_u_12:BindToEmotesAsync()
    p_u_12.Visible = v_u_4.IsEmoteWheelVisible
    p_u_12.EmoteWheel = v_u_10({
        ["Component"] = v_u_4.App.Persistant.EmoteWheel,
        ["SelectedEmote"] = v_u_4.SelectedEmote,
        ["Emotes"] = p_u_12.Emotes,
        ["Visible"] = p_u_12.Visible
    })
    local v13 = v_u_9(v_u_4.App.Persistant.EmoteOpenerBtn)
    local v14 = {
        ["Visible"] = v_u_4.IsEmoteButtonVisible,
        ["Scale"] = {
            ["Base"] = 1,
            ["Hover"] = 1,
            ["Down"] = 1
        },
        ["OnActivated"] = function()
            -- upvalues: (copy) p_u_12
            p_u_12.Visible:set(not p_u_12.Visible:get())
        end
    }
    p_u_12.Button = v13(v14)
    local v_u_15 = v_u_6:GetKeybindForActionAsync("Emote")
    local v17 = {
        ["Keys"] = v_u_15,
        ["Action"] = function(p16)
            -- upvalues: (ref) v_u_4, (ref) v_u_6, (copy) p_u_12
            if p16 == Enum.UserInputState.Begin or p16 == Enum.UserInputState.End then
                if v_u_4.SelectedEmote:get() == nil then
                    if v_u_6:GetInputType() == v_u_6.Type.Console then
                        if p16 == Enum.UserInputState.Begin then
                            p_u_12.Visible:set(not p_u_12.Visible:get())
                        end
                    else
                        p_u_12.Visible:set(p16 == Enum.UserInputState.Begin)
                    end
                    return Enum.ContextActionResult.Sink
                end
            end
        end
    }
    v_u_6:Bind("Emote")(v17)
    v_u_8.Hydrate(p_u_12.Button.Key)({
        ["Image"] = v_u_8.Computed(function()
            -- upvalues: (ref) v_u_6, (copy) v_u_15
            local v18 = v_u_6
            local v19
            if v_u_6.InputType:get() == v_u_6.Type.Console then
                v19 = v_u_15[2]
            else
                v19 = v_u_15[1]
            end
            return v18:GetImageForKeycode(v19)
        end),
        ["Visible"] = v_u_8.Computed(function()
            -- upvalues: (ref) v_u_6
            return v_u_6.InputType:get() ~= v_u_6.Type.Mobile
        end)
    })
end
function v11.BindToEmotesAsync(_)
    -- upvalues: (copy) v_u_8, (ref) v_u_5
    local v_u_20 = v_u_8.Value(v_u_5:Get("Equipped"):expect().Emotes)
    v_u_5.ProfileUpdated:Connect(function(p21, p22)
        -- upvalues: (copy) v_u_20
        if p21 == "Equipped" then
            v_u_20:set(p22.Emotes)
        end
    end)
    return v_u_20
end
return v11