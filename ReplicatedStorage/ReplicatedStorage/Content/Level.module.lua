-- Decompiled game.ReplicatedStorage.Content.Level

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Content.Reward)
local v_u_3 = require(script.Preset)
local v_u_4 = require(script.Base)
local v_u_18 = {
    ["Random"] = Random.new(1),
    ["Amount"] = 300,
    ["PageFactor"] = 1.5,
    ["PageSize"] = 25,
    ["AbilityEvery"] = 15,
    ["getRewards"] = function()
        -- upvalues: (copy) v_u_18
        if v_u_18.Rewards then
            return v_u_18.Rewards
        end
        local v5 = {}
        for v6 = 1, v_u_18.Amount do
            local v7 = v_u_18.getReward
            table.insert(v5, v7(v6))
        end
        v_u_18.Rewards = v5
        return v5
    end,
    ["getReward"] = function(p8)
        -- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_18, (copy) v_u_2
        if v_u_3[p8] then
            return v_u_3[p8]
        end
        local v9 = (p8 - 1) % #v_u_4 + 1
        local v10 = p8 / v_u_18.PageSize
        local v11 = math.floor(v10)
        local v12 = v_u_4[v9].Type
        if p8 % v_u_18.AbilityEvery == 0 and v12 == v_u_2.Type.LuckyStyleSpins then
            v12 = v_u_2.Type.LuckyAbilitySpins
        end
        local v13 = v_u_2.new
        local v14 = {
            ["Type"] = v12
        }
        local v15 = v_u_4[v9].Value
        local v16 = (v11 + 1) / v_u_18.PageFactor
        local v17 = v15 * math.round(v16)
        v14.Value = math.round(v17)
        return v13(v14)
    end
}
return v_u_18