-- Decompiled game.ReplicatedStorage.Content.Style

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Content.Rarity)
local v3 = require(v1.Tools.Factory).new(script)
local v_u_4 = require(v1.Tools.Timestamp)
local v5 = {
    ["Cost"] = 100,
    ["FillerCount"] = 15,
    ["RequiredSecretPitySpun"] = 2,
    ["ChanceBoost"] = 0.1,
    ["SlotCount"] = 11,
    ["SpinTweenInfo"] = TweenInfo.new(5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
    ["Rarity"] = v2,
    ["SecretMultipliers"] = {
        ["TiltPower"] = true
    },
    ["MaximumStats"] = {},
    ["MinimumStats"] = {}
}
local v_u_6 = setmetatable(v5, {
    ["__index"] = v3
})
function v_u_6.new(p7)
    -- upvalues: (copy) v_u_6
    local v8 = v_u_6:Create(p7)
    local v9 = v8.Number
    assert(v9, "Failed to create style. Missing \'Number\' field.")
    v8.DisplayName = v8.DisplayName or v8.Id
    v8.Multipliers.SpikePower = v8.Multipliers.SpikePower or 1
    v8.Multipliers.JumpPower = v8.Multipliers.JumpPower or 1
    v8.Multipliers.Speed = v8.Multipliers.Speed or 1
    v8.Multipliers.BumpPower = v8.Multipliers.BumpPower or 1
    v8.Multipliers.BlockPower = v8.Multipliers.BlockPower or 1
    v8.Multipliers.DiveSpeed = v8.Multipliers.DiveSpeed or 1
    v8.Multipliers.ServePower = v8.Multipliers.ServePower or 1
    v8.Multipliers.SetPower = v8.Multipliers.SetPower or 1
    v8.Multipliers.TiltPower = v8.Multipliers.TiltPower or 1
    for v10, v11 in pairs(v8.Multipliers) do
        local v12 = v_u_6.MaximumStats
        local v13 = v_u_6.MaximumStats[v10] or 0
        v12[v10] = math.max(v13, v11)
        local v14 = v_u_6.MinimumStats
        local v15 = v_u_6.MinimumStats[v10] or (1 / 0)
        v14[v10] = math.min(v15, v11)
    end
    if v8 and v8.Metadata and v8.Metadata.Timestamp then
        local v16 = v8.Metadata
        v16.Timestamp = v16.Timestamp - 600
    end
    return v8
end
function v_u_6.evaluateSecretPityTier(p17)
    -- upvalues: (copy) v_u_6
    local v18 = typeof(p17) == "number"
    local v19 = "Failed to get secret pity tier, expected number, got " .. typeof(p17)
    assert(v18, v19)
    return math.floor(p17) % (v_u_6.RequiredSecretPitySpun + 1)
end
function v_u_6.isExpired(p20)
    -- upvalues: (copy) v_u_4
    return p20 and p20.Metadata and p20.Metadata.Timestamp and v_u_4.hasEnded(p20.Metadata.Timestamp) or false
end
function v_u_6.GetActive(p21, p22)
    -- upvalues: (copy) v_u_6
    local v23 = {}
    for _, v24 in pairs(p21:GetAll()) do
        if not v_u_6.isExpired(v24) and (not p22 or p22 == v24.Rarity) then
            table.insert(v23, v24)
        end
    end
    return v23
end
function v_u_6.GetActiveIds(p25, p26)
    local v27 = {}
    for _, v28 in pairs(p25:GetActive(p26)) do
        local v29 = v28.Id
        table.insert(v27, v29)
    end
    return v27
end
return v_u_6