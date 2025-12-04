-- Decompiled game.ReplicatedStorage.Content.Mastery.MasteryQuest

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Content.Quest)
local v_u_3 = require(v1.Content.Quest.Qualifier)
local v_u_12 = {
    ["Cache"] = {},
    ["new"] = function(p_u_4)
        -- upvalues: (copy) v_u_12, (copy) v_u_3, (copy) v_u_2
        if v_u_12.Cache[p_u_4] then
            return v_u_12.Cache[p_u_4]
        end
        local v10 = {
            ["new"] = function(p5)
                -- upvalues: (ref) v_u_3, (copy) p_u_4, (ref) v_u_2
                p5.IgnoreReward = true
                p5.Qualifiers = p5.Qualifiers or {}
                local v6 = p5.Qualifiers
                local v7 = v_u_3.new
                local v8 = v_u_3.Requirement.Mastery
                local v9 = {
                    ["MasteryId"] = p_u_4
                }
                table.insert(v6, v7(v8, v9))
                return v_u_2.new(p5)
            end
        }
        local v11 = {
            ["__index"] = v_u_2
        }
        v_u_12.Cache[p_u_4] = setmetatable(v10, v11)
        return v_u_12.Cache[p_u_4]
    end
}
return v_u_12