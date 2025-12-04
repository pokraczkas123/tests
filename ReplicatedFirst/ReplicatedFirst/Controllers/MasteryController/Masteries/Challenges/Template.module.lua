-- Decompiled game.ReplicatedFirst.Controllers.MasteryController.Masteries.Challenges.Template

local v_u_1 = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(253, 72, 0)),
    ColorSequenceKeypoint.new(0.271, Color3.fromRGB(254, 114, 0)),
    ColorSequenceKeypoint.new(0.523, Color3.fromRGB(255, 136, 0)),
    ColorSequenceKeypoint.new(0.936, Color3.fromRGB(253, 236, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(254, 254, 188))
})
local v_u_2 = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(61, 0, 136)), ColorSequenceKeypoint.new(0.877, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(185, 255, 240)) })
local v_u_3 = Color3.fromRGB(255, 200, 0)
local v_u_4 = Color3.fromRGB(13, 255, 0)
local v_u_5 = Color3.fromRGB(0, 179, 255)
local v_u_6 = Color3.fromRGB(207, 104, 0)
local v_u_7 = Color3.fromRGB(30, 156, 1)
local v_u_8 = Color3.fromRGB(0, 110, 206)
local v9 = game:GetService("ReplicatedFirst")
local v10 = game:GetService("ReplicatedStorage")
local v_u_11 = nil
local v_u_12 = nil
local v_u_13 = nil
local v_u_14 = require(v10.Configuration.Game)
local v_u_15 = require(script.Parent.Parent.Parent.SkipMenu)
local v_u_16 = require(v10.Packages.Fusion)
local v_u_17 = require(v9.Components.Button)
require(script.Parent.Parent.Parent.Types)
require(v10.Content.Quest)
local v_u_18 = require(v10.Packages.Knit)
local v_u_19 = require(v10.Tools.Sound)
return function(p_u_20)
    -- upvalues: (ref) v_u_13, (copy) v_u_18, (ref) v_u_11, (ref) v_u_12, (copy) v_u_16, (copy) v_u_2, (copy) v_u_1, (copy) v_u_8, (copy) v_u_6, (copy) v_u_7, (copy) v_u_5, (copy) v_u_3, (copy) v_u_4, (copy) v_u_17, (copy) v_u_14, (copy) v_u_19, (copy) v_u_15
    v_u_13 = v_u_13 or v_u_18.GetController("GameController")
    v_u_11 = v_u_11 or v_u_18.GetService("MasteryService")
    v_u_12 = v_u_12 or v_u_18.GetService("MonetizationService")
    v_u_16.Hydrate(p_u_20.Component.Description)({
        ["Text"] = p_u_20.Quest.Description or "No Description Available"
    })
    local v21 = p_u_20.Component.BarBack.Bar
    local v_u_22 = p_u_20.RawQuest.Claimed
    local v23 = (p_u_20.Quest and (p_u_20.Quest.Progress or 0) or 0) / (p_u_20.Quest and (p_u_20.Quest.Requirement or 1) or 1)
    local v_u_24 = math.clamp(v23, 0, 1)
    v_u_16.Hydrate(v21)({
        ["Visible"] = v_u_24 > 0,
        ["Size"] = UDim2.fromScale(v_u_24, v21.Size.Y.Scale)
    })
    local v25 = v_u_16.Hydrate(v21.UIGradient)
    local v26 = {}
    local v27
    if v_u_22 then
        v27 = v_u_2
    else
        v27 = v_u_1
    end
    v26.Color = v27
    v25(v26)
    local v28 = v_u_16.Hydrate(v21.UIStroke)
    local v29 = {}
    local v30
    if v_u_22 then
        v30 = Color3.fromRGB(0, 123, 255)
    else
        v30 = Color3.fromRGB(255, 179, 0)
    end
    v29.Color = v30
    v28(v29)
    v_u_16.Hydrate(p_u_20.Component.ActionBtn)({
        ["Image"] = v_u_22 and "rbxassetid://133905624301401" or v_u_24 >= 1 and "rbxassetid://84149675181671" or "rbxassetid://90820493738858"
    })
    v_u_16.Hydrate(p_u_20.Component.ActionBtn.TextLabel)({
        ["Text"] = v_u_22 and "COMPLETED" or v_u_24 >= 1 and "COMPLETE" or "SKIP"
    })
    local v31 = v_u_16.Hydrate(p_u_20.Component.ActionBtn.TextLabel.UIStroke)
    local v32 = {}
    local v33
    if v_u_22 then
        v33 = v_u_8
    elseif v_u_24 >= 1 then
        v33 = v_u_6
    else
        v33 = v_u_7
    end
    v32.Color = v33
    v31(v32)
    local v34 = v_u_16.Hydrate(p_u_20.Component.Glow)
    local v35 = {}
    local v36
    if v_u_22 then
        v36 = v_u_5
    elseif v_u_24 >= 1 then
        v36 = v_u_3
    else
        v36 = v_u_4
    end
    v35.ImageColor3 = v36
    v34(v35)
    local v42 = {
        ["OnActivated"] = function()
            -- upvalues: (copy) v_u_22, (copy) v_u_24, (ref) v_u_11, (copy) p_u_20, (ref) v_u_13, (ref) v_u_14, (ref) v_u_19, (ref) v_u_15, (ref) v_u_12
            if not v_u_22 then
                if v_u_24 >= 1 then
                    local v37, v38 = v_u_11:RequestClaim(p_u_20.QuestIndex)
                    if v38 then
                        local v39 = v_u_13
                        local v40 = {
                            ["Body"] = v38
                        }
                        local v41
                        if v37 then
                            v41 = v_u_14.Notification.Color.Blue
                        else
                            v41 = v_u_14.Notification.Color.Red
                        end
                        v40.Color = v41
                        v39:Notify(v40)
                    end
                    if v37 then
                        v_u_19.fromName("SeasonalReward")({})
                        return
                    end
                else
                    v_u_15.prompt(p_u_20.QuestIndex, function()
                        -- upvalues: (ref) v_u_12, (ref) p_u_20
                        v_u_12:RequestPurchaseName((("MasterySkip%*_%*"):format(p_u_20.CurrentLevel:get(), p_u_20.QuestIndex)))
                    end)
                end
            end
        end
    }
    v_u_17(p_u_20.Component.ActionBtn)(v42)
    p_u_20.Component.Visible = true
    return p_u_20.Component
end