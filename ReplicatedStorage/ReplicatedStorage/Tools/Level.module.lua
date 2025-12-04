-- Decompiled game.ReplicatedStorage.Tools.Level

local v_u_1 = require(script.Configuration)
local v_u_21 = {
    ["evaluateExperience"] = function(p2)
        -- upvalues: (copy) v_u_1
        local v3 = 0
        for v4, v5 in pairs(p2) do
            v3 = v3 + v5 * (v_u_1.ExperienceWeightMap[v4] or v_u_1.ExperienceWeightMap.Default)
        end
        return math.floor(v3)
    end,
    ["fromExperience"] = function(p6)
        -- upvalues: (copy) v_u_1
        local v7 = (p6 / v_u_1.Equation.Scale) ^ (1 / v_u_1.Equation.Power)
        local v8 = math.floor(v7)
        return math.max(1, v8)
    end,
    ["toExperience"] = function(p9)
        -- upvalues: (copy) v_u_1
        local v10 = v_u_1.Equation.Scale * p9 ^ v_u_1.Equation.Power
        return math.ceil(v10)
    end,
    ["getProgress"] = function(p11)
        -- upvalues: (copy) v_u_21
        local v12 = v_u_21.fromExperience(p11)
        local v13 = v_u_21.toExperience(v12 + 1)
        local v14 = v12 == 1 and 0 or v_u_21.toExperience(v12)
        local v15 = (p11 - v14) / (v13 - v14)
        return math.clamp(v15, 0, 1)
    end,
    ["getExperienceNeeded"] = function(p16, p17)
        -- upvalues: (copy) v_u_21
        local v18 = v_u_21.fromExperience(p16)
        local v19 = v_u_21.toExperience
        local v20 = v18 + 1
        return v19((math.max(p17 or 0, v20))) - p16
    end
}
return v_u_21