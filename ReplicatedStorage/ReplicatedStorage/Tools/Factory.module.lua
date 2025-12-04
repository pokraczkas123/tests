-- Decompiled game.ReplicatedStorage.Tools.Factory

local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new(p2, p3)
    -- upvalues: (copy) v_u_1
    local v4 = {
        ["_name"] = p3 or p2.Name,
        ["_directory"] = p2,
        ["_cache"] = {}
    }
    local v5 = v_u_1
    return setmetatable(v4, v5)
end
function v_u_1.Create(p6, p7)
    local v8 = typeof(p7) == "table"
    local v9 = ("Failed to create %*. %* must be a table."):format(p6._name, p6._name)
    assert(v8, v9)
    local v10 = p7.Id
    local v11 = typeof(v10) == "string"
    local v12 = ("Failed to create %*. %* must have an \'Id\' field."):format(p6._name, p6._name)
    assert(v11, v12)
    local v13 = p7.DisplayName
    local v14 = typeof(v13) == "string" and true or p7.DisplayName == nil
    local v15 = ("Failed to create %*. DisplayName must be a string or nil."):format(p6._name)
    assert(v14, v15)
    local v16 = p7.Description
    local v17 = typeof(v16) == "string" and true or p7.Description == nil
    local v18 = ("Failed to create %*. Description must be a string or nil."):format(p6._name)
    assert(v17, v18)
    local v19 = p7.Rarity
    local v20 = typeof(v19) == "number" and true or p7.Rarity == nil
    local v21 = ("Failed to create %*. Rarity must be a number or nil."):format(p6._name)
    assert(v20, v21)
    p7.DisplayName = p7.DisplayName or p7.Id
    p6._cache[p7.Id] = p7
    return p7
end
function v_u_1.Get(p22, p23)
    if p23 then
        if p22._cache[p23] then
            return p22._cache[p23]
        end
        for _, v24 in ipairs(p22._directory:GetChildren()) do
            local v25 = require(v24)
            if v25.Id == p23 then
                return v25
            end
        end
    end
end
function v_u_1.GetAll(p26)
    local v27 = {}
    for _, v28 in ipairs(p26._directory:GetChildren()) do
        local v29 = v28.Name
        table.insert(v27, p26:Get(v29))
    end
    return v27
end
function v_u_1.GetAllIds(p30)
    local v31 = {}
    for _, v32 in ipairs(p30:GetAll()) do
        local v33 = v32.Id
        table.insert(v31, v33)
    end
    return v31
end
function v_u_1.GetByDisplayName(p34, p35)
    local v36 = typeof(p35) == "string"
    local v37 = ("Failed to get %* by display name, expected string, got %*"):format(p34._name, (typeof(p35)))
    assert(v36, v37)
    local v38 = p35:lower()
    for _, v39 in pairs(p34:GetAll()) do
        if v39.DisplayName:lower():sub(1, #v38) == v38 then
            return v39
        end
    end
end
return v_u_1