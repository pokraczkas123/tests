-- Decompiled game.ReplicatedStorage.Content.Quest.Qualifier.Requirement

local v1 = {}
v1.__index = v1
function v1.new(p2)
    local v3 = p2.Id
    local v4 = type(v3) == "string"
    assert(v4, "Type.new - params.Id must be a string")
    local v5 = p2.Description
    local v6 = type(v5) == "function"
    assert(v6, "Type.new - params.Description must be a function")
    local v7 = p2.Validator
    local v8 = type(v7) == "function"
    assert(v8, "Type.new - params.Validate must be a function")
    return {
        ["Id"] = p2.Id,
        ["validate"] = p2.Validator,
        ["description"] = p2.Description
    }
end
return v1