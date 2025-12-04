-- Decompiled game.ReplicatedFirst.Controllers.GameController.PowerBar

local v1 = game:GetService("Players")
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("TweenService")
local v_u_5 = v1.LocalPlayer
local v_u_6 = require(v_u_2.Packages.Fusion)
local v_u_7 = require(v_u_2.Configuration.Game)
require(v_u_2.Content.Special)
local v_u_8 = require(v_u_2.Packages.Knit)
return function(p_u_9)
    -- upvalues: (copy) v_u_8, (copy) v_u_7, (copy) v_u_6, (copy) v_u_5, (copy) v_u_2, (copy) v_u_3, (copy) v_u_4
    local v_u_10 = v_u_8.GetController("SpecialController")
    local v_u_11 = v_u_8.GetController("InputController")
    local v_u_12 = v_u_11:GetInputTypeValueAsync()
    local v_u_13 = Instance.new("NumberValue")
    local v_u_14 = Instance.new("NumberValue")
    local v_u_15 = -v_u_7.Physics.ChargeBarVelocity
    local v_u_16 = -1
    local v_u_17 = v_u_6.Value((v_u_5.Character or v_u_5.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart"))
    local v_u_18 = 0
    v_u_5.CharacterAdded:Connect(function(p19)
        -- upvalues: (copy) v_u_17
        v_u_17:set(p19:WaitForChild("HumanoidRootPart"))
    end)
    local v_u_21 = v_u_6.Hydrate(v_u_2.Assets.Misc.ShotChargeMeter:Clone())({
        ["Enabled"] = v_u_6.Computed(function()
            -- upvalues: (copy) p_u_9
            local v20
            if p_u_9.Charge:get() == nil then
                v20 = false
            else
                v20 = p_u_9.IsPlaying:get()
            end
            return v20
        end),
        ["Parent"] = v_u_17
    }).ChargedMeter.UIGradient
    local v_u_24 = v_u_6.Computed(function()
        -- upvalues: (copy) v_u_10
        local v22 = v_u_10.Special:get()
        local v23
        if v22 == nil or v22.Id ~= "TimeskipToru" then
            v23 = false
        else
            v23 = v22.Metadata.ServeRequirement >= 1
        end
        return v23
    end)
    v_u_6.Hydrate(p_u_9.Component.ExtraPower)({
        ["Visible"] = v_u_24
    })
    v_u_6.Hydrate(p_u_9.Component)({
        ["Visible"] = v_u_6.Computed(function()
            -- upvalues: (copy) p_u_9
            return p_u_9.Visible:get()
        end),
        ["Position"] = v_u_6.Computed(function()
            -- upvalues: (copy) v_u_12, (copy) v_u_11
            if v_u_12:get() == v_u_11.Type.Mobile then
                return UDim2.fromScale(0.5, 0.76)
            else
                return UDim2.fromScale(0.5, 0.8)
            end
        end)
    })
    v_u_3.Heartbeat:Connect(function(p25)
        -- upvalues: (copy) p_u_9, (copy) v_u_13, (ref) v_u_18, (ref) v_u_7, (copy) v_u_14, (ref) v_u_16, (copy) v_u_15, (copy) v_u_21
        if p_u_9.Component.Parent ~= nil then
            if p_u_9.IsServing:get() then
                p_u_9.Component.Arrow.Position = UDim2.fromScale(v_u_13.Value * 0.98, 0.948)
            end
            if p_u_9.Charge:get() then
                if os.clock() - v_u_18 < v_u_7.Physics.AdvancedMovesPowerDelay then
                    v_u_14.Value = 1
                else
                    v_u_16 = 1
                    local v26 = v_u_14
                    local v27 = v_u_14.Value + v_u_16 * v_u_15 * p25
                    v26.Value = math.clamp(v27, 0, 1)
                end
                v_u_21.Offset = Vector2.new(0, -v_u_14.Value * 0.96 + 0.48)
            end
        end
    end)
    local v28 = v_u_6.Observer(p_u_9.Charge)
    v28:onChange(function()
        -- upvalues: (copy) p_u_9, (copy) v_u_14, (ref) v_u_18
        local v29 = p_u_9.Charge:get()
        if v29 then
            v_u_14.Value = v29
            v_u_18 = os.clock()
        else
            v_u_14.Value = 1
        end
    end)
    v28:update()
    task.spawn(function()
        -- upvalues: (copy) v_u_24, (ref) v_u_4, (copy) v_u_13
        while task.wait(0.5) do
            local v30 = v_u_24:get()
            local v31 = v_u_4
            local v32 = v_u_13
            local v33 = TweenInfo.new
            local v34 = 0.5
            local v35
            if v30 then
                v35 = Enum.EasingStyle.Cubic
            else
                v35 = Enum.EasingStyle.Quad
            end
            v31:Create(v32, v33(v34, v35, Enum.EasingDirection.In), {
                ["Value"] = v30 and 1.1 or 1
            }):Play()
            task.wait(0.5)
            local v36 = v_u_4
            local v37 = v_u_13
            local v38 = TweenInfo.new
            local v39 = 0.5
            local v40
            if v30 then
                v40 = Enum.EasingStyle.Cubic
            else
                v40 = Enum.EasingStyle.Quad
            end
            v36:Create(v37, v38(v39, v40, Enum.EasingDirection.Out), {
                ["Value"] = 0
            }):Play()
        end
    end)
    local v41 = p_u_9.Component.Parent.UltimateCharge.SpecialCharge
    local v_u_42 = v41.Position
    v_u_6.Hydrate(v41)({
        ["Visible"] = v_u_6.Computed(function()
            -- upvalues: (copy) p_u_9, (copy) v_u_10
            if p_u_9.IsServing:get() then
                return false
            else
                return v_u_10.ChargeVisibility:get()
            end
        end),
        ["Position"] = v_u_6.Spring(v_u_6.Computed(function()
            -- upvalues: (copy) v_u_10, (copy) v_u_42
            local v43 = v_u_10.CurrentDirection:get()
            local v44
            if v43 then
                if v43 == "Forward" then
                    v44 = Vector2.new(0, -2)
                elseif v43 == "Backward" then
                    v44 = Vector2.new(0, 2)
                elseif v43 == "Left" then
                    v44 = Vector2.new(-2, 0)
                else
                    v44 = Vector2.new(2, 0)
                end
            else
                v44 = Vector2.new()
            end
            return v_u_42 + UDim2.fromOffset(v44.X, v44.Y)
        end), 10, 0.3)
    })
    v_u_6.Hydrate(v41.Fill.UIGradient)({
        ["Offset"] = v_u_6.Computed(function()
            -- upvalues: (copy) v_u_10
            local v45 = Vector2.new
            local v46 = v_u_10.ChargeSpring:get()
            return v45(math.clamp(v46, 0, 1) - 0.5, 0)
        end)
    })
    local v_u_47 = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(0.0502, Color3.fromRGB(251, 255, 0)),
        ColorSequenceKeypoint.new(0.348, Color3.fromRGB(254, 148, 0)),
        ColorSequenceKeypoint.new(0.497, Color3.fromRGB(255, 119, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(81, 0, 255))
    })
    v_u_6.Hydrate(v41.Fill.Frame.UIGradient)({
        ["Color"] = v_u_6.Computed(function()
            -- upvalues: (copy) v_u_10, (copy) v_u_47
            local v48 = v_u_10.Special:get()
            if v48 then
                if v48.Metadata and v48.Metadata.BarGradient and v48.Metadata.BarGradient.ChargedColor and v_u_10.SpecialActionActiveState:get() then
                    return v48.Metadata.BarGradient.ChargedColor
                else
                    return v48.Metadata and v48.Metadata.BarGradient and v48.Metadata.BarGradient.Color or v_u_47
                end
            else
                return v_u_47
            end
        end)
    })
    v_u_6.Hydrate(v41.Icon.ImageLabel)({
        ["Image"] = v_u_6.Computed(function()
            -- upvalues: (copy) v_u_10
            local v49 = v_u_10.Special:get()
            return v49 and (v49.Metadata and v49.Metadata.SpecialIcon and v49.Metadata.SpecialIcon.Id or "rbxassetid://130410786726999") or "rbxassetid://130410786726999"
        end),
        ["Rotation"] = v_u_6.Spring(v_u_6.Computed(function()
            -- upvalues: (copy) v_u_10
            local v50 = v_u_10.Direction:get()
            local v51 = v_u_10.Special:get()
            return v51 and v51.Metadata and v51.Metadata.SpecialIcon and -45 or (v50 and v50 ~= "Forward" and (v50 == "Backward" and 180 or v50 == "Left" and -90 or 90) or 0) + -60
        end), 20, 0.7)
    })
    local v_u_52 = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(0.467, Color3.fromRGB(255, 212, 0)),
        ColorSequenceKeypoint.new(0.801, Color3.fromRGB(255, 119, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(85, 0, 255))
    })
    v_u_6.Hydrate(v41.Icon.ImageLabel.UIGradient)({
        ["Color"] = v_u_6.Computed(function()
            -- upvalues: (copy) v_u_10, (copy) v_u_52
            local v53 = v_u_10.Special:get()
            if v53 and v53.Metadata and v53.Metadata.SpecialIcon and v53.Metadata.SpecialIcon.Gradient then
                return v53.Metadata.SpecialIcon.Gradient and v53.Metadata.SpecialIcon.Gradient or v_u_52
            else
                return v_u_52
            end
        end)
    })
    return {
        ["get"] = function()
            -- upvalues: (copy) p_u_9, (copy) v_u_13
            return p_u_9.Component.Arrow.Position.X.Scale >= 0.98 and 1 or v_u_13.Value
        end,
        ["getCharge"] = function()
            -- upvalues: (copy) v_u_14
            return v_u_14.Value
        end
    }
end