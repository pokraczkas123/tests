-- Decompiled game.ReplicatedStorage.Content.Quest.Qualifier

require(script.Requirement)
local v1 = require(script.Requirements)
local v_u_8 = {
    ["Field"] = require(script.Fields),
    ["Requirement"] = v1,
    ["new"] = function(p2, p3)
        local v4 = type(p2) == "table"
        assert(v4, "Qualifier.new - requirement must be a table")
        local v5 = type(p3) == "table" and true or p3 == nil
        assert(v5, "Qualifier.new - params must be a table or nil")
        return {
            ["validate"] = p2.validate,
            ["description"] = p2.description,
            ["Id"] = p2.Id,
            ["Params"] = p3
        }
    end,
    ["serialize"] = function(p6)
        return {
            ["Id"] = p6.Id,
            ["Params"] = p6.Params
        }
    end,
    ["deserialize"] = function(p7)
        -- upvalues: (copy) v_u_8
        return v_u_8.new(v_u_8.Requirement[p7.Id], p7.Params)
    end
}
return v_u_8