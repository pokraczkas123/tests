-- Decompiled game.ReplicatedStorage.Content.Crate

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Content.Lottery)
local v3 = {
    ["__index"] = require(v1.Tools.Factory).new(script)
}
local v_u_4 = setmetatable({}, v3)
function v_u_4.new(p5)
    -- upvalues: (copy) v_u_4, (copy) v_u_2
    local v6 = v_u_4:Create(p5)
    local v7 = v6.Content
    assert(v7, "Failed to create crate. Missing \'Content\' field.")
    local v8 = v6.Cost
    assert(v8, "Failed to create crate. Missing \'Cost\' field.")
    local v9 = v_u_2.validate(v6.Content)
    assert(v9, "Failed to create crate. Invalid \'Content\' content.")
    v6.DisplayName = v6.DisplayName or v6.Id
    return v6
end
return v_u_4