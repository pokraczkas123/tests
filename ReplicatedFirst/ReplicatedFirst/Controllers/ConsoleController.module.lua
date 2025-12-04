-- Decompiled game.ReplicatedFirst.Controllers.ConsoleController

local v_u_1 = game:GetService("Debris")
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("ReplicatedFirst")
local v4 = game:GetService("ReplicatedStorage")
local v_u_5 = game:GetService("TweenService")
local v_u_6 = nil
local v_u_7 = nil
local v_u_8 = require(v_u_3.Components.FitScrollingFrame)
local v_u_9 = require(v4.Packages.Fusion)
local v_u_10 = require(v_u_3.Components.Button)
local v_u_11 = require(v4.Tools.Logger).new(script.Name)
local v_u_12 = require(v4.Common.State)
local v_u_13 = require(v4.Packages.Knit)
local v_u_14 = require(script.TextCommand)
local v_u_15 = require(script.Command)
local v16 = v_u_13.CreateController({
    ["Name"] = "ConsoleController",
    ["Player"] = v_u_2.LocalPlayer
})
function v16.KnitInit(p_u_17)
    -- upvalues: (ref) v_u_6, (copy) v_u_13, (ref) v_u_7, (copy) v_u_9
    v_u_6 = v_u_13.GetService("ConsoleService")
    v_u_7 = v_u_13.GetController("InterfaceController")
    p_u_17.IsOpened = v_u_9.Value(false)
    p_u_17.Selected = v_u_9.Value("")
    task.spawn(function()
        -- upvalues: (copy) p_u_17
        p_u_17.Status = {
            "\226\156\133",
            "\226\154\160\239\184\143",
            "\226\157\140",
            "\226\140\155",
            "\226\143\179"
        }
        p_u_17.Commands = p_u_17:BindToCommands()
        p_u_17.App = p_u_17:LoadApp()
    end)
    v_u_6.Notification:Connect(function(...)
        -- upvalues: (copy) p_u_17
        p_u_17:Notify(...)
    end)
    v_u_6.Spectate:Connect(function(...)
        -- upvalues: (copy) p_u_17
        p_u_17:Spectate(...)
    end)
    v_u_6.TTS:Connect(function(...)
        -- upvalues: (copy) p_u_17
        p_u_17:TTS(...)
    end)
    v_u_6.DisplayData:Connect(function(...)
        -- upvalues: (copy) p_u_17
        p_u_17:DisplayData(...)
    end)
    v_u_6.Watermark:Connect(function()
        -- upvalues: (ref) v_u_7
        v_u_7.App.Persistant.Watermark.Visible = not v_u_7.App.Persistant.Watermark.Visible
        if v_u_7.Watermark then
            v_u_7.Watermark.Enabled = v_u_7.App.Persistant.Watermark.Visible
        end
    end)
end
function v16.BindToCommands(_)
    -- upvalues: (copy) v_u_9, (ref) v_u_6
    local v_u_18 = v_u_9.Value({})
    v_u_6.Commands:Observe(function(p19)
        -- upvalues: (copy) v_u_18
        v_u_18:set(p19)
    end)
    return v_u_18
end
function v16.LoadApp(p_u_20)
    -- upvalues: (copy) v_u_3, (copy) v_u_9, (copy) v_u_10, (copy) v_u_15, (copy) v_u_14, (ref) v_u_6, (copy) v_u_8
    local v21 = v_u_3.Assets.Console
    v21.Parent = p_u_20.Player.PlayerGui
    local v_u_22 = v_u_9.Hydrate(v21.Console)({
        ["Visible"] = p_u_20.IsOpened,
        ["Position"] = v_u_9.Spring(v_u_9.Computed(function()
            -- upvalues: (copy) p_u_20
            return p_u_20.IsOpened:get() and UDim2.fromScale(0.5, 0.5) or UDim2.new(0.5, 0, 0.5, 20)
        end), 60, 2)
    })
    v_u_10(v_u_22.Close)({
        ["OnActivated"] = function()
            -- upvalues: (copy) p_u_20
            p_u_20.IsOpened:set(false)
        end
    })
    v_u_9.Hydrate(v_u_22.ScrollingFrame)({
        [v_u_9.Children] = v_u_9.ForPairs(p_u_20.Commands, function(p23, p24)
            -- upvalues: (ref) v_u_15, (copy) v_u_22, (copy) p_u_20, (ref) v_u_14, (ref) v_u_6
            local v25 = v_u_15({
                ["Component"] = v_u_22.ScrollingFrame.Template:Clone(),
                ["Id"] = p24.Id,
                ["Prefix"] = "/",
                ["Aliases"] = p24.Aliases,
                ["Arguments"] = p24.Arguments,
                ["Description"] = p24.Description,
                ["Permission"] = p24.Permission,
                ["IsLocked"] = p24.IsLocked,
                ["Selected"] = p_u_20.Selected
            })
            local v26
            if p24.IsLocked then
                v26 = nil
            else
                v26 = v_u_14({
                    ["Prefix"] = "/",
                    ["Id"] = p24.Id,
                    ["Aliases"] = p24.Aliases,
                    ["Callback"] = function(p27)
                        -- upvalues: (ref) v_u_6, (ref) p_u_20
                        local v28, v29 = v_u_6:RequestCommand(p27):expect()
                        if v29 then
                            p_u_20:Notify({
                                ["Body"] = v29,
                                ["Status"] = v28
                            })
                        end
                    end
                })
            end
            return p23, v25, v26
        end, v_u_9.cleanup)
    })
    v_u_8(v_u_22.ScrollingFrame, 30)
    v_u_14({
        ["Prefix"] = "/",
        ["Id"] = "Commands",
        ["Aliases"] = { "cmds", "cmd" },
        ["Callback"] = function(_)
            -- upvalues: (copy) p_u_20
            p_u_20.IsOpened:set(not p_u_20.IsOpened:get())
        end
    })
    return v21
