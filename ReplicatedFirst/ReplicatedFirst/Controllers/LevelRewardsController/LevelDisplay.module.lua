-- Decompiled game.ReplicatedFirst.Controllers.LevelRewardsController.LevelDisplay

local v_u_1 = Color3.fromRGB(60, 255, 0)
local v_u_2 = Color3.new(1, 1, 1)
local v_u_3 = Color3.fromRGB(160, 0, 255)
local v_u_4 = game:GetService("Players")
local v5 = game:GetService("ReplicatedFirst")
local v6 = game:GetService("ReplicatedStorage")
local v_u_7 = nil
local v_u_8 = nil
local v_u_9 = require(v6.Packages.Knit)
local v_u_10 = require(v6.Packages.Fusion)
local v_u_11 = require(v6.Content.Level)
local v_u_12 = require(v6.Content.Reward)
local v_u_13 = require(v5.Components.Button)
local v_u_14 = require(v6.Tools.Debounce).new("LevelRewardsController", 1)
return function(p_u_15)
    -- upvalues: (ref) v_u_7, (copy) v_u_9, (ref) v_u_8, (copy) v_u_11, (copy) v_u_12, (copy) v_u_3, (copy) v_u_1, (copy) v_u_2, (copy) v_u_10, (copy) v_u_13, (copy) v_u_4, (copy) v_u_14
    v_u_7 = v_u_9.GetService("MonetizationService")
    v_u_8 = v_u_9.GetService("LevelService")
    local v_u_16 = {}
    for _ = 1, v_u_11.PageSize do
        local v17 = p_u_15.Component.BGFrame.Body.Ranks.Template:Clone()
        v17.Parent = p_u_15.Component.BGFrame.Body.Ranks
        v17.Visible = true
        table.insert(v_u_16, v17)
    end
    local function v_u_22(p18, p19, p20)
        -- upvalues: (ref) v_u_12
        p18.Icon.Image = ""
        if p18.Icon:FindFirstChild("ImageHolder") then
            p18.Icon.ImageHolder:Destroy()
        end
        local v21 = Instance.new("ImageLabel")
        v21.Name = "ImageHolder"
        v21.Parent = p18.Icon
        v21.Size = UDim2.fromScale(1, 1)
        v21.Image = ""
        v21.BackgroundTransparency = 1
        v21.ImageTransparency = p20 and 0 or 0.5
        v_u_12.setIcon(p19, v21)
    end
    local function v_u_34(p23)
        -- upvalues: (copy) v_u_16, (ref) v_u_11, (copy) p_u_15, (ref) v_u_3, (ref) v_u_1, (ref) v_u_2, (ref) v_u_12, (copy) v_u_22
        for v24, v25 in v_u_16 do
            local v26 = v_u_11.PageSize * p_u_15.CurrentPage:get() - v_u_11.PageSize + v24
            local v27 = v26 <= p_u_15.Level:get()
            local v28 = v_u_11.getReward(v26)
            local v29
            if v27 then
                if v26 <= p_u_15.ClientLevelRewardsClaimed:get() then
                    v29 = v_u_1
                else
                    v29 = v_u_2
                end
            else
                v29 = v_u_3
            end
            v25.ImageColor3 = v29
            v25.LockedGradient.Enabled = not v27
            v25.LevelNum.Text = v26
            v25.LevelNum.TextColor3 = v29
            local v30 = v28 or {}
            v25.Desc.Text = v30.Type == v_u_12.Type.Item and "" or ("%*"):format(v30.Value)
            v25.Desc.TextColor3 = v29
            if not p23 then
                v_u_22(v25, v28, v27)
            end
            local v31
            if v26 <= p_u_15.ClientLevelRewardsClaimed:get() then
                v31 = false
            else
                v31 = nil
            end
            local v32 = p_u_15.ClientLevelRewardsClaimed:get() <= v26 and v26 <= p_u_15.Level:get() and v31 == nil and true or v31
            local v33 = v25.SkipButton
            if v32 == nil or not v32 then
                v32 = v26 == p_u_15.Level:get() + 1
            end
            v33.Visible = v32
            v25.SkipButton.Text.Text = v26 == p_u_15.Level:get() + 1 and "Skip" or "Claim"
        end
    end
    v_u_10.Observer(p_u_15.CurrentPage):onChange(v_u_34)
    v_u_10.Observer(p_u_15.ClientLevelRewardsClaimed):onChange(function()
        -- upvalues: (copy) v_u_34
        v_u_34(true)
    end)
    v_u_10.Observer(p_u_15.Level):onChange(function()
        -- upvalues: (copy) v_u_34
        v_u_34(true)
    end)
    for v_u_35, v36 in v_u_16 do
        local v40 = {
            ["OnActivated"] = function()
                -- upvalues: (ref) v_u_11, (copy) p_u_15, (copy) v_u_35, (ref) v_u_4, (ref) v_u_14, (ref) v_u_7, (ref) v_u_8
                local v37 = v_u_11.PageSize * p_u_15.CurrentPage:get() - v_u_11.PageSize + v_u_35
                if v37 <= (v_u_4.LocalPlayer:GetAttribute("LevelClaimed") or 0) then
                    return
                elseif v_u_14:Has(v_u_4.LocalPlayer) then
                    return
                else
                    v_u_14:Set(v_u_4.LocalPlayer, 1)
                    if v37 == p_u_15.Level:get() + 1 then
                        v_u_7:RequestPurchase("SkipLevel")
                    else
                        local v38 = v_u_4.LocalPlayer
                        local v39 = v_u_4.LocalPlayer:GetAttribute("LevelClaimed") or 0
                        v38:SetAttribute("LevelClaimed", (math.max(v39, v37)))
                        v_u_8:ClaimLevelRewards(v37):await()
                    end
                end
            end
        }
        v_u_13(v36.SkipButton)(v40)
    end
    v_u_34()
    return p_u_15.Template
end