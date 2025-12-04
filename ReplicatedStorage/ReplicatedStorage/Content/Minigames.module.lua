-- Decompiled game.ReplicatedStorage.Content.Minigames

local v1 = game:GetService("ReplicatedStorage")
local v2 = {
    ["__index"] = require(v1.Tools.Factory).new(script)
}
local v_u_3 = setmetatable({}, v2)
function v_u_3.new(p4)
    -- upvalues: (copy) v_u_3
    return v_u_3:Create(p4)
end
return v_u_3