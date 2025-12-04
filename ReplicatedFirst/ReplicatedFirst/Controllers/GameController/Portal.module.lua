-- Decompiled game.ReplicatedFirst.Controllers.GameController.Portal

local v_u_1 = TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("Players")
local v_u_5 = require(v_u_2.Tools.Time)
local v_u_6 = require(v_u_2.Common.State)
local v_u_7 = require(v_u_2.Configuration.Game)
local v_u_8 = require(v_u_2.Tools.Utility).applyToAllTagged
local v25 = {
    ["Clock"] = v_u_2:GetAttribute("Clock"),
    ["State"] = v_u_2:GetAttribute("RoundState"),
    ["Messages"] = {
        [v_u_7.State.End] = "The game has ended.",
        [v_u_7.State.Intermission] = "Doors Open In %s",
        [v_u_7.State.Joining] = "Touch To Play",
        [v_u_7.State.Live] = "Touch To Play"
    },
    ["Init"] = function(p_u_9)
        -- upvalues: (copy) v_u_8, (copy) v_u_7, (copy) v_u_6, (copy) v_u_4
        v_u_8("PlayPortal", function(p10)
            -- upvalues: (copy) p_u_9
            p_u_9.Portal = p10
            p_u_9.Doors = { p10:WaitForChild("Doors"):WaitForChild("1"), p10:WaitForChild("Doors"):WaitForChild("2") }
            p_u_9.BillboardGui = p10:WaitForChild("BillboardGui")
        end)
        v_u_8("ClassicProServerBillboard", function(p_u_11)
            -- upvalues: (ref) v_u_7, (ref) v_u_6, (ref) v_u_4
            p_u_11.Text = ("UNLOCKS AT LVL %*"):format(v_u_7.ClassicProServerLevelRequirement)
            p_u_11.Visible = v_u_6.get(v_u_4.LocalPlayer, v_u_6.Id.User, "Level", 1) < v_u_7.ClassicProServerLevelRequirement
            if p_u_11.Visible then
                v_u_6.onChange(v_u_4.LocalPlayer, v_u_6.Id.User, "Level", function(p12)
                    -- upvalues: (copy) p_u_11, (ref) v_u_7
                    p_u_11.Visible = (p12 or 1) < v_u_7.ClassicProServerLevelRequirement
                end)
            end
        end)
        v_u_8("ProServerBillboard", function(p_u_13)
            -- upvalues: (ref) v_u_7, (ref) v_u_6, (ref) v_u_4
            p_u_13.Text = ("UNLOCKS AT LVL %*"):format(v_u_7.ProServerLevelRequirement)
            p_u_13.Visible = v_u_6.get(v_u_4.LocalPlayer, v_u_6.Id.User, "Level", 1) < v_u_7.ProServerLevelRequirement
            if p_u_13.Visible then
                v_u_6.onChange(v_u_4.LocalPlayer, v_u_6.Id.User, "Level", function(p14)
                    -- upvalues: (copy) p_u_13, (ref) v_u_7
                    p_u_13.Visible = (p14 or 1) < v_u_7.ProServerLevelRequirement
                end)
            end
        end)
        v_u_8("ProServerWall", function(p_u_15)
            -- upvalues: (ref) v_u_6, (ref) v_u_4, (ref) v_u_7
            if v_u_6.get(v_u_4.LocalPlayer, v_u_6.Id.User, "Level", 1) >= v_u_7.ProServerLevelRequirement then
                p_u_15:Destroy()
            else
                local v_u_16 = nil
                v_u_16 = v_u_6.onChange(v_u_4.LocalPlayer, v_u_6.Id.User, "Level", function(p17)
                    -- upvalues: (ref) v_u_7, (ref) v_u_16, (copy) p_u_15
                    if (p17 or 1) >= v_u_7.ProServerLevelRequirement then
                        v_u_16:Disconnect()
                        p_u_15:Destroy()
                    end
                end)
            end
        end)
        task.spawn(function()
            -- upvalues: (copy) p_u_9
            p_u_9:BindToClock()
        end)
    end,
    ["Update"] = function(p18)
        -- upvalues: (copy) v_u_5
        if p18.BillboardGui then
            p18.BillboardGui.TextLabel.Text = p18.Messages[p18.State or 1]:format(v_u_5.format(p18.Clock or 0, "mm:ss")):upper()
        end
    end,
    ["UpdateRound"] = function(p19)
        -- upvalues: (copy) v_u_7, (copy) v_u_3, (copy) v_u_1
        local v20 = p19.State == v_u_7.State.End and true or p19.State == v_u_7.State.Intermission
        p19:Update()
        for v21, v22 in pairs(p19.Doors or {}) do
            local v23 = v22:GetAttribute("BaseCFrame")
            if not v23 then
                v22:SetAttribute("BaseCFrame", v22.CFrame)
                v23 = v22:GetAttribute("BaseCFrame")
            end
            if v20 then
                v23 = v23 * CFrame.new(0, 0, -1 ^ (v21 + 1) * 7.6)
            end
            v_u_3:Create(v22, v_u_1, {
                ["CFrame"] = v23
            }):Play()
        end
    end,
    ["BindToClock"] = function(p_u_24)
        -- upvalues: (copy) v_u_2
        v_u_2:GetAttributeChangedSignal("Clock"):Connect(function()
            -- upvalues: (copy) p_u_24, (ref) v_u_2
            p_u_24.Clock = v_u_2:GetAttribute("Clock")
            p_u_24:Update()
        end)
        v_u_2:GetAttributeChangedSignal("RoundState"):Connect(function()
            -- upvalues: (copy) p_u_24, (ref) v_u_2
            p_u_24.State = v_u_2:GetAttribute("RoundState")
            p_u_24:UpdateRound()
        end)
        p_u_24:UpdateRound()
    end
}
return v25