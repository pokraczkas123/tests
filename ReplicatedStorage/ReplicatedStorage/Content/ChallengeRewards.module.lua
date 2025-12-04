-- Decompiled game.ReplicatedStorage.Content.ChallengeRewards

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Tools.Factory).new(script)
local v3 = {
    ["Type"] = require(v1.Content.Reward).Type,
    ["MaxLevel"] = 50,
    ["MaxStrikes"] = 3,
    ["RetryCost"] = 1000,
    ["Timestamp"] = DateTime.fromUniversalTime(2025, 11, 29, 16, 30, 0).UnixTimestamp
}
local v_u_4 = setmetatable(v3, {
    ["__index"] = v2
})
function v_u_4.new(p5)
    -- upvalues: (copy) v_u_4
    return v_u_4:Create(p5)
end
return v_u_4