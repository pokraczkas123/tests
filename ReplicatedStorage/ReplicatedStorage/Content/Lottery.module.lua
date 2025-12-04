-- Decompiled game.ReplicatedStorage.Content.Lottery

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Content.Item)
local v_u_3 = require(v1.Tools.Logger).new(script.Name)
return {
    ["new"] = function(p4)
        local v5 = typeof(p4) == "table"
        assert(v5, "Failed to create lottery. Invalid \'content\' type.")
        local v6 = #p4 > 0
        assert(v6, "Failed to create lottery. Missing \'content\' content.")
        return p4
    end,
    ["validate"] = function(p7)
        -- upvalues: (copy) v_u_2, (copy) v_u_3
        local v8 = 0
        for _, v9 in ipairs(p7) do
            if v9.Type == "Item" and not v_u_2:Get(v9.Value) then
                v_u_3:Warn((("Item \'%*\' does not exist!"):format(v9.Value)))
            end
            v8 = v8 + v9.Chance
        end
        local v10 = v8 - 1
        local v11 = math.abs(v10) < 1e-6
        if not v11 then
            v_u_3:Warn("Failed to validate lottery. Invalid \'Chance\' content.")
        end
        return v11
    end,
    ["evaluate"] = function(p12)
        local v13 = math.random(1, 1000000) / 1000000
        local v14 = 0
        for v15, v16 in ipairs(p12) do
            v14 = v14 + v16.Chance
            if v13 <= v14 then
                return v16, v15
            end
        end
    end
}