-- Decompiled game.ReplicatedStorage.Content.Mastery

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Tools.Factory).new(script.Entities, "Mastery")
require(script.MasteryLevel)
local v_u_3 = setmetatable({}, {
    ["__index"] = v2
})
function v_u_3.new(p4)
    -- upvalues: (copy) v_u_3
    local v5 = v_u_3:Create(p4)
    local v6 = v5.Levels
    assert(v6, "Failed to create Mastery. Missing \'Levels\' field.")
    return v5
end
return v_u_3