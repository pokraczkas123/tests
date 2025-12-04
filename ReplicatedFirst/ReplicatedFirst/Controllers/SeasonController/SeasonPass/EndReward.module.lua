-- Decompiled game.ReplicatedFirst.Controllers.SeasonController.SeasonPass.EndReward

local v1 = game:GetService("ReplicatedFirst")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = require(v2.Packages.Knit)
local v_u_4 = require(v2.Packages.Fusion)
local v_u_5 = require(v1.Components.Button)
local v_u_6 = require(v2.Content.Reward)
local v_u_7 = require(v2.Content.Item)
return function(p_u_8)
    -- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_6, (copy) v_u_7
    local v_u_9 = v_u_3.GetService("SeasonService")
    local v_u_10 = v_u_3.GetController("SeasonController")
    local v_u_11 = v_u_3.GetService("MonetizationService")
    p_u_8.Component.Visible = p_u_8.Season.Rebirth ~= nil
    if p_u_8.Season.Rebirth then
        local v_u_12 = {
            ["Claimed"] = 1,
            ["NeedsLevel"] = 2,
            ["NeedsRebirths"] = 3,
            ["NeedsPremium"] = 4,
            ["CanClaim"] = 5
        }
        local v_u_13 = #p_u_8.Season.Rewards.Regular
        local v_u_14 = p_u_8.Season.Rebirth.Requirement
        local v_u_15 = v_u_4.Computed(function()
            -- upvalues: (copy) p_u_8
            return p_u_8.Seasonal:get().Claimed.Rebirth ~= true
        end)
        local v_u_19 = v_u_4.Computed(function()
            -- upvalues: (copy) p_u_8, (copy) v_u_15, (copy) v_u_12, (copy) v_u_13, (copy) v_u_14
            local v16 = p_u_8.Seasonal:get() or {
                ["IsPremium"] = false,
                ["Rebirths"] = 0
            }
            local v17 = v16.IsPremium
            local v18 = v16.Rebirths
            if v_u_15:get() then
                if p_u_8.CurrentTier:get() < v_u_13 then
                    return v_u_12.NeedsLevel
                elseif v18 < v_u_14 then
                    return v_u_12.NeedsRebirths
                elseif v17 then
                    return v_u_12.CanClaim
                else
                    return v_u_12.NeedsPremium
                end
            else
                return v_u_12.Claimed
            end
        end)
        v_u_4.Hydrate(p_u_8.Component.Hint)({
            ["Text"] = v_u_4.Computed(function()
                -- upvalues: (copy) v_u_19, (copy) v_u_12, (copy) v_u_13, (copy) v_u_14
                local v20 = v_u_19:get()
                if v20 == v_u_12.Claimed then
                    return "You have claimed this reward!"
                elseif v20 == v_u_12.NeedsLevel then
                    return ("[PREMIUM] Unlocks at Lvl. %*"):format(v_u_13)
                else
                    return v20 ~= v_u_12.NeedsRebirths and (v20 == v_u_12.NeedsPremium and "Premium is needed to unlock this reward!" or "Claim your reward!") or ("%* Rebirths needed to unlock this reward!"):format(v_u_14)
                end
            end)
        })
        v_u_5(p_u_8.Component.InteractButton)({
            ["Visible"] = v_u_15,
            ["OnActivated"] = function()
                -- upvalues: (copy) v_u_15, (copy) v_u_19, (copy) v_u_12, (copy) v_u_10, (copy) v_u_13, (copy) v_u_11, (copy) v_u_9
                if v_u_15:get() then
                    local v21 = v_u_19:get()
                    if v21 == v_u_12.NeedsLevel then
                        v_u_10:PurchaseTiers(v_u_13)
                        return
                    elseif v21 == v_u_12.NeedsPremium then
                        v_u_11:RequestPurchaseName("SeasonalPremium")
                        return
                    elseif v21 == v_u_12.CanClaim then
                        v_u_9:RequestRebirthReward()
                        return
                    elseif v21 == v_u_12.NeedsRebirths then
                        v_u_10.Rebirth.Visible = true
                    else
                        print(v_u_19)
                    end
                else
                    return
                end
            end
        })
        v_u_4.Hydrate(p_u_8.Component.InteractGlow)({
            ["Visible"] = v_u_15
        })
        v_u_4.Hydrate(p_u_8.Component.InteractButton.Text)({
            ["Text"] = v_u_4.Computed(function()
                -- upvalues: (copy) v_u_19, (copy) v_u_12
                local v22 = v_u_19:get()
                return v22 == v_u_12.Claimed and "" or v22 == v_u_12.NeedsLevel and "BUY SKIPS!" or v22 == v_u_12.NeedsRebirths and "REBIRTH!" or v22 == v_u_12.NeedsPremium and "BUY PREMIUM!" or "CLAIM!"
            end)
        })
        v_u_6.setIcon(p_u_8.Season.Rebirth.Reward, p_u_8.Component.Body.ItemDisplay.ImageLabel)
        p_u_8.Component.Body.DisplayName.Text = (v_u_7:Get(p_u_8.Season.Rebirth.Reward.Value) or {
            ["DisplayName"] = "Unknown Item"
        }).DisplayName
        task.spawn(function()
            -- upvalues: (copy) p_u_8
            local v23 = p_u_8.Component.Aura
            local v24 = v23.UIGradient
            while v23.Parent and v24.Parent do
                local v25 = task.wait() * 11
                v23.Rotation = v23.Rotation + v25
                v24.Rotation = v24.Rotation - v25 * 3
            end
        end)
    end
end