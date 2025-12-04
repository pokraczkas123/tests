-- Decompiled game.ReplicatedFirst.Controllers.ChallengeController.RewardsTrack.ItemBtn

local v_u_1 = Color3.fromRGB(3, 198, 0)
local v_u_2 = Color3.fromRGB(0, 0, 0)
local v_u_3 = Color3.fromRGB(0, 0, 0)
local v_u_4 = Color3.fromRGB(68, 255, 0)
local v5 = game:GetService("ReplicatedFirst")
local v6 = game:GetService("ReplicatedStorage")
local v_u_7 = nil
local v_u_8 = nil
local v_u_9 = require(v6.Packages.Knit)
local v_u_10 = require(v6.Packages.Fusion)
local v_u_11 = require(v5.Components.Button)
local v_u_12 = require(v6.Content.Reward)
local v_u_13 = require(v6.Content.ChallengeRewards)
return function(p_u_14)
    -- upvalues: (ref) v_u_7, (copy) v_u_9, (ref) v_u_8, (copy) v_u_10, (copy) v_u_13, (copy) v_u_12, (copy) v_u_1, (copy) v_u_2, (copy) v_u_3, (copy) v_u_4, (copy) v_u_11
    v_u_7 = v_u_7 or v_u_9.GetService("ChallengeService")
    v_u_8 = v_u_8 or v_u_9.GetController("InterfaceController")
    local v_u_17 = v_u_10.Computed(function()
        -- upvalues: (copy) p_u_14
        local v15 = p_u_14.ChallengesData:get().Claimed or {}
        local v16 = p_u_14.LevelIndex
        return v15[tostring(v16)]
    end)
    local v_u_18 = v_u_10.Computed(function()
        -- upvalues: (copy) v_u_17
        return v_u_17:get() ~= nil
    end)
    local v_u_19 = nil
    local v_u_25 = v_u_10.Computed(function()
        -- upvalues: (copy) v_u_17, (ref) v_u_13, (ref) v_u_12, (copy) p_u_14, (ref) v_u_8, (ref) v_u_19
        local v20 = v_u_17:get()
        local v21
        if v20 then
            local v22 = v_u_13:Get(v20.Id)
            v21 = v_u_12.new({
                ["Type"] = v22.Type,
                ["Value"] = v22.Value or 1
            })
        else
            if p_u_14.LevelIndex > (p_u_14.ChallengesData:get().Wins or 0) + 1 then
                return nil
            end
            v_u_8.DynamicTimestamp:get()
            local v23 = v_u_13:GetAllIds()
            local v24 = v_u_13:Get(v23[math.random(1, #v23)])
            v21 = v_u_12.new({
                ["Type"] = v24.Type,
                ["Value"] = v24.Value or 1
            })
        end
        if v_u_19 and v_u_19.Parent == p_u_14.Component.Icon then
            v_u_19:Destroy()
        end
        v_u_19 = v_u_12.setIcon(v21, p_u_14.Component.Icon)
        return v21
    end)
    local v26 = v_u_10.Hydrate(p_u_14.Component.ProgNumber)
    local v27 = {}
    local v28 = p_u_14.LevelIndex
    v27.Text = tostring(v28)
    v27.BackgroundColor3 = v_u_10.Computed(function()
        -- upvalues: (copy) v_u_18, (ref) v_u_1, (ref) v_u_2
        return v_u_18:get() and v_u_1 or v_u_2
    end)
    v27.TextColor3 = v_u_10.Computed(function()
        -- upvalues: (copy) v_u_18, (ref) v_u_3, (ref) v_u_4
        return v_u_18:get() and v_u_3 or v_u_4
    end)
    v26(v27)
    v_u_10.Hydrate(p_u_14.Component.Quantity)({
        ["Text"] = v_u_10.Computed(function()
            -- upvalues: (copy) v_u_17
            local v29 = v_u_17:get()
            if not v29 then
                return ""
            end
            local v30 = v29.Quantity
            return tostring(v30)
        end),
        ["Visible"] = v_u_10.Computed(function()
            -- upvalues: (copy) v_u_17
            return v_u_17:get() ~= nil
        end)
    })
    v_u_10.Hydrate(p_u_14.Component.Icon)({
        ["Image"] = v_u_10.Computed(function()
            -- upvalues: (copy) v_u_25, (copy) p_u_14
            return not v_u_25:get() and "rbxassetid://116156811248307" or p_u_14.Component.Icon.Image
        end)
    })
    v_u_11(p_u_14.Component.ClaimBtn)({
        ["Visible"] = v_u_10.Computed(function()
            -- upvalues: (copy) v_u_18, (copy) p_u_14
            local v31 = not v_u_18:get()
            if v31 then
                v31 = (p_u_14.ChallengesData:get().Wins or 0) >= p_u_14.LevelIndex
            end
            return v31
        end),
        ["OnActivated"] = function()
            -- upvalues: (copy) v_u_18, (copy) p_u_14, (ref) v_u_7
            if not v_u_18:get() and (p_u_14.ChallengesData:get().Wins or 0) >= p_u_14.LevelIndex then
                v_u_7:ClaimReward(p_u_14.LevelIndex):expect()
            end
        end
    })
    p_u_14.Component.Visible = true
    return p_u_14.Component
end