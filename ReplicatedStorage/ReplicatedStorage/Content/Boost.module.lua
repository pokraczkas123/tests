-- Decompiled game.ReplicatedStorage.Content.Boost

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Tools.Factory).new(script)
local v3 = {
    ["Type"] = {
        ["Multiplier"] = "Multiplier",
        ["Physics"] = "Physics"
    }
}
local v4 = setmetatable(v3, {
    ["__index"] = v_u_2
})
function v4.new(p5)
    -- upvalues: (copy) v_u_2
    local v6 = p5.Type
    assert(v6, "Failed to create item. Missing \'Type\' field.")
    return v_u_2:Create(p5)
end
function v4.GetAllFromType(p7, p8)
    local v9 = {}
    for _, v10 in pairs(p7:GetAll()) do
        if v10.Type == p8 then
            table.insert(v9, v10)
        end
    end
    return v9
end
return v4