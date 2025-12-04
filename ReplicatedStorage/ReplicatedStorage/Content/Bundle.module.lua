-- Decompiled game.ReplicatedStorage.Content.Bundle

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Tools.Factory).new(script)
local v_u_3 = require(v1.Tools.Timestamp)
require(v1.Content.Reward)
local v_u_4 = setmetatable({}, {
    ["__index"] = v2
})
function v_u_4.new(p5)
    -- upvalues: (copy) v_u_4, (copy) v_u_3
    local v6 = v_u_4:Create(p5)
    local v7 = v6.Image
    assert(v7, "Failed to create Bundle. Missing \'Image\' field.")
    local v8 = v6.Color
    assert(v8, "Failed to create Bundle. Missing \'Color\' field.")
    local v9 = v6.Timestamp
    assert(v9, "Failed to create Bundle. Missing \'Timestamp\' field.")
    local v10 = v6.Rewards
    assert(v10, "Failed to create Bundle. Missing \'Rewards\' field.")
    v6.Timestamp = v_u_3.new({
        ["Start"] = v6.Timestamp.Start,
        ["End"] = v6.Timestamp.End
    })
    return v6
end
function v_u_4.isActive(p11)
    -- upvalues: (copy) v_u_3
    return v_u_3.isActive(p11.Timestamp)
end
function v_u_4.GetActive(p12)
    -- upvalues: (copy) v_u_4
    local v13 = {}
    for _, v14 in ipairs(p12:GetAll()) do
        if v_u_4.isActive(v14) then
            table.insert(v13, v14)
        end
    end
    return v13
end
return v_u_4