end
function v16.Notify(p30, p31)
    -- upvalues: (copy) v_u_1, (copy) v_u_5
    if p31.Timestamp then
        p31.Body = p31.Body:format(DateTime.fromUnixTimestamp(p31.Timestamp):FormatLocalTime("LT", "en-us"))
    end
    p31.Duration = p31.Duration or 5
    local v_u_32 = p30.App.Notifications.Template:Clone()
    v_u_1:AddItem(v_u_32, p31.Duration + 1)
    v_u_32.Body.Text = ("%* %*"):format(p30.Status[p31.Status] or "\226\157\148", p31.Body)
    v_u_32.Parent = p30.App.Notifications
    local v33 = os.clock() * 100
    v_u_32.LayoutOrder = -math.round(v33)
    v_u_32.Name = v_u_32.LayoutOrder
    v_u_32.Visible = true
    task.delay(p31.Duration, function()
        -- upvalues: (ref) v_u_5, (copy) v_u_32
        v_u_5:Create(v_u_32, TweenInfo.new(1), {
            ["GroupTransparency"] = 1
        }):Play()
    end)
end
function v16.Spectate(p34, p35)
    -- upvalues: (copy) v_u_12, (copy) v_u_2
    local v_u_36 = workspace.CurrentCamera
    if p34.Spectating then
        p34.Spectating:Disconnect()
        p34.Spectating = nil
    end
    if p35 then
        local v37 = v_u_2:FindFirstChild(p35)
        if v37 then
            p34.Spectating = v37.CharacterAdded:Connect(function(p38)
                -- upvalues: (copy) v_u_36
                v_u_36.CameraSubject = p38:WaitForChild("Humanoid")
            end)
            if v37.Character then
                v_u_36.CameraSubject = v37.Character:WaitForChild("Humanoid")
            end
            v_u_12.set(p34.Player, v_u_12.Id.Gameplay, "InGame", true)
        end
    else
        p34.Spectating = nil
        v_u_12.set(p34.Player, v_u_12.Id.Gameplay, "InGame", false)
        v_u_36.CameraSubject = p34.Player.Character
        return
    end
end
function v16.TTS(_, p39, p40)
    -- upvalues: (copy) v_u_2
    local v_u_41 = Instance.new("AudioTextToSpeech")
    v_u_41.Parent = v_u_2.LocalPlayer
    v_u_41.Text = p39
    v_u_41.VoiceId = p40
    v_u_41.Speed = 1
    v_u_41.Volume = 3
    local v_u_42 = Instance.new("AudioDeviceOutput")
    v_u_42.Parent = v_u_2.LocalPlayer
    local v_u_43 = Instance.new("Wire")
    v_u_43.SourceInstance = v_u_41
    v_u_43.TargetInstance = v_u_42
    v_u_43.Parent = v_u_2.LocalPlayer
    v_u_41.Ended:Once(function()
        -- upvalues: (copy) v_u_41, (copy) v_u_42, (copy) v_u_43
        v_u_41:Destroy()
        v_u_42:Destroy()
        v_u_43:Destroy()
    end)
    v_u_41:Play()
end
function v16.DisplayData(_, p44)
    -- upvalues: (copy) v_u_11
    v_u_11:PrintTable(p44)
end
return v